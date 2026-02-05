// فایل: android/app/src/main/aidl/meshvpn/discovery/IMeshDiscoveryManager.aidl
package meshvpn.discovery;

import android.os.Bundle;
import java.util.List;

/**
 * مدیریت کشف خودکار نودها در شبکه Mesh
 */
interface IMeshDiscoveryManager {
    
    // =================%= روش‌های کشف ====================
    
    /**
     * کشف از طریق WiFi Direct
     */
    Bundle discoverViaWifiDirect(in WifiDirectConfig config);
    
    /**
     * کشف از طریق Wi-Fi Aware (NAN)
     */
    Bundle discoverViaWifiAware(in NanConfig config);
    
    /**
     * کشف از طریق Bluetooth Mesh
     */
    Bundle discoverViaBluetoothMesh(in BluetoothMeshConfig config);
    
    /**
     * کشف از طریق BLE
     */
    Bundle discoverViaBle(in BleConfig config);
    
    /**
     * کشف از طریق mDNS
     */
    Bundle discoverViaMdns(in MdnsConfig config);
    
    /**
     * کشف از طریق DHT
     */
    Bundle discoverViaDht(in DhtConfig config);
    
    /**
     * کشف از طریق Ultrasonic
     */
    Bundle discoverViaUltrasonic(in UltrasonicConfig config);
    
    // =================%= کشف ترکیبی ====================
    
    /**
     * کشف چندروشی
     */
    Bundle hybridDiscovery(in HybridDiscoveryConfig config);
    
    /**
     * کشف تطبیقی
     */
    Bundle adaptiveDiscovery(in AdaptiveConfig config);
    
    /**
     * کشف انرژی‌آگاه
     */
    Bundle energyAwareDiscovery(in EnergyConfig config);
    
    /**
     * کشف محرمانه
     */
    Bundle stealthDiscovery(in StealthConfig config);
    
    // =================%= مدیریت نودهای کشف شده ====================
    
    /**
     * ثبت نود کشف شده
     */
    boolean registerDiscoveredNode(in Bundle nodeInfo);
    
    /**
     * حذف نود منقضی شده
     */
    boolean removeExpiredNode(String nodeId);
    
    /**
     * به‌روزرسانی اطلاعات نود
     */
    boolean updateNodeInfo(String nodeId, in Bundle newInfo);
    
    /**
     * دریافت لیست نودهای کشف شده
     */
    List<Bundle> getDiscoveredNodes(in FilterCriteria filter);
    
    // =================%= اعلام حضور (Announcement) ====================
    
    /**
     * اعلام حضور در شبکه
     */
    boolean announcePresence(in AnnouncementConfig config);
    
    /**
     * توقف اعلام حضور
     */
    boolean stopAnnouncement();
    
    /**
     * تنظیم دوره‌ای اعلام حضور
     */
    boolean setAnnouncementInterval(int intervalSeconds);
    
    /**
     * اعلام حضور انتخابی
     */
    boolean selectiveAnnouncement(in String[] targetNodes);
    
    // =================%= فیلتر کردن و اعتبارسنجی ====================
    
    /**
     * فیلتر کردن نودهای نامعتبر
     */
    List<Bundle> filterInvalidNodes(in ValidationRules rules);
    
    /**
     * اعتبارسنجی نود کشف شده
     */
    boolean validateNode(in Bundle nodeInfo, in ValidationConfig config);
    
    /**
     * تشخیص نودهای جعلی
     */
    List<String> detectFakeNodes(in DetectionCriteria criteria);
    
    /**
     * امتیازدهی به نودها
     */
    Bundle scoreNodes(in ScoringAlgorithm algorithm);
    
    // =================%= بهینه‌سازی کشف ====================
    
    /**
     * بهینه‌سازی مصرف باتری در کشف
     */
    Bundle optimizeBatteryUsage(in BatteryOptimizationParams params);
    
    /**
     * بهینه‌سازی سرعت کشف
     */
    Bundle optimizeDiscoverySpeed(in SpeedOptimizationParams params);
    
    /**
     * بهینه‌سازی دقت کشف
     */
    Bundle optimizeDiscoveryAccuracy(in AccuracyOptimizationParams params);
    
    /**
     * یادگیری الگوی کشف
     */
    Bundle learnDiscoveryPatterns(in LearningData data);
    
    // =================%= کشف جغرافیایی ====================
    
    /**
     * کشف نودهای مجاور
     */
    Bundle discoverNearbyNodes(in ProximityConfig config);
    
    /**
     * کشف نودهای منطقه جغرافیایی
     */
    Bundle discoverGeographicRegion(in GeographicRegion region);
    
    /**
     * کشف بر اساس موقعیت مکانی
     */
    Bundle locationBasedDiscovery(in LocationParams params);
    
    // =================%= کشف مبتنی بر سرویس ====================
    
    /**
     * کشف نودهای ارائه‌دهنده سرویس خاص
     */
    Bundle discoverServiceProviders(in String serviceType, in ServiceRequirements reqs);
    
    /**
     * کشف نودهای با قابلیت خاص
     */
    Bundle discoverNodesWithCapability(in String capability, in CapabilityLevel level);
    
    /**
     * کشف Gatewayهای موجود
     */
    Bundle discoverGateways(in GatewayRequirements reqs);
    
    // =================%= امنیت کشف ====================
    
    /**
     * کشف امن با رمزنگاری
     */
    Bundle secureDiscovery(in SecurityConfig config);
    
    /**
     * کشف ناشناس
     */
    Bundle anonymousDiscovery(in AnonymityConfig config);
    
    /**
     * کشف با احراز هویت
     */
    Bundle authenticatedDiscovery(in AuthConfig config);
    
    /**
     * جلوگیری از استراق سمع کشف
     */
    Bundle preventDiscoveryEavesdropping(in PreventionConfig config);
    
    // =================%= مدیریت حالت کشف ====================
    
    /**
     * شروع فرآیند کشف
     */
    boolean startDiscoveryProcess(in DiscoveryMode mode);
    
    /**
     * توقف فرآیند کشف
     */
    boolean stopDiscoveryProcess();
    
    /**
     * مکث موقت کشف
     */
    boolean pauseDiscovery(in PauseDuration duration);
    
    /**
     * ازسرگیری کشف
     */
    boolean resumeDiscovery();
    
    // =================%= مانیتورینگ و گزارش ====================
    
    /**
     * مانیتورینگ بلادرنگ فرآیند کشف
     */
    boolean monitorDiscovery(in DiscoveryMonitorCallback callback);
    
    /**
     * دریافت آمار کشف
     */
    Bundle getDiscoveryStatistics(in StatsPeriod period);
    
    /**
     * گزارش کشف
     */
    Bundle generateDiscoveryReport(in ReportFormat format);
    
    /**
     * لاگ‌های کشف
     */
    List<Bundle> getDiscoveryLogs(in LogQuery query);
    
    // =================%= APIهای پیشرفته ====================
    
    /**
     * تزریق دستی نود
     */
    boolean manuallyInjectNode(in Bundle nodeInfo);
    
    /**
     * همگام‌سازی نودها با سرور مرکزی
     */
    boolean syncWithCentralServer(in SyncConfig config);
    
    /**
     * کشف پویا مبتنی بر رویداد
     */
    Bundle eventDrivenDiscovery(in EventConfig config);
    
    /**
     * پیکربندی پیشرفته کشف
     */
    boolean configureAdvancedDiscovery(in AdvancedConfig config);
}
