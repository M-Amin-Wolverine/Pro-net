// فایل: android/app/src/main/aidl/meshvpn/core/NetworkStateBundle.aidl
package meshvpn.core;

import android.os.Bundle;

/**
 * بسته جامع وضعیت شبکه Mesh
 * Parcelable برای انتقال وضعیت شبکه
 */
parcelable NetworkStateBundle {
    
    // ==================== اطلاعات پایه ====================
    
    /**
     * شناسه وضعیت
     */
    String stateId;
    
    /**
     * زمان ایجاد (timestamp)
     */
    long timestamp;
    
    /**
     * نسخه فرمت
     */
    int version;
    
    // ==================== وضعیت کلی شبکه ====================
    
    /**
     * وضعیت عملیاتی شبکه
     * 0=OFFLINE, 1=INITIALIZING, 2=CONNECTING, 
     * 3=CONNECTED, 4=DEGRADED, 5=RECOVERING, 6=ERROR
     */
    int networkState;
    
    /**
     * پیام وضعیت
     */
    String stateMessage;
    
    /**
     * کد خطا (در صورت وجود)
     */
    int errorCode;
    
    /**
     * پیام خطا
     */
    String errorMessage;
    
    // =================%= آمار شبکه ====================
    
    /**
     * تعداد کل نودها
     */
    int totalNodes;
    
    /**
     * تعداد نودهای آنلاین
     */
    int onlineNodes;
    
    /**
     * تعداد نودهای آفلاین
     */
    int offlineNodes;
    
    /**
     * تعداد Relayهای فعال
     */
    int activeRelays;
    
    /**
     * تعداد Gatewayهای فعال
     */
    int activeGateways;
    
    /**
     * اندازه شبکه (قطر توپولوژی)
     */
    int networkDiameter;
    
    /**
     * تراکم شبکه (0-1)
     */
    float networkDensity;
    
    // =================%= عملکرد شبکه ====================
    
    /**
     * پهنای باند کل آپلود (kbps)
     */
    int totalUploadBandwidth;
    
    /**
     * پهنای باند کل دانلود (kbps)
     */
    int totalDownloadBandwidth;
    
    /**
     * پهنای باند استفاده شده آپلود (kbps)
     */
    int usedUploadBandwidth;
    
    /**
     * پهنای باند استفاده شده دانلود (kbps)
     */
    int usedDownloadBandwidth;
    
    /**
     * تأخیر متوسط شبکه (میلی‌ثانیه)
     */
    int averageLatency;
    
    /**
     * نرخ از دست رفتن بسته (0-1)
     */
    float packetLossRate;
    
    /**
     * نرخ خطای شبکه (خطا در ثانیه)
     */
    float errorRate;
    
    /**
     * کیفیت شبکه (0-100)
     */
    int networkQuality;
    
    /**
     * پایداری شبکه (0-100)
     */
    int networkStability;
    
    // =================%= آمار انتقال داده ====================
    
    /**
     * حجم کل داده ارسالی (بایت)
     */
    long totalDataSent;
    
    /**
     * حجم کل داده دریافتی (بایت)
     */
    long totalDataReceived;
    
    /**
     * نرخ داده ارسالی (بایت بر ثانیه)
     */
    int dataSendRate;
    
    /**
     * نرخ داده دریافتی (بایت بر ثانیه)
     */
    int dataReceiveRate;
    
    /**
     * تعداد بسته‌های ارسالی
     */
    long packetsSent;
    
    /**
     * تعداد بسته‌های دریافتی
     */
    long packetsReceived;
    
    /**
     * نرخ بسته ارسالی (بسته بر ثانیه)
     */
    int packetSendRate;
    
    /**
     * نرخ بسته دریافتی (بسته بر ثانیه)
     */
    int packetReceiveRate;
    
    // =================%= امنیت شبکه ====================
    
    /**
     * سطح امنیت شبکه (0-100)
     */
    int securityLevel;
    
    /**
     * تعداد حمله‌های تشخیص داده شده
     */
    int detectedAttacks;
    
    /**
     * تعداد اتصالات غیرمجاز
     */
    int unauthorizedConnections;
    
    /**
     * آیا رمزنگاری فعال است؟
     */
    boolean encryptionEnabled;
    
    /**
     * الگوریتم رمزنگاری
     */
    String encryptionAlgorithm;
    
    /**
     * کلیدهای امنیتی معتبر
     */
    int validSecurityKeys;
    
    /**
     * کلیدهای امنیتی منقضی شده
     */
    int expiredSecurityKeys;
    
    // =================%= توپولوژی شبکه ====================
    
    /**
     * نوع توپولوژی (STAR, MESH, TREE, HYBRID)
     */
    String topologyType;
    
    /**
     * تعداد لایه‌های شبکه
     */
    int networkLayers;
    
    /**
     * مرکز شبکه (در صورت STAR)
     */
    String networkCenter;
    
    /**
     * لیست نقاط آسیب‌پذیر
     */
    String[] vulnerablePoints;
    
    /**
     * درصد اتصالات مستقیم
     */
    float directConnectionsPercent;
    
    /**
     * درصد اتصالات غیرمستقیم
     */
    float indirectConnectionsPercent;
    
    // =================%= منابع و مصرف ====================
    
    /**
     * مصرف باتری (میلی‌آمپر)
     */
    int batteryConsumption;
    
    /**
     * مصرف CPU (درصد)
     */
    float cpuUsage;
    
    /**
     * مصرف حافظه (مگابایت)
     */
    int memoryUsage;
    
    /**
     * دمای دستگاه (سلسیوس)
     */
    float deviceTemperature;
    
    /**
     * مصرف داده شبکه موبایل (بایت)
     */
    long mobileDataUsage;
    
    /**
     * مصرف داده WiFi (بایت)
     */
    long wifiDataUsage;
    
    // =================%= اتصالات خارجی ====================
    
    /**
     * تعداد Gatewayهای خارجی
     */
    int externalGateways;
    
    /**
     * پروتکل‌های خارجی فعال
     */
    String[] activeExternalProtocols;
    
    /**
     * وضعیت اینترنت
     */
    boolean internetConnected;
    
    /**
     * سرعت اینترنت (kbps)
     */
    int internetSpeed;
    
    /**
     * تأخیر اینترنت (میلی‌ثانیه)
     */
    int internetLatency;
    
    // =================%= اطلاعات جغرافیایی ====================
    
    /**
     * کشورهای موجود در شبکه
     */
    String[] countries;
    
    /**
     * مناطق جغرافیایی
     */
    String[] regions;
    
    /**
     * توزیع جغرافیایی نودها
     */
    Bundle geographicDistribution;
    
    /**
     * فاصله متوسط بین نودها (کیلومتر)
     */
    float averageNodeDistance;
    
    // =================%= سلامت شبکه ====================
    
    /**
     * وضعیت سلامت شبکه (0=نامعلوم, 1=سالم, 2=هشدار, 3=خراب)
     */
    int healthStatus;
    
    /**
     * مشکلات شناسایی شده
     */
    String[] identifiedIssues;
    
    /**
     * توصیه‌های بهبود
     */
    String[] improvementSuggestions;
    
    /**
     * درصد تکمیل Self-Healing
     */
    int selfHealingProgress;
    
    /**
     * زمان آخرین Backup (timestamp)
     */
    long lastBackupTime;
    
    // =================%= تنظیمات ====================
    
    /**
     * پیکربندی فعلی شبکه
     */
    Bundle currentConfig;
    
    /**
     * محدودیت‌های فعال
     */
    Bundle activeLimits;
    
    /**
     * پروفایل عملکرد
     */
    String performanceProfile;
    
    /**
     * حالت عملیاتی
     */
    String operationalMode;
    
    // =================%= متریک‌های پیشرفته ====================
    
    /**
     * شاخص تمرکز شبکه (0-1)
     */
    float networkCentralizationIndex;
    
    /**
     * تحمل خطای شبکه (تعداد نود از دست رفته قابل تحمل)
     */
    int faultTolerance;
    
    /**
     * ظرفیت شبکه (تعداد اتصال همزمان)
     */
    int networkCapacity;
    
    /**
     * درصد استفاده از ظرفیت
     */
    int capacityUsagePercent;
    
    /**
     * زمان پاسخگویی شبکه (میلی‌ثانیه)
     */
    int networkResponseTime;
    
    // =================%= داده‌های تاریخی ====================
    
    /**
     * روند کیفیت شبکه (آخرین ۱۰ نمونه)
     */
    int[] qualityHistory;
    
    /**
     * روند تأخیر شبکه (آخرین ۱۰ نمونه)
     */
    int[] latencyHistory;
    
    /**
     * روند پایداری شبکه (آخرین ۱۰ نمونه)
     */
    int[] stabilityHistory;
    
    /**
     * زمان شروع شبکه (timestamp)
     */
    long networkStartTime;
    
    /**
     * مدت زمان فعالیت شبکه (ثانیه)
     */
    long networkUptime;
    
    // =================%= اطلاعات پیش‌بینی ====================
    
    /**
     * پیش‌بینی سلامت شبکه (دقیقه آینده)
     */
    int predictedHealth;
    
    /**
     * پیش‌بینی پهنای باند مورد نیاز
     */
    int predictedBandwidthNeed;
    
    /**
     * احتمال قطعی شبکه (0-1)
     */
    float outageProbability;
    
    /**
     * زمان تخمینی تا مشکل بعدی (ثانیه)
     */
    int timeToNextIssue;
    
    // =================%= داده‌های اضافی ====================
    
    /**
     * داده‌های سفارشی
     */
    Bundle customData;
    
    /**
     * امضای دیجیتال این گزارش
     */
    String signature;
    
    /**
     * نسخه تولیدکننده گزارش
     */
    String generatorVersion;
}
