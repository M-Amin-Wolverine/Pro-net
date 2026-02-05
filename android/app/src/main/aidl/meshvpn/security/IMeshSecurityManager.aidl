// فایل: android/app/src/main/aidl/meshvpn/security/IMeshSecurityManager.aidl
package meshvpn.security;

import android.os.Bundle;
import java.util.List;

/**
 * مدیریت امنیت چندلایه شبکه Mesh
 */
interface IMeshSecurityManager {
    
    // ==================== مدیریت رمزنگاری ====================
    
    /**
     * رمزنگاری داده با الگوریتم انتخابی
     */
    Bundle encryptData(in byte[] plainData, in EncryptionConfig config);
    
    /**
     * رمزگشایی داده
     */
    byte[] decryptData(in Bundle encryptedData, in String keyId);
    
    /**
     * ایجاد جفت کلید جدید
     */
    Bundle generateKeyPair(in String algorithm, in int keySize);
    
    /**
     * چرخش دوره‌ای کلیدها
     */
    boolean rotateKeys(in Bundle rotationPolicy);
    
    /**
     * ذخیره امن کلیدها
     */
    boolean storeKeysSecurely(in Bundle keyStoreConfig);
    
    // ==================== مبهم‌سازی (Obfuscation) ====================
    
    /**
     * مبهم‌سازی ترافیک
     */
    Bundle obfuscateTraffic(in byte[] originalData, in ObfuscationMethod method);
    
    /**
     * بازسازی ترافیک مبهم شده
     */
    byte[] deobfuscateTraffic(in Bundle obfuscatedData, in String method);
    
    /**
     * انتخاب خودکار روش مبهم‌سازی
     */
    String selectOptimalObfuscation(in NetworkConditions conditions);
    
    /**
     * تست مقاومت مبهم‌سازی در برابر DPI
     */
    Bundle testObfuscationResistance(in String method, in String testServer);
    
    // =================%= پروتکل‌های امنیتی ====================
    
    /**
     * فعال‌سازی پروتکل WireGuard-like
     */
    boolean enableWireGuardProtocol(in Bundle wgConfig);
    
    /**
     * فعال‌سازی پروتکل Noise Protocol
     */
    boolean enableNoiseProtocol(in Bundle noiseConfig);
    
    /**
     * فعال‌سازی پروتکل Double Ratchet
     */
    boolean enableDoubleRatchet(in Bundle ratchetConfig);
    
    /**
     * ایجاد تونل امن چندلایه
     */
    Bundle createMultiLayerTunnel(in LayerConfig[] layers);
    
    // =================%= مدیریت گواهی‌ها ====================
    
    /**
     * ایجاد گواهی دیجیتال
     */
    Bundle generateCertificate(in CertificateRequest request);
    
    /**
     * تایید گواهی
     */
    boolean verifyCertificate(in Bundle certificate, in String caPublicKey);
    
    /**
     * ایجاد زنجیره اعتماد
     */
    Bundle buildTrustChain(in String[] peerIds);
    
    /**
     * اعتبارسنجی گواهی‌ها
     */
    boolean validateCertificates(in Bundle[] certificates);
    
    // =================%= تشخیص و مقابله با تهدیدات ====================
    
    /**
     * مانیتورینگ الگوی ترافیک مشکوک
     */
    boolean monitorTrafficPatterns(in TrafficPattern patterns);
    
    /**
     * تشخیص حمله MITM
     */
    Bundle detectMitmAttack(in Bundle trafficSample);
    
    /**
     * تشخیص حمله Replay
     */
    boolean detectReplayAttack(in Bundle packetSequence);
    
    /**
     * فعال‌سازی ضدحمله
     */
    boolean activateCountermeasures(in ThreatInfo threat);
    
    /**
     * جداسازی نود آلوده
     */
    boolean isolateCompromisedNode(String peerId, in Bundle evidence);
    
    // =================%= آنالیز امنیتی ====================
    
    /**
     * اسکن آسیب‌پذیری‌ها
     */
    Bundle scanVulnerabilities(in ScanConfig config);
    
