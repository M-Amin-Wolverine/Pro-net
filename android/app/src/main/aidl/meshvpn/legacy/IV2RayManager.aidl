// فایل: android/app/src/main/aidl/meshvpn/legacy/IV2RayManager.aidl
package meshvpn.legacy;

import android.os.Bundle;
import java.util.List;

/**
 * مدیریت کامل پروتکل V2Ray/V2Fly/Xray با پشتیبانی از تمام کانفیگ‌ها
 */
interface IV2RayManager {
    
    // =================%= مدیریت کانفیگ‌ها ====================
    
    /**
     * بارگیری کانفیگ V2Ray (VMess, VLESS, Trojan, Shadowsocks)
     */
    Bundle loadV2RayConfig(in String configJson, in ConfigType type);
    
    /**
     * تبدیل لینک اشتراک به کانفیگ
     */
    Bundle parseShareLink(in String shareLink);
    
    /**
     * اعتبارسنجی کانفیگ
     */
    boolean validateConfig(in Bundle v2rayConfig);
    
    /**
     * بهینه‌سازی خودکار کانفیگ
     */
    Bundle autoOptimizeConfig(in Bundle originalConfig, in NetworkConditions conditions);
    
    // =================%= پروتکل VMess ====================
    
    /**
     * ایجاد کانفیگ VMess
     */
    Bundle createVMessConfig(in VMessParams params);
    
    /**
     * مدیریت کاربران VMess
     */
    Bundle manageVMessUsers(in UserManagementRequest request);
    
    /**
     * چرخش UUIDهای VMess
     */
    boolean rotateVMessUuids(in RotationSchedule schedule);
    
    /**
     * پشتیبانی از VMess AEAD
     */
    boolean enableVMessAead(in AeadConfig config);
    
    // =================%= پروتکل VLESS ====================
    
    /**
     * ایجاد کانفیگ VLESS
     */
    Bundle createVLessConfig(in VLessParams params);
    
    /**
     * مدیریت flowهای VLESS (xtls-rprx-vision, ...)
     */
    Bundle manageVLessFlows(in String[] flowTypes, in FlowConfig config);
    
    /**
     * پشتیبانی از REALITY Protocol
     */
    Bundle enableRealityProtocol(in RealityConfig config);
    
    /**
     * مدیریت SNI و Fingerprint
     */
    Bundle manageTlsSettings(in TlsSettings settings);
    
    // =================%= پروتکل Trojan ====================
    
    /**
     * ایجاد کانفیگ Trojan
     */
    Bundle createTrojanConfig(in TrojanParams params);
    
    /**
     * مدیریت پسوردهای Trojan
     */
    Bundle manageTrojanPasswords(in PasswordManagementRequest request);
    
    /**
     * پشتیبانی از Trojan-Go
     */
    Bundle enableTrojanGoFeatures(in TrojanGoConfig config);
    
    // =================%= پروتکل Shadowsocks ====================
    
    /**
     * ایجاد کانفیگ Shadowsocks
     */
    Bundle createShadowsocksConfig(in ShadowsocksParams params);
    
    /**
     * مدیریت متدهای رمزنگاری
     */
    Bundle manageEncryptionMethods(in String[] methods, in MethodConfig config);
    
    /**
     * پشتیبانی از Shadowsocks 2022
     */
    Bundle enableShadowsocks2022(in Shadowsocks2022Config config);
    
    /**
     * پلاگین‌های Shadowsocks (obfs, v2ray-plugin)
     */
    Bundle manageShadowsocksPlugins(in PluginConfig config);
    
    // =================%= Transport Layers ====================
    
    /**
     * تنظیمات WebSocket
     */
    Bundle configureWebSocket(in WebSocketConfig config);
    
    /**
     * تنظیمات HTTP/2
     */
    Bundle configureHttp2(in Http2Config config);
    
    /**
     * تنظیمات gRPC
     */
    Bundle configureGrpc(in GrpcConfig config);
    
    /**
     * تنظیمات QUIC
     */
    Bundle configureQuic(in QuicConfig config);
    
