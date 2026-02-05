// فایل: android/app/src/main/aidl/meshvpn/routing/RoutingTable.aidl
package meshvpn.routing;

parcelable RoutingTable {
    // اطلاعات کلی
    String tableId;
    long timestamp;
    int version;
    String ownerNodeId;
    
    // تنظیمات جدول
    int maxRoutes;
    int currentRouteCount;
    String routingProtocol;
    Bundle protocolParams;
    
    // ورودی‌های جدول
    RouteEntry[] routes;
    
    // متریک‌های جدول
    float averageRouteAge;
    float routeStabilityScore;
    int routeChangesLastHour;
    int routeChangesLastDay;
    
    // وضعیت جدول
    boolean isStable;
    boolean isSynchronized;
    boolean needsOptimization;
    String optimizationStatus;
    
    // زمان‌بندی
    long lastUpdateTime;
    long nextScheduledUpdate;
    long autoOptimizationInterval;
    
    // محدودیت‌ها
    int maxHopsAllowed;
    float maxAllowedLatency;
    float minRequiredBandwidth;
    
    // کش
    Bundle routingCache;
    long cacheLastUpdated;
    int cacheHitRate;
    
    // آمار
    Bundle statistics;
    Bundle performanceMetrics;
    
    // تنظیمات پیشرفته
    Bundle advancedSettings;
    Bundle securityContext;
    
    // لاگ‌ها
    Bundle[] changeLog;
    Bundle[] errorLog;
    
    // امضای دیجیتال
    String signature;
    String signedBy;
    long signatureTimestamp;
}

parcelable RouteEntry {
    String routeId;
    String destination;
    String nextHop;
    String[] path;  // کل مسیر از مبدا تا مقصد
    String[] alternativePaths;
    
    // متریک‌ها
    int hopCount;
    int latencyMs;
    float bandwidthKbps;
    float packetLossRate;
    float reliabilityScore;
    float cost;
    float trustScore;
    
    // وضعیت
    boolean isActive;
    boolean isPreferred;
    boolean isBackup;
    boolean isVerified;
    String status;
    long lastUsed;
    long lastVerified;
    
    // محدودیت‌ها
    String[] allowedTrafficTypes;
    String[] restrictedTimes;
    Bundle qosRequirements;
    
    // امنیت
    String encryptionMethod;
    String authenticationMethod;
    String[] trustedNodes;
    
    // منابع
    float estimatedPowerConsumption;
    int memoryUsage;
    int cpuUsage;
    
    // اطلاعات زمانی
    long creationTime;
    long expirationTime;
    long timeToLive;
    
    // آمار استفاده
    long packetsTransferred;
    long bytesTransferred;
    long successfulTransfers;
    long failedTransfers;
    
    // تاریخچه
    Bundle[] history;
    String lastError;
    int consecutiveFailures;
    
    // متادیتا
    Bundle metadata;
    String[] tags;
    int priority;
}
