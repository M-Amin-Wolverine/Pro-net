// فایل: android/app/src/main/aidl/meshvpn/adapter/IProtocolBridge.aidl
package meshvpn.adapter;

import android.os.Bundle;
import meshvpn.core.MeshPeer;

/**
 * پل ارتباطی بین پروتکل‌های مختلف VPN و شبکه Mesh
 * قابلیت تبدیل هر پروتکل به فرمت Mesh و بالعکس
 */
/**
 * Ultimate Adaptive Protocol Bridge
 * ---------------------------------
 * Next‑Gen Anti‑Censorship / Mesh / VPN / Obfuscation Platform
 * Single‑file expanded interface (God Mode)
 */

interface IGodProtocolBridge {

    // =========================================================
    // 🌐 Network Context & Intelligence
    // =========================================================

    Bundle collectNetworkContext();
    Bundle detectCensorshipCapabilities(in Bundle networkContext);
    String detectFilteringType(in Bundle networkContext); 
    int estimateDpiAggressiveness(in Bundle networkContext);

    // =========================================================
    // 🧠 AI / Decision / Policy Engine
    // =========================================================

    Bundle recommendBestProtocol(in Bundle networkContext);
    Bundle recommendBestChain(in Bundle networkContext);

    void learnFromConnectionResult(in Bundle result);
    void updateDecisionPolicy(in Bundle policy);
    void resetLearningModel();

    // =========================================================
    // 🔌 Protocol Abstraction Layer
    // =========================================================

    Bundle protocolToMesh(in String protocol, in Bundle config);
    Bundle meshToProtocol(in String protocol, in MeshPeer peer, in Bundle params);

    Bundle bootstrapProtocol(in String protocol, in Bundle context);
    Bundle adaptProtocolRuntime(in String protocol, in Bundle liveMetrics);

    boolean protocolSupportsChaining(in String protocol);
    boolean protocolSupportsMultipath(in String protocol);
    boolean protocolSupportsDpiEvasion(in String protocol);

    // =========================================================
    // 🔗 Adaptive Chain Engine (Hot‑Swappable)
    // =========================================================

    String createAdaptiveChain(in Bundle chainPolicy);

    boolean addChainHop(
        in String chainId,
        in String protocol,
        in Bundle config,
        in int position
    );

    boolean removeChainHop(in String chainId, in String protocol);

    boolean hotSwapProtocol(
        in String chainId,
        in String fromProtocol,
        in String toProtocol,
        in Bundle newConfig
    );

    Bundle getLiveChainStatus(in String chainId);

    // =========================================================
    // 🕸️ Mesh / Global Routing
    // =========================================================

    Bundle registerMeshNode(in Bundle nodeProfile);
    Bundle discoverMeshNodes(in Bundle discoveryContext);

    Bundle computeOptimalMeshRoute(in Bundle meshContext);
    boolean rebalanceMeshTraffic(in Bundle rebalancePolicy);

    // =========================================================
    // 🧬 Psiphon / Tor / Restricted Network Bypass
    // =========================================================

    Bundle createMeshPsiphonChain(in Bundle chainConfig);
    Bundle obfuscateMeshViaPsiphon(in Bundle meshTraffic, in Bundle obfuscationConfig);

    Bundle discoverMeshViaPsiphon(in Bundle discoveryRequest);
    boolean migrateFromPsiphonToDirectMesh();

    // =========================================================
    // 🛡️ Obfuscation & DPI Evasion Engine
    // =========================================================

    Bundle applyObfuscationLayer(
        in Bundle traffic,
        in String method,
        in Bundle params
    );

    Bundle applyMultiLayerObfuscation(
        in Bundle traffic,
        in Bundle obfuscationProfile
    );

    Bundle randomizeTrafficFingerprint(in Bundle traffic);
    int evaluateDpiResistance(in Bundle traffic);

    // =========================================================
    // 🔀 Multipath / Traffic Engineering
    // =========================================================

    boolean enableMultipath(
        in String[] protocols,
        in Bundle loadBalancingPolicy
    );

    Bundle splitTraffic(in Bundle trafficRules);
    Bundle mergeTraffic(in Bundle trafficState);

    // =========================================================
    // 🔁 Auto‑Fallback & Self‑Healing
    // =========================================================

    boolean enableAutoFallback(in String[] fallbackChain);
    boolean triggerEmergencyFallback();

    Bundle selfHealConnection(in Bundle failureContext);

    // =========================================================
    // 📊 Telemetry / Monitoring / Health
    // =========================================================

    Bundle collectLiveMetrics(in Bundle metricFilter);
    Bundle computeHealthScore(in String chainId);

    Bundle detectTrafficAnomalies();
    Bundle exportTelemetry(in String target);

    // =========================================================
    // 📦 Profiles = Strategic Loadouts
    // =========================================================

    boolean saveStrategicProfile(in String name, in Bundle profile);
    Bundle loadStrategicProfile(in String name);

    Bundle autoSelectProfile(in Bundle networkContext);
    boolean syncProfilesEncrypted(in Bundle syncChannel);

    // =========================================================
    // 🧪 Simulation / Testing / Prediction
    // =========================================================

    Bundle simulateProtocol(in String protocol, in Bundle simulationParams);
    Bundle simulateChain(in Bundle chainDefinition);

    Bundle predictConnectionStability(in Bundle context);
    Bundle testDpiResistance(in String protocol, in String testTarget);

    // =========================================================
    // ⚙️ Low‑Level Control / Debug / Hooks
    // =========================================================

    Bundle executeProtocolCommand(
        in String protocol,
        in String command,
        in Bundle params
    );

    void registerRuntimeHook(in String event, in Bundle script);
    void enableLiveDebug(in int debugLevel);

    boolean resetProtocol(in String protocol);
    boolean shutdownAll();

}