    /**
     * تنظیمات mkcp
     */
    Bundle configureMkcp(in MkcpConfig config);
    
    // =================%= مبهم‌سازی ====================
    
    /**
     * فعال‌سازی TLS
     */
    Bundle enableTlsObfuscation(in TlsObfuscationConfig config);
    
    /**
     * فعال‌سازی WebSocket obfuscation
     */
    Bundle enableWebSocketObfuscation(in WsObfuscationConfig config);
    
    /**
     * Domain Fronting
     */
    Bundle enableDomainFronting(in DomainFrontingConfig config);
    
    /**
     * پروتکل伪装 (Camouflage)
     */
    Bundle enableProtocolCamouflage(in CamouflageConfig config);
    
    // =================%= Routing Rules ====================
    
    /**
     * مدیریت قوانین مسیریابی
     */
    Bundle manageRoutingRules(in RoutingRules rules);
    
    /**
     * GeoIP و Domain-based routing
     */
    Bundle configureGeoRouting(in GeoRoutingConfig config);
    
    /**
     * DNS routing و Fake DNS
     */
    Bundle configureDnsRouting(in DnsRoutingConfig config);
    
    /**
     * Load Balancing بین outbounds
     */
    Bundle configureLoadBalancing(in LoadBalancingConfig config);
    
    // =================%= DNS Settings ====================
    
    /**
     * تنظیمات DNS پیشرفته
     */
    Bundle configureDns(in DnsConfig config);
    
    /**
     * DoH/DoT/DoQ
     */
    Bundle enableSecureDns(in SecureDnsConfig config);
    
    /**
     * Fake DNS
     */
    Bundle enableFakeDns(in FakeDnsConfig config);
    
    /**
     * DNS کش
     */
    Bundle configureDnsCache(in DnsCacheConfig config);
    
    // =================%= APIهای مانیتورینگ ====================
    
    /**
     * آمار real-time V2Ray
     */
    Bundle getV2RayStats(in StatsRequest request);
    
    /**
     * مانیتورینگ اتصالات
     */
    Bundle monitorConnections(in MonitorConfig config);
    
    /**
     * لاگ‌های V2Ray
     */
    List<Bundle> getV2RayLogs(in LogLevel level, in int maxEntries);
    
    /**
     * تست سرعت و latency
     */
    Bundle runSpeedTest(in SpeedTestConfig config);
    
    // =================%= APIهای مدیریتی ====================
    
    /**
     * شروع/توقف سرویس V2Ray
     */
    boolean controlV2RayService(in ServiceCommand command);
    
    /**
     * به‌روزرسانی core V2Ray/Xray
     */
    Bundle updateV2RayCore(in UpdateConfig config);
    
    /**
     * مدیریت GeoIP/GeoSite databases
     */
    Bundle manageGeoDatabases(in GeoDbConfig config);
    
    /**
     * پیکربندی API server
     */
    Bundle configureApiServer(in ApiServerConfig config);
    
    // =================%= APIهای پیشرفته ====================
    
    /**
     * ساخت زنجیره V2Ray (multi-hop)
     */
    Bundle createV2RayChain(in ChainConfig config);
    
    /**
     * Failover خودکار بین سرورها
     */
    Bundle enableAutoFailover(in FailoverConfig config);
    
    /**
     * تست مقاومت در برابر DPI
     */
    Bundle testDpiResistance(in DpiTestConfig config);
    
    /**
     * بهینه‌سازی برای شبکه‌های محدود
     */
    Bundle optimizeForRestrictedNetworks(in OptimizationConfig config);
    
    // =================%= APIهای تبدیل ====================
    
    /**
     * تبدیل به کانفیگ‌های دیگر (Clash, Surfboard, etc.)
     */
    Bundle convertToOtherFormats(in String targetFormat, in Bundle v2rayConfig);
    
    /**
     * import از سایر کلاینت‌ها
     */
    Bundle importFromOtherClients(in String clientType, in Bundle clientConfig);
    
    /**
     * export به سایر فرمت‌ها
     */
    Bundle exportToShareLinks(in ExportFormat format, in Bundle v2rayConfig);
}
