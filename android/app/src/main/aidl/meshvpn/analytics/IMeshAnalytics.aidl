// فایل: android/app/src/main/aidl/meshvpn/analytics/IMeshAnalytics.aidl
package meshvpn.analytics;

import android.os.Bundle;
import java.util.List;

/**
 * سیستم جامع تحلیل و گزارش‌گیری شبکه Mesh
 */
interface IMeshAnalytics {
    
    // =================%= جمع‌آوری داده ====================
    
    /**
     * جمع‌آوری متریک‌های شبکه
     */
    Bundle collectNetworkMetrics(in CollectionConfig config);
    
    /**
     * جمع‌آوری داده‌های عملکردی
     */
    Bundle collectPerformanceData(in PerformanceCollectionParams params);
    
    /**
     * جمع‌آوری داده‌های امنیتی
     */
    Bundle collectSecurityData(in SecurityDataParams params);
    
    /**
     * جمع‌آوری داده‌های مصرف منابع
     */
    Bundle collectResourceUsageData(in ResourceParams params);
    
    // =================%= پردازش و تحلیل ====================
    
    /**
     * تحلیل آماری داده‌ها
     */
    Bundle statisticalAnalysis(in StatisticalParams params);
    
    /**
     * تحلیل روندها
     */
    Bundle trendAnalysis(in TrendAnalysisParams params);
    
    /**
     * تحلیل انومالی
     */
    Bundle anomalyDetection(in AnomalyDetectionConfig config);
    
    /**
     * تحلیل همبستگی
     */
    Bundle correlationAnalysis(in CorrelationParams params);
    
    // =================%= یادگیری ماشین و AI ====================
    
    /**
     * آموزش مدل ML روی دستگاه
     */
    Bundle trainOnDeviceModel(in TrainingData data, in ModelConfig config);
    
    /**
     * پیش‌بینی با مدل آموزش دیده
     */
    Bundle predictWithModel(in PredictionInput input, in String modelId);
    
    /**
     * تحلیل خوشه‌ای
     */
    Bundle clusterAnalysis(in ClusteringParams params);
    
    /**
     * تحلیل سری زمانی
     */
    Bundle timeSeriesAnalysis(in TimeSeriesData data);
    
    // =================%= گزارش‌گیری ====================
    
    /**
     * ایجاد گزارش سلامت شبکه
     */
    Bundle generateHealthReport(in ReportPeriod period);
    
    /**
     * ایجاد گزارش امنیتی
     */
    Bundle generateSecurityReport(in SecurityReportParams params);
    
    /**
     * ایجاد گزارش عملکرد
     */
    Bundle generatePerformanceReport(in PerformanceReportParams params);
    
    /**
     * ایجاد گزارش مصرف منابع
     */
    Bundle generateResourceReport(in ResourceReportParams params);
    
    // =================%= ویژوال‌سازی ====================
    
    /**
     * ایجاد نمودار شبکه
     */
    Bundle createNetworkGraph(in GraphConfig config);
    
    /**
     * ایجاد داشبورد بلادرنگ
     */
    Bundle createRealtimeDashboard(in DashboardConfig config);
    
    /**
     * ایجاد نقشه حرارتی
     */
    Bundle createHeatMap(in HeatMapParams params);
    
    /**
     * ایجاد نمودار جریان ترافیک
     */
    Bundle createTrafficFlowChart(in FlowChartConfig config);
    
    // =================%= مانیتورینگ بلادرنگ ====================
    
    /**
     * مانیتورینگ متریک‌های حیاتی
     */
    boolean monitorCriticalMetrics(in String[] metricIds, in MonitorCallback callback);
    
    /**
     * مانیتورینگ آستانه‌ای
     */
    boolean thresholdMonitoring(in ThresholdConfig[] thresholds, in AlertCallback callback);
    
    /**
     * مانیتورینگ رویدادهای امنیتی
     */
    boolean securityEventMonitoring(in SecurityEventConfig config, in EventCallback callback);
    
    /**
     * مانیتورینگ کیفیت سرویس
     */
    boolean qosMonitoring(in QosRequirements requirements, in QosCallback callback);
    
    // =================%= تحلیل پیش‌بینی ====================
    
    /**
     * پیش‌بینی خرابی
     */
    Bundle predictFailures(in PredictionHorizon horizon);
    
    /**
     * پیش‌بینی بار ترافیک
     */
    Bundle predictTrafficLoad(in PredictionWindow window);
    
    /**
     * پیش‌بینی مصرف منابع
     */
    Bundle predictResourceUsage(in ResourcePredictionParams params);
    
    /**
     * پیش‌بینی امنیتی
     */
    Bundle predictSecurityThreats(in ThreatPredictionParams params);
    
    // =================%= تحلیل مقایسه‌ای ====================
    
    /**
     * مقایسه عملکرد نودها
     */
    Bundle compareNodePerformance(in String[] nodeIds, in ComparisonCriteria criteria);
    
    /**
     * مقایسه پروتکل‌ها
     */
    Bundle compareProtocols(in String[] protocolNames, in ProtocolComparisonParams params);
    
    /**
     * مقایسه پیکربندی‌ها
     */
    Bundle compareConfigurations(in Bundle[] configs, in ComparisonMetrics metrics);
    
    /**
     * تحلیل A/B Testing
     */
    Bundle abTestingAnalysis(in AbTestConfig config);
    
    // =================%= هوشمندی کسب‌وکار ====================
    
    /**
     * تحلیل ROI شبکه
     */
    Bundle calculateRoi(in RoiCalculationParams params);
    
    /**
     * تحلیل هزینه‌فایده
     */
    Bundle costBenefitAnalysis(in CostBenefitParams params);
    
    /**
     * تحلیل تأثیرگذاری
     */
    Bundle impactAnalysis(in ImpactAnalysisParams params);
    
    /**
     * تحلیل KPIها
     */
    Bundle kpiAnalysis(in KpiDefinition[] kpis);
    
    // =================%= مدیریت داده ====================
    
    /**
     * ذخیره داده‌های تحلیلی
     */
    boolean storeAnalyticsData(in Bundle data, in StorageConfig config);
    
    /**
     * بازیابی داده‌های تاریخی
     */
    List<Bundle> retrieveHistoricalData(in TimeRange range, in DataFilter filter);
    
    /**
     * پاک‌سازی داده‌های قدیمی
     */
    boolean purgeOldData(in RetentionPolicy policy);
    
    /**
     * فشرده‌سازی داده‌های تحلیلی
     */
    Bundle compressAnalyticsData(in CompressionConfig config);
    
    // =================%= یکپارچه‌سازی خارجی ====================
    
    /**
     * ارسال داده به سیستم‌های خارجی
     */
    boolean exportToExternalSystems(in ExportConfig config);
    
    /**
     * دریافت داده از منابع خارجی
     */
    Bundle importFromExternalSources(in ImportConfig config);
    
    /**
     * همگام‌سازی با فضای ابری
     */
    boolean syncWithCloud(in CloudSyncConfig config);
    
    // =================%= APIهای مدیریتی ====================
    
    /**
     * پیکربندی سیستم آنالیتیکس
     */
    boolean configureAnalyticsSystem(in AnalyticsConfig config);
    
    /**
     * کالیبراسیون سنسورها و متریک‌ها
     */
    Bundle calibrateMetrics(in CalibrationParams params);
    
    /**
     * ممیزی سیستم آنالیتیکس
     */
    Bundle auditAnalyticsSystem(in AuditScope scope);
    
    /**
     * ریست سیستم آنالیتیکس
     */
    boolean resetAnalyticsSystem(in ResetOptions options);
}
