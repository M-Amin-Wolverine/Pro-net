// فایل: android/app/src/main/aidl/meshvpn/core/MeshPeer.aidl
package meshvpn.core;

import android.os.Bundle;

/**
 * مدل یک نود (دستگاه) در شبکه Mesh
 * Parcelable برای انتقال بین Processها
 */
parcelable MeshPeer {
    // ==================== شناسه‌ها ====================
    
    /**
     * شناسه منحصر به فرد نود
     */
    String peerId;
    
    /**
     * نام نمایشی نود
     */
    String displayName;
    
    /**
     * نوع دستگاه (موبایل، سرور، IoT, ...)
     */
    String deviceType;
    
    /**
     * مدل دستگاه
     */
    String deviceModel;
    
    // ==================== آدرس‌ها و موقعیت ====================
    
    /**
     * آدرس IP عمومی
     */
    String publicIp;
    
    /**
     * آدرس IP خصوصی در شبکه محلی
     */
    String localIp;
    
    /**
     * پورت‌های در دسترس
     */
    int[] availablePorts;
    
    /**
     * موقعیت جغرافیایی (اختیاری)
     */
    double latitude;
    double longitude;
    
    /**
     * کشور/منطقه
     */
    String countryCode;
    String region;
    
    // ==================== قابلیت‌ها ====================
    
    /**
     * پروتکل‌های پشتیبانی شده
     */
    String[] supportedProtocols;
    
    /**
     * نقش در شبکه
     * 0=LEAF, 1=RELAY, 2=GATEWAY, 3=SUPER_NODE
     */
    int nodeRole;
    
    /**
     * سطح سرویس (QoS)
     */
    int serviceLevel;
    
    /**
     * حداکثر پهنای باند آپلود (kbps)
     */
    int maxUploadBandwidth;
    
    /**
     * حداکثر پهنای باند دانلود (kbps)
     */
    int maxDownloadBandwidth;
    
    /**
     * آیا باتری دارد؟
     */
    boolean hasBattery;
    
    /**
     * سطح باتری (0-100)
     */
    int batteryLevel;
    
    /**
     * آیا به برق متصل است؟
     */
    boolean isCharging;
    
    // ==================== وضعیت شبکه ====================
    
    /**
     * قدرت سیگنال (0-100)
     */
    int signalStrength;
    
    /**
     * کیفیت اتصال (0-1)
     */
    float connectionQuality;
    
    /**
     * تأخیر به میلی‌ثانیه
     */
    int latencyMs;
    
    /**
     * نرخ از دست رفتن بسته (Packet Loss)
     */
    float packetLossRate;
    
    /**
     * زمان آخرین مشاهده (timestamp)
     */
    long lastSeen;
    
    /**
     * مدت زمان اتصال (ثانیه)
     */
    int uptimeSeconds;
    
    // ==================== امنیت ====================
    
    /**
     * کلید عمومی برای رمزنگاری
     */
    String publicKey;
    
    /**
     * گواهی دیجیتال
     */
    String certificate;
    
    /**
     * امضای دیجیتال نود
     */
    String signature;
    
    /**
     * سطح اعتماد (0-100)
     */
    int trustScore;
    
    /**
     * آیا احراز هویت شده؟
     */
    boolean isAuthenticated;
    
    /**
     * تاریخ احراز هویت
     */
    long authenticationTime;
    
    // ==================== آمار و متریک ====================
    
    /**
     * حجم داده ارسالی (بایت)
     */
    long dataSent;
    
    /**
     * حجم داده دریافتی (بایت)
     */
    long dataReceived;
    
    /**
     * تعداد اتصالات فعال
     */
    int activeConnections;
    
    /**
     * تعداد اتصالات رد شده
     */
    int rejectedConnections;
    
    /**
     * تعداد خطاها
     */
    int errorCount;
    
    /**
     * زمان فعالیت کل (ثانیه)
     */
    long totalUptime;
    
    // ==================== اطلاعات سیستم ====================
    
    /**
     * سیستم عامل
     */
    String operatingSystem;
    
    /**
     * نسخه سیستم عامل
     */
    String osVersion;
    
    /**
     * نسخه نرم‌افزار Mesh
     */
    String meshVersion;
    
    /**
     * معماری پردازنده
     */
    String cpuArchitecture;
    
    /**
     * تعداد هسته‌های پردازنده
     */
    int cpuCores;
    
    /**
     * حافظه RAM کل (مگابایت)
     */
    int totalMemory;
    
    /**
     * حافظه RAM آزاد (مگابایت)
     */
    int freeMemory;
    
    /**
     * فضای ذخیره‌سازی کل (مگابایت)
     */
    long totalStorage;
    
    /**
     * فضای ذخیره‌سازی آزاد (مگابایت)
     */
    long freeStorage;
    
    // ==================== تنظیمات ====================
    
    /**
     * تنظیمات خاص نود
     */
    Bundle settings;
    
    /**
     * متادیتای اضافی
     */
    Bundle metadata;
    
    /**
     * برچسب‌های دسته‌بندی
     */
    String[] tags;
    
    // =================%= وضعیت عملیاتی ====================
    
    /**
     * آیا آنلاین است؟
     */
    boolean isOnline;
    
    /**
     * آیا در دسترس است؟
     */
    boolean isAvailable;
    
    /**
     * آیا مشغول است؟
     */
    boolean isBusy;
    
    /**
     * وضعیت سلامت (0=نامعلوم, 1=سالم, 2=هشدار, 3=خراب)
     */
    int healthStatus;
    
    /**
     * پیام وضعیت
     */
    String statusMessage;
    
    /**
     * کد وضعیت
     */
    int statusCode;
    
    // =================%= اطلاعات اتصال ====================
    
    /**
     * واسط شبکه اصلی (wlan0, eth0, ...)
     */
    String primaryInterface;
    
    /**
     * نوع شبکه (WIFI, MOBILE, ETHERNET, ...)
     */
    String networkType;
    
    /**
     * نام شبکه WiFi
     */
    String wifiSsid;
    
    /**
     * قدرت سیگنال WiFi (dBm)
     */
    int wifiRssi;
    
    /**
     * فرکانس WiFi (MHz)
     */
    int wifiFrequency;
    
    /**
     * اپراتور موبایل
     */
    String mobileOperator;
    
    /**
     * نسل شبکه موبایل (2G, 3G, 4G, 5G)
     */
    String mobileGeneration;
}
