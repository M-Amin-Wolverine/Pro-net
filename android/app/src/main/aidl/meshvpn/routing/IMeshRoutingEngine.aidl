// فایل: android/app/src/main/aidl/meshvpn/routing/IMeshRoutingEngine.aidl
package meshvpn.routing;

import android.os.Bundle;
import java.util.List;

/**
 * موتور مسیریابی هوشمند و تطبیقی شبکه Mesh
 */
interface IMeshRoutingEngine {
    
    // =================%= مدیریت جدول مسیریابی ====================
    
    /**
     * به‌روزرسانی جدول مسیریابی
     */
    boolean updateRoutingTable(in RoutingTable table);
    
    /**
     * دریافت جدول مسیریابی فعلی
     */
    Bundle getCurrentRoutingTable();
    
    /**
     * پاک‌سازی جدول مسیریابی
     */
    boolean clearRoutingTable(in ClearOptions options);
    
    /**
     * بهینه‌سازی جدول مسیریابی
     */
    Bundle optimizeRoutingTable(in OptimizationParams params);
    
    // =================%= محاسبه مسیر ====================
    
    /**
     * پیدا کردن بهترین مسیر بین دو نود
     */
    Bundle findOptimalPath(String sourceId, String targetId, in RoutingCriteria criteria);
    
    /**
     * محاسبه مسیرهای جایگزین
     */
    List<Bundle> findAlternativePaths(String sourceId, String targetId, int maxAlternatives);
    
    /**
     * مسیریابی چندمسیره
     */
    Bundle calculateMultiPathRoutes(String sourceId, String targetId, in MultiPathConfig config);
    
    /**
     * مسیریابی بر اساس کیفیت سرویس
     */
    Bundle qosBasedRouting(in Bundle qosRequirements);
    
    // =================%= پروتکل‌های مسیریابی ====================
    
    /**
     * فعال‌سازی پروتکل B.A.T.M.A.N. Advanced
     */
    boolean enableBatmanAdv(in BatmanConfig config);
    
    /**
     * فعال‌سازی پروتکل OLSR
     */
    boolean enableOlsr(in OlsrConfig config);
    
    /**
     * فعال‌سازی پروتکل Babel
     */
    boolean enableBabel(in BabelConfig config);
    
    /**
     * فعال‌سازی مسیریابی Source-Specific
     */
    boolean enableSourceSpecificRouting(in SsrConfig config);
    
    // =================%= مسیریابی پیشرفته ====================
    
    /**
     * مسیریابی جغرافیایی
     */
    Bundle geographicRouting(in GeoRoutingRequest request);
    
    /**
     * مسیریابی مبتنی بر محتوا
     */
    Bundle contentBasedRouting(in ContentRequest request);
    
    /**
     * مسیریابی Opportunistic
     */
    Bundle opportunisticRouting(in OpportunisticParams params);
    
    /**
     * مسیریابی Predictable Delay Tolerant
     */
    Bundle delayTolerantRouting(in DelayTolerantConfig config);
    
    // =================%= مدیریت متریک‌ها ====================
    
    /**
     * به‌روزرسانی متریک‌های لینک
     */
    boolean updateLinkMetrics(String linkId, in LinkMetrics metrics);
    
    /**
     * محاسبه متریک ترکیبی
     */
    float calculateCompositeMetric(in Bundle[] individualMetrics, in WeightConfig weights);
    
    /**
     * پیش‌بینی متریک‌های آینده
     */
    Bundle predictFutureMetrics(in PredictionModel model, in HistoricalData data);
    
    // =================%= Load Balancing ====================
    
    /**
     * توزیع بار بین مسیرها
     */
    Bundle distributeLoad(in LoadDistributionRequest request);
    
    /**
     * مسیریابی مبتنی بر بار (Load-Aware)
     */
    Bundle loadAwareRouting(in LoadInfo loadInfo);
    
    /**
     * جلوگیری از ازدحام
     */
    boolean preventCongestion(in CongestionInfo info);
    
    /**
     * تنظیم خودکار پارامترهای Load Balancing
     */
    Bundle autoTuneLoadBalancing(in TuningParams params);
    