    /**
     * ارزیابی ریسک امنیتی
     */
    Bundle assessSecurityRisk(in RiskAssessmentParams params);
    
    /**
     * تست نفوذپذیری
     */
    Bundle performPenetrationTest(in TestScenario scenario);
    
    /**
     * شبیه‌سازی حملات
     */
    Bundle simulateAttack(in AttackSimulation simulation);
    
    // =================%= مدیریت نشست‌های امن ====================
    
    /**
     * ایجاد نشست امن
     */
    Bundle createSecureSession(in SessionParams params);
    
    /**
     * تجدید نشست
     */
    boolean renewSession(String sessionId, in Bundle newParams);
    
    /**
     * پایان نشست
     */
    boolean terminateSession(String sessionId, in String reason);
    
    /**
     * اعتبارسنجی نشست
     */
    boolean validateSession(String sessionId);
    
    // =================%= مبهم‌سازی پیشرفته ====================
    
    /**
     * فعال‌سازی Domain Fronting
     */
    boolean enableDomainFronting(in String frontDomain, in String realDomain);
    
    /**
     * فعال‌سازی مکانیزم Snowflake
     */
    boolean enableSnowflake(in Bundle snowflakeConfig);
    
    /**
     * فعال‌سازی مکانیزم Meek
     */
    boolean enableMeek(in Bundle meekConfig);
    
    /**
     * مبهم‌سازی پروتکل (obfs4)
     */
    boolean enableObfs4(in Bundle obfs4Config);
    
    // =================%= امنیت سخت‌افزاری ====================
    
    /**
     * استفاده از TPM (Trusted Platform Module)
     */
    boolean useHardwareSecurityModule(in Bundle hsmConfig);
    
    /**
     * فعال‌سازی Secure Enclave
     */
    boolean enableSecureEnclave(in Bundle enclaveConfig);
    
    /**
     * استفاده از پردازنده‌های رمزنگاری
     */
    boolean useCryptoAccelerator(in Bundle acceleratorConfig);
    
    // =================%= مدیریت خطمشی امنیتی ====================
    
    /**
     * اعمال خطمشی امنیتی
     */
    boolean applySecurityPolicy(in SecurityPolicy policy);
    
    /**
     * به‌روزرسانی خطمشی
     */
    boolean updateSecurityPolicy(in Bundle policyUpdate);
    
    /**
     * اجرای انطباق امنیتی
     */
    Bundle enforceCompliance(in ComplianceRule[] rules);
    
    // =================%= لاگ و حسابرسی امنیتی ====================
    
    /**
     * ثبت رویداد امنیتی
     */
    boolean logSecurityEvent(in SecurityEvent event);
    
    /**
     * دریافت لاگ‌های امنیتی
     */
    List<Bundle> getSecurityLogs(in LogQuery query);
    
    /**
     * ایجاد گزارش حسابرسی
     */
    Bundle generateAuditReport(in AuditParams params);
    
    // =================%= پاسخ به حوادث امنیتی ====================
    
    /**
     * فعال‌سازی حالت اضطراری
     */
    boolean activateEmergencyMode(in EmergencyPlan plan);
    
    /**
     * پاک‌سازی امن داده‌ها
     */
    boolean secureWipe(in WipeSpecification spec);
    
    /**
     * بازیابی از حادثه امنیتی
     */
    Bundle recoverFromIncident(in IncidentReport report);
    
    // =================%= APIهای پیشرفته ====================
    
    /**
     * محاسبه هش امن
     */
    String calculateSecureHash(in byte[] data, in String algorithm);
    
    /**
     * تولید عدد تصادفی امن
     */
    byte[] generateSecureRandom(int length);
    
    /**
     * مخلوط‌کننده ترافیک (Mix Network)
     */
    Bundle mixTraffic(in Bundle[] packets, in MixConfig config);
    
    /**
     * زمان‌بندی ترافیک برای جلوگیری از تحلیل
     */
    Bundle scheduleTraffic(in Bundle traffic, in ScheduleConfig config);
}
