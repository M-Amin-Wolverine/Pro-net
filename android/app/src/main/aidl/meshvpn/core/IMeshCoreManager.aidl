// فایل: android/app/src/main/aidl/meshvpn/core/IMeshCoreManager.aidl
package meshvpn.core;

import android.os.Bundle;
import meshvpn.core.MeshPeer;
import meshvpn.core.NetworkStateBundle;
import java.util.List;

/**
 * رابط اصلی مدیریت شبکه Mesh
 * مسئولیت: راه‌اندازی، نگهداری و کنترل شبکه مش
 */
interface IMeshCoreManager {
    
    // ==================== مدیریت چرخه حیات شبکه ====================
    
    /**
     * راه‌اندازی شبکه مش با پیکربندی دلخواه
     */
    boolean startMeshNetwork(in Bundle config);
    
    /**
     * توقف شبکه مش
     */
    boolean stopMeshNetwork();
    
    /**
     * مکث موقت شبکه (برای صرفه‌جویی باتری)
     */
    boolean pauseMeshNetwork(in int timeoutSeconds);
    
    /**
     * ازسرگیری شبکه
     */
    boolean resumeMeshNetwork();
    
    /**
     * ریست کامل شبکه
     */
    boolean resetMeshNetwork();
    
    // ==================== مدیریت نودها (Nodes) ====================
    
    /**
     * ثبت یک نود جدید در شبکه
     */
    String registerPeer(in MeshPeer peer);
    
    /**
     * حذف نود از شبکه
     */
    boolean unregisterPeer(String peerId);
    
    /**
     * به‌روزرسانی اطلاعات نود
     */
    boolean updatePeer(in MeshPeer peer);
    
    /**
     * دریافت لیست نودهای فعال
     */
    List<MeshPeer> getActivePeers();
    
    /**
     * جستجوی نود بر اساس ویژگی‌ها
     */
    List<MeshPeer> searchPeers(in Bundle criteria);
    
    /**
     * مسدود کردن نود مخرب
     */
    boolean blockPeer(String peerId, in String reason);
    
    // ==================== مدیریت اتصالات ====================
    
    /**
     * ایجاد اتصال مستقیم با نود
     */
    boolean connectToPeer(String peerId, in Bundle connectionParams);
    
    /**
     * قطع اتصال از نود
     */
    boolean disconnectFromPeer(String peerId);
    
    /**
     * دریافت وضعیت اتصال با نود خاص
     */
    Bundle getPeerConnectionStatus(String peerId);
    
    /**
     * تست پینگ به نود
     */
    int pingPeer(String peerId);
    
    // ==================== مدیریت توپولوژی ====================
    
    /**
     * تغییر نقش نود در شبکه
     */
    boolean changeNodeRole(String peerId, int newRole);
    
    /**
     * بهینه‌سازی خودکار توپولوژی
     */
    boolean optimizeTopology();
    
    /**
     * دریافت نقشه فعلی شبکه
     */
    Bundle getNetworkTopology();
    
    /**
     * پیدا کردن بهترین مسیر به نود مقصد
     */
    List<String> findOptimalPath(String sourcePeerId, String targetPeerId);
    
    // ==================== امنیت و احراز هویت ====================
    
    /**
     * احراز هویت نود جدید
     */
    Bundle authenticatePeer(in Bundle authRequest);
    
    /**
     * تبادل کلید امنیتی
     */
    Bundle exchangeSecurityKeys(String peerId, in Bundle keyMaterial);
    
    /**
     * به‌روزرسانی سیاست‌های امنیتی
     */
    boolean updateSecurityPolicy(in Bundle policy);
    
    /**
     * اسکن نودهای مشکوک
     */
    Bundle scanSuspiciousPeers();
    
    // ==================== انتقال داده ====================
    
    /**
     * ارسال داده به نود مقصد
     */
    boolean sendData(String targetPeerId, in byte[] data, in Bundle options);
    
    /**
     * ارسال داده به چند نود (Broadcast)
     */
    boolean broadcastData(in byte[] data, in Bundle filter);
    
    /**
     * ارسال فایل به نود مقصد
     */
    Bundle sendFile(String targetPeerId, in String filePath, in Bundle metadata);
    
    /**
     * ایجاد کانال امن برای انتقال جریانی
     */
    Bundle createSecureChannel(String peerId, in Bundle channelConfig);
    
    // =================%= بهینه‌سازی عملکرد ====================
    
    /**
     * تنظیم پروفایل عملکرد
     */
    boolean setPerformanceProfile(in Bundle profile);
    
    /**
     * تنظیم محدودیت مصرف باتری
     */
    boolean setBatteryLimit(int percent);
    
    /**
     * تنظیم محدودیت مصرف داده
     */
    boolean setDataLimit(in Bundle limit);
    
    /**
     * فشرده‌سازی ترافیک
     */
    boolean enableTrafficCompression(boolean enable);
    
    /**
     * کش‌کردن محتوا
     */
    boolean enableContentCaching(boolean enable, in Bundle cachePolicy);
    
    // =================%= مانیتورینگ و آمار ====================
    
    /**
     * دریافت آمار جامع شبکه
     */
    Bundle getNetworkStatistics(in int timeframeMinutes);
    
    /**
     * دریافت آمار نود خاص
     */
    Bundle getPeerStatistics(String peerId, in int timeframeMinutes);
    
    /**
     * دریافت لاگ‌های شبکه
     */
    List<Bundle> getNetworkLogs(in int logLevel, in int maxEntries);
    
    /**
     * مانیتورینگ بلادرنگ شبکه
     */
    boolean startRealtimeMonitoring(in IMeshCoreCallback callback);
    
    /**
     * توقف مانیتورینگ
     */
    boolean stopRealtimeMonitoring();
    
    // =================%= مدیریت خطا و بازیابی ====================
    
    /**
     * تشخیص خطا در شبکه
     */
    Bundle diagnoseNetworkIssues();
    
    /**
     * فعال‌سازی Self-Healing
     */
    boolean triggerSelfHealing(in Bundle healingPlan);
    
    /**
     * بازیابی از Backup
     */
    boolean restoreFromBackup(in Bundle backupData);
    
    /**
     * ایجاد Backup از وضعیت شبکه
     */
    Bundle createNetworkBackup();
    
    // =================%= یکپارچه‌سازی با پروتکل‌های خارجی ====================
    
    /**
     * اضافه کردن Gateway به پروتکل خارجی
     */
    boolean addExternalGateway(in String protocol, in Bundle gatewayConfig);
    
    /**
     * حذف Gateway
     */
    boolean removeExternalGateway(String gatewayId);
    
    /**
     * دریافت لیست Gatewayهای فعال
     */
    List<Bundle> getExternalGateways();
    
    // =================%= مدیریت پیکربندی ====================
    
    /**
     * ذخیره پیکربندی شبکه
     */
    boolean saveNetworkConfig(in String configName, in Bundle config);
    
    /**
     * بارگیری پیکربندی
     */
    Bundle loadNetworkConfig(in String configName);
    
    /**
     * وارد کردن پیکربندی از فایل
     */
    boolean importConfig(in String filePath);
    
    /**
     * صادر کردن پیکربندی به فایل
     */
    boolean exportConfig(in String filePath, in Bundle config);
    
    // =================%= API سطح پایین ====================
    
    /**
     * اجرای دستور مستقیم روی هسته
     */
    Bundle executeCoreCommand(in String command, in Bundle params);
    
    /**
     * دریافت وضعیت داخلی هسته
     */
    Bundle getInternalState();
    
    /**
     * ریست تنظیمات به پیش‌فرض
     */
    boolean resetToDefaults();
}
