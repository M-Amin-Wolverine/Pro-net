package meshvpn.adapter.psiphon;

import android.content.Context;
import android.os.Bundle;
import android.security.keystore.KeyGenParameterSpec;
import android.security.keystore.KeyProperties;

import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.MessageDigest;
import java.security.KeyStore;
import java.util.Base64;

import meshvpn.core.*;

/**
 * PsiphonMeshNode
 * -------------------------------------------------
 * God‑Tier Adaptive Gateway Node
 * Immutable Crypto Identity + Trust + Telemetry
 * Designed to be 10‑year future‑proof
 */
public final class PsiphonMeshNode {

    // ==================== Core ====================
    private final Context context;
    private final IMeshCoreManager meshManager;
    private MeshPeer psiphonPeer;

    // ==================== Identity ====================
    private static final String KEY_ALIAS = "meshvpn_psiphon_identity";
    private final String immutableNodeId;
    private final byte[] publicKeyHash;

    // ==================== State ====================
    private PsiphonState currentState = PsiphonState.DISCONNECTED;
    private final PsiphonMetrics metrics = new PsiphonMetrics();
    private final PsiphonTrustEvaluator trustEvaluator = new PsiphonTrustEvaluator();

    // ==================== Constructor ====================
    public PsiphonMeshNode(Context context, IMeshCoreManager meshManager) {
        this.context = context;
        this.meshManager = meshManager;

        KeyPair keyPair = loadOrCreateIdentityKey();
        this.publicKeyHash = hash(keyPair.getPublic().getEncoded());
        this.immutableNodeId = "mesh:psiphon:" + base58(publicKeyHash);

        registerPeer(keyPair);
    }

    // ==================== Identity ====================
    private KeyPair loadOrCreateIdentityKey() {
        try {
            KeyStore ks = KeyStore.getInstance("AndroidKeyStore");
            ks.load(null);

            if (!ks.containsAlias(KEY_ALIAS)) {
                KeyPairGenerator kpg = KeyPairGenerator.getInstance(
                        KeyProperties.KEY_ALGORITHM_EC, "AndroidKeyStore");

                kpg.initialize(new KeyGenParameterSpec.Builder(
                        KEY_ALIAS,
                        KeyProperties.PURPOSE_SIGN | KeyProperties.PURPOSE_VERIFY
                )
                        .setDigests(KeyProperties.DIGEST_SHA256)
                        .setUserAuthenticationRequired(false)
                        .build());

                return kpg.generateKeyPair();
            }

            KeyStore.PrivateKeyEntry entry =
                    (KeyStore.PrivateKeyEntry) ks.getEntry(KEY_ALIAS, null);
            return new KeyPair(entry.getCertificate().getPublicKey(), entry.getPrivateKey());

        } catch (Exception e) {
            throw new RuntimeException("Immutable identity init failed", e);
        }
    }

    // ==================== Peer Registration ====================
    private void registerPeer(KeyPair keyPair) {
        psiphonPeer = new MeshPeer();
        psiphonPeer.peerId = immutableNodeId;           // 🔒 Immutable
        psiphonPeer.nodeRole = NodeRole.GATEWAY;
        psiphonPeer.supportedProtocols = new String[]{
                "PSIPHON", "SOCKS5", "HTTP"
        };
        psiphonPeer.publicKey = Base64.getEncoder()
                .encodeToString(keyPair.getPublic().getEncoded());

        psiphonPeer.identityLevel = "CRYPTO_IMMUTABLE";
        psiphonPeer.trustAnchor = "HARDWARE_BACKED";

        meshManager.registerPeer(psiphonPeer);
    }

    // ==================== State Handling ====================
    public void onPsiphonState(Bundle state) {
        PsiphonState next = PsiphonStateMachine.transition(currentState, state);
        currentState = next;

        metrics.update(state);

        int trust = trustEvaluator.score(metrics);
        meshManager.updateGatewayHealth(psiphonPeer.peerId, metrics.toBundle());
        meshManager.updateGatewayTrust(psiphonPeer.peerId, trust);

        if (next == PsiphonState.CONNECTED) attach();
        if (next == PsiphonState.DEGRADED) throttle();
        if (next == PsiphonState.BLOCKED) rotateIdentityFingerprint();
        if (next == PsiphonState.DISCONNECTED) detach();
    }

    // ==================== Gateway Ops ====================
    private void attach() {
        GatewayConfig cfg = new GatewayConfig();
        cfg.setGatewayType("PSIPHON");
        cfg.setTrafficPolicy("EMERGENCY_ONLY");
        cfg.setCryptoIdentity(immutableNodeId);
        cfg.setTrustScore(trustEvaluator.score(metrics));

        meshManager.addExternalGateway(psiphonPeer.peerId, cfg);
    }

    private void detach() {
        meshManager.removeExternalGateway(psiphonPeer.peerId);
    }

    private void throttle() {
        meshManager.limitGatewayBandwidth(
                psiphonPeer.peerId,
                metrics.throughput / 2
        );
    }

    private void rotateIdentityFingerprint() {
        // هویت ثابت است ❌
        // فقط fingerprint شبکه‌ای rotate می‌شود ✔️
        meshManager.randomizeNetworkFingerprint(psiphonPeer.peerId);
    }

    // ==================== Crypto Utils ====================
    private static byte[] hash(byte[] data) {
        try {
            return MessageDigest.getInstance("SHA-256").digest(data);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private static String base58(byte[] input) {
        return java.util.UUID.nameUUIDFromBytes(input).toString();
    }

    // ==================== Inner Types ====================
    enum PsiphonState { CONNECTED, DEGRADED, BLOCKED, DISCONNECTED }

    static class PsiphonMetrics {
        int latency;
        int throughput;
        int dpiScore;

        void update(Bundle b) {
            latency = b.getInt("latency", 0);
            throughput = b.getInt("throughput", 0);
            dpiScore = b.getInt("dpi_score", 0);
        }

        Bundle toBundle() {
            Bundle b = new Bundle();
            b.putInt("latency", latency);
            b.putInt("throughput", throughput);
            b.putInt("dpi_score", dpiScore);
            return b;
        }
    }

    static class PsiphonTrustEvaluator {
        int score(PsiphonMetrics m) {
            int s = 100;
            s -= m.dpiScore;
            s -= m.latency / 15;
            if (m.throughput < 500) s -= 10;
            return Math.max(s, 0);
        }
    }

    static class PsiphonStateMachine {
        static PsiphonState transition(PsiphonState cur, Bundle b) {
            if (b.getBoolean("blocked")) return PsiphonState.BLOCKED;
            if (!b.getBoolean("connected")) return PsiphonState.DISCONNECTED;
            if (b.getInt("quality", 100) < 60) return PsiphonState.DEGRADED;
            return PsiphonState.CONNECTED;
        }
    }
}