    // =================%= مدیریت خطا در مسیریابی ====================
    
    /**
     * تشخیص خطای مسیریابی
     */
    Bundle detectRoutingFailure(in FailureDetectionParams params);
    
    /**
     * بازیابی خودکار از خطا
     */
    boolean autoRecoverFromFailure(in FailureInfo failure);
    
    /**
     * مسیریابی ضدخطا
     */
    Bundle faultTolerantRouting(in FaultToleranceRequirements requirements);
    
    /**
     * مسیریابی چندمسیره برای تحمل خطا
     */
    Bundle multiPathForFaultTolerance(in String sourceId, String targetId, int redundancyLevel);
    
    // =================%= امنیت مسیریابی ====================
    
    /**
     * مسیریابی امن با onion routing
     */
    Bundle onionRouting(in OnionRoutingRequest request);
    
    /**
     * مسیریابی garlic (مانند I2P)
     */
    Bundle garlicRouting(in GarlicRoutingParams params);
    
    /**
     * مسیریابی با mix networks
     */
    Bundle mixNetworkRouting(in MixNetworkConfig config);
    
    /**
     * تشخیص حمله‌های مسیریابی
     */
    Bundle detectRoutingAttacks(in TrafficAnalysis analysis);
    
    // =================%= مسیریابی انرژی‌آگاه ====================
    
    /**
     * مسیریابی برای صرفه‌جویی انرژی
     */
    Bundle energyAwareRouting(in EnergyConstraints constraints);
    
    /**
     * مسیریابی مبتنی بر سطح باتری
     */
    Bundle batteryLevelRouting(in BatteryInfo[] batteryInfos);
    
    /**
     * مسیریابی Sleep Scheduling
     */
    Bundle sleepSchedulingRouting(in SleepSchedule schedule);
    
    // =================%= مسیریابی پویا و تطبیقی ====================
    
    /**
     * مسیریابی تطبیقی با یادگیری ماشین
     */
    Bundle mlBasedRouting(in MlModel model, in RoutingContext context);
    
    /**
     * مسیریابی پیش‌بینانه
     */
    Bundle predictiveRouting(in PredictionInput input);
    
    /**
     * مسیریابی زمینه‌آگاه (Context-Aware)
     */
    Bundle contextAwareRouting(in ContextInfo context);
    
    /**
     * مسیریابی خودسازمانده
     */
    Bundle selfOrganizingRouting(in OrganizationParams params);
    
    // =================%= مدیریت ترافیک ====================
    
    /**
     * مهندسی ترافیک
     */
    Bundle trafficEngineering(in TrafficMatrix matrix);
    
    /**
     * کنترل ازدحام
     */
    Bundle congestionControl(in CongestionControlAlgorithm algorithm);
    
    /**
     * shaping ترافیک
     */
    Bundle trafficShaping(in ShapingPolicy policy);
    
    /**
     * اولویت‌بندی ترافیک
     */
    Bundle trafficPrioritization(in PriorityRules rules);
    
    // =================%= مانیتورینگ و آمار ====================
    
    /**
     * مانیتورینگ بلادرنگ مسیرها
     */
    boolean startRealTimeMonitoring(in RoutingMonitorCallback callback);
    
    /**
     * جمع‌آوری آمار مسیریابی
     */
    Bundle collectRoutingStats(in StatsCollectionParams params);
    
    /**
     * تحلیل کارایی مسیریابی
     */
    Bundle analyzeRoutingPerformance(in AnalysisPeriod period);
    
    /**
     * ایجاد گزارش مسیریابی
     */
    Bundle generateRoutingReport(in ReportFormat format);
    
    // =================%= APIهای سطح پایین ====================
    
    /**
     * تزریق مستقیم مسیر
     */
    boolean injectRoute(in InjectedRoute route);
    
    /**
     * حذف مسیر
     */
    boolean removeRoute(String routeId);
    
    /**
     * فلاش کش مسیریابی
     */
    boolean flushRoutingCache();
    
    /**
     * دیباگ مسیریابی
     */
    Bundle debugRouting(in DebugOptions options);
}
