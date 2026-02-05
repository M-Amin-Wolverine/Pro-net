// فایل: android/app/src/main/aidl/meshvpn/adapter/IProtocolCallback.aidl
package meshvpn.adapter;

import android.os.Bundle;

/**
 * کالبک برای رویدادهای ProtocolBridge
 */
interface IProtocolCallback {
    
    /**
     * زمانی که پروتکل تغییر می‌کند
     */
    void onProtocolChanged(in String oldProtocol, in String newProtocol, in Bundle reason);
    
    /**
     * گزارش کیفیت پروتکل
     */
    void onProtocolQualityUpdate(in String protocol, in Bundle qualityMetrics);
    
    /**
     * زمانی که Fallback اتفاق می‌افتد
     */
    void onFallbackTriggered(in String failedProtocol, in String fallbackProtocol, in Bundle error);
    
    /**
     * گزارش DPI تشخیص داده شده
     */
    void onDpiDetected(in String protocol, in Bundle dpiInfo);
    
    /**
     * زمانی که پروتکل‌ها rotate می‌شوند
     */
    void onProtocolRotation(in String[] newProtocolChain);
    
    /**
     * آمار لحظه‌ای Multipath
     */
    void onMultipathStats(in Bundle trafficDistribution);
    
    /**
     * رویدادهای دیباگ
     */
    void onDebugEvent(in String eventType, in Bundle debugInfo);
}
