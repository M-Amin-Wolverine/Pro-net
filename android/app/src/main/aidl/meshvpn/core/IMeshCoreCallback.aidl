// فایل: android/app/src/main/aidl/meshvpn/core/IMeshCoreCallback.aidl
package meshvpn.core;

import android.os.Bundle;

/**
 * رابط کالبک برای دریافت رویدادها از هسته Mesh
 */
interface IMeshCoreCallback {
    
    // =================%= رویدادهای وضعیت شبکه ====================
    
    /**
     * تغییر وضعیت کلی شبکه
     */
    void onNetworkStateChanged(in NetworkStateBundle state);
    
    /**
     * تغییر در اتصال اینترنت
     */
    void onInternetConnectivityChanged(boolean connected, in Bundle networkInfo);
    
    /**
     * تغییر در نوع شبکه (WiFi/Mobile)
     */
    void onNetworkTypeChanged(in String networkType, in Bundle details);
    
    // =================%= رویدادهای نودها ====================
    
    /**
     * کشف نود جدید
     */
    void onPeerDiscovered(in MeshPeer peer, in Bundle discoveryInfo);
    
    /**
     * نود متصل شد
     */
    void onPeerConnected(in MeshPeer peer, in Bundle connectionInfo);
    
    /**
     * نود قطع شد
     */
    void onPeerDisconnected(in MeshPeer peer, in String reason);
    
    /**
     * تغییر وضعیت نود
     */
    void onPeerStatusChanged(String peerId, in Bundle status);
    
    /**
     * به‌روزرسانی لیست نودها
     */
    void onPeerListUpdated(in List<MeshPeer> peers);
    
    // =================%= رویدادهای امنیتی ====================
    
    /**
     * رویداد امنیتی (هشدار)
     */
    void onSecurityAlert(in Bundle alert);
    
    /**
     * تشخیص حمله
     */
    void onAttackDetected(in Bundle attackInfo);
    
    /**
     * تغییر وضعیت احراز هویت
     */
    void onAuthenticationResult(String peerId, boolean success, in Bundle details);
    
    /**
     * به‌روزرسانی کلیدهای امنیتی
     */
    void onSecurityKeysRotated(in Bundle keyInfo);
    
    // =================%= رویدادهای انتقال داده ====================
    
    /**
     * شروع انتقال داده
     */
    void onDataTransferStarted(in Bundle transferInfo);
    
    /**
     * پیشرفت انتقال داده
     */
    void onDataTransferProgress(in Bundle progressInfo);
    
    /**
     * اتمام انتقال داده
     */
    void onDataTransferCompleted(in Bundle resultInfo);
    
    /**
     * خطا در انتقال داده
     */
    void onDataTransferFailed(in Bundle errorInfo);
    
    /**
     * دریافت داده جدید
     */
    void onDataReceived(in Bundle dataPacket);
    
    // =================%= رویدادهای عملکردی ====================
    
    /**
     * به‌روزرسانی متریک‌های عملکرد
     */
    void onPerformanceMetricsUpdated(in Bundle metrics);
    
    /**
     * هشدار مصرف باتری
     */
    void onBatteryWarning(int batteryLevel, in Bundle usageInfo);
    
    /**
     * هشدار مصرف داده
     */
    void onDataUsageWarning(in Bundle usageInfo);
    
    /**
     * تغییر در کیفیت شبکه
     */
    void onNetworkQualityChanged(float qualityScore, in Bundle details);
    
    // =================%= رویدادهای توپولوژی ====================
    
    /**
     * تغییر در نقشه شبکه
     */
    void onTopologyChanged(in Bundle topology);
    
    /**
     * تغییر نقش نود
     */
    void onNodeRoleChanged(String peerId, int oldRole, int newRole);
    
    /**
     * بهینه‌سازی مسیرها
     */
    void onRoutesOptimized(in Bundle optimizationResult);
    
    // =================%= رویدادهای خطا و بازیابی ====================
    
    /**
     * خطای شبکه
     */
    void onNetworkError(in Bundle error);
    
    /**
     * شروع Self-Healing
     */
    void onSelfHealingStarted(in Bundle healingPlan);
    
    /**
     * پیشرفت Self-Healing
     */
    void onSelfHealingProgress(in Bundle progress);
    
    /**
     * اتمام Self-Healing
     */
    void onSelfHealingCompleted(in Bundle result);
    
    /**
     * بازیابی از Backup
     */
    void onBackupRestored(in Bundle restoreInfo);
    
    // =================%= رویدادهای سیستم ====================
    
    /**
     * رویداد دیباگ (برای توسعه)
     */
    void onDebugEvent(in String eventType, in Bundle debugInfo);
    
    /**
     * رویداد لاگ (برای ذخیره)
     */
    void onLogEvent(in Bundle logEntry);
    
    /**
     * تغییر پیکربندی
     */
    void onConfigChanged(in Bundle configChanges);
    
    /**
     * آماده‌سازی برای خاموشی
     */
    void onShutdownPreparation(in Bundle shutdownInfo);
    
    // =================%= رویدادهای یکپارچه‌سازی ====================
    
    /**
     * اتصال به Gateway خارجی
     */
    void onExternalGatewayConnected(in Bundle gatewayInfo);
    
    /**
     * قطع از Gateway خارجی
     */
    void onExternalGatewayDisconnected(in Bundle gatewayInfo);
    
    /**
     * رویداد پروتکل خارجی
     */
    void onExternalProtocolEvent(in String protocol, in Bundle event);
    
    // =================%= رویدادهای مدیریتی ====================
    
    /**
     * درخواست تایید کاربر
     */
    void onUserConfirmationRequired(in Bundle request);
    
    /**
     * هشدار سیستمی
     */
    void onSystemAlert(in Bundle alert);
    
    /**
     * وضعیت سرویس‌های وابسته
     */
    void onServiceStatusChanged(in Bundle serviceStatus);
    
    /**
     * ظرفیت شبکه
     */
    void onNetworkCapacityChanged(in Bundle capacityInfo);
}
