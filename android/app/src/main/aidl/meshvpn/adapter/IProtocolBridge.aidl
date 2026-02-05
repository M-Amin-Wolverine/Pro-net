// فایل: android/app/src/main/aidl/meshvpn/adapter/IProtocolBridge.aidl
package meshvpn.adapter;

import android.os.Bundle;
import meshvpn.core.MeshPeer;

/**
 * پل ارتباطی بین پروتکل‌های مختلف VPN و شبکه Mesh
 * قابلیت تبدیل هر پروتکل به فرمت Mesh و بالعکس
 */
interface IProtocolBridge {
    
    // ==================== تبدیل پروتکل‌ها به Mesh ====================
    
    /**
     * تبدیل کانفیگ WireGuard به Node Mesh
     */
    Bundle wireGuardToMesh(in String wgConfig, in String peerName);
    
    /**
     * تبدیل کانفیگ OpenVPN به Node Mesh
     */
    Bundle openVpnToMesh(in String ovpnConfig, in Bundle options);
    
    /**
     * تبدیل کانفیگ Shadowsocks به Node Mesh
     */
    Bundle shadowsocksToMesh(in String ssConfig, in boolean obfuscate);
    
    /**
     * تبدیل کانفیگ V2Ray/Xray به Node Mesh
     */
    Bundle v2rayToMesh(in String v2rayConfig, in int protocolType);
    
    /**
     * تبدیل کانفیگ Trojan به Node Mesh
     */
    Bundle trojanToMesh(in String trojanConfig, in String serverName);
    
    /**
     * تبدیل کانفیگ Psiphon به Node Mesh
     */
    Bundle psiphonToMesh(in Bundle psiphonState, in String region);
    
    // ==================== تبدیل Mesh به پروتکل‌ها ====================
    
    /**
     * تبدیل Node Mesh به کانفیگ WireGuard
     */
    String meshToWireGuard(in MeshPeer peer, in String privateKey);
    
    /**
     * تبدیل Node Mesh به کانفیگ OpenVPN
     */
    String meshToOpenVpn(in MeshPeer peer, in Bundle authParams);
    
    /**
     * تبدیل Node Mesh به کانفیگ Shadowsocks
     */
    Bundle meshToShadowsocks(in MeshPeer peer, in String encryption);
    
    // ==================== حالت‌های ترکیبی ====================
    
    /**
     * ایجاد زنجیره پروتکل‌ها (Multi-hop)
     * مثال: WireGuard → Tor → Psiphon
     */
    Bundle createProtocolChain(in String[] protocols, in Bundle[] configs);
    
    /**
     * فعال کردن حالت Fallback خودکار
     * اگر یک پروتکل کار نکرد، به صورت خودکار به پروتکل بعدی سوئیچ کند
     */
    boolean enableAutoFallback(in String[] fallbackChain);
    
    /**
     * تست ترکیب پروتکل‌ها برای بهترین عملکرد
     */
    Bundle testProtocolCombination(in String[] protocols, in String targetServer);
    
    // ==================== مدیریت اتصالات چندگانه ====================
    
    /**
     * فعال کردن Multipath (اتصال همزمان به چند پروتکل)
     */
    boolean enableMultipath(in String[] activeProtocols, in Bundle loadBalancingConfig);
    
    /**
     * تقسیم ترافیک بین پروتکل‌های مختلف
     */
    Bundle splitTraffic(in Bundle trafficRules);
    
    /**
     * مانیتورینگ کیفیت هر پروتکل
     */
    Bundle getProtocolQualityMetrics(in String protocolName, in int durationSeconds);
    
    // ==================== کشف و سازگاری ====================
    
    /**
     * کشف خودکار پروتکل‌های قابل استفاده در شبکه فعلی
     */
    String[] detectAvailableProtocols(in Bundle networkInfo);
    
    /**
     * تشخیص بهترین پروتکل برای شبکه/موقعیت فعلی
     */
    String recommendBestProtocol(in Bundle context);
    
    /**
     * بهینه‌سازی خودکار پروتکل بر اساس شرایط
     */
    Bundle autoOptimizeProtocol(in String protocol, in Bundle currentMetrics);
    
    // ==================== امنیت و مبهم‌سازی ====================
    
    /**
     * چرخش پروتکل برای جلوگیری از شناسایی
     */
    void rotateProtocols(in int intervalMinutes, in boolean randomize);
    
    /**
     * اضافه کردن لایه مبهم‌سازی به پروتکل
     */
    Bundle addObfuscationLayer(in String baseProtocol, in String obfuscationMethod);
    
    /**
     * تست مقاومت پروتکل در برابر DPI
     */
    Bundle testDpiResistance(in String protocol, in String testServer);
    
    // ==================== آمار و گزارش ====================
    
    /**
     * دریافت آمار استفاده از هر پروتکل
     */
    Bundle getProtocolUsageStats(in int timeframeDays);
    
    /**
     * گزارش مقایسه عملکرد پروتکل‌ها
     */
    Bundle compareProtocols(in String[] protocols, in String testCriteria);
    
    /**
     * لاگ‌گیری جامع از عملکرد Bridge
     */
    Bundle getBridgeLogs(in int logLevel, in int maxEntries);
    
    // ==================== مدیریت پیکربندی ====================
    
    /**
     * ذخیره پروفایل ترکیبی پروتکل‌ها
     */
    boolean saveProtocolProfile(in String profileName, in Bundle profileConfig);
    
    /**
     * بارگیری پروفایل ذخیره شده
     */
    Bundle loadProtocolProfile(in String profileName);
    
    /**
     * همگام‌سازی پروفایل‌ها بین دستگاه‌ها
     */
    boolean syncProfiles(in String syncToken, in Bundle profiles);
    
    // ==================== API سطح پایین ====================
    
    /**
     * اجرای دستور مستقیم روی پروتکل
     */
    Bundle executeProtocolCommand(in String protocol, in String command, in Bundle params);
    
    /**
     * دیباگ زنده پروتکل
     */
    Bundle debugProtocol(in String protocol, in boolean enableLiveLog);
    
    /**
     * ریست تنظیمات پروتکل به حالت پیش‌فرض
     */
    boolean resetProtocol(in String protocol);
}
