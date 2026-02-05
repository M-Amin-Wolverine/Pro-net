// فایل: android/app/src/main/aidl/meshvpn/legacy/IWireGuardCompatible.aidl
package meshvpn.legacy;

import android.os.Bundle;

/**
 * سازگاری با پروتکل WireGuard
 */
interface IWireGuardCompatible {
    
    /**
     * تبدیل کانفیگ WireGuard استاندارد به Mesh
     */
    Bundle convertWireGuardConfig(in String wgConfig);
    
    /**
     * ایجاد tunnel WireGuard درون Mesh
     */
    Bundle createWireGuardTunnel(in Bundle wgParams);
    
    /**
     * مدیریت کلیدهای WireGuard
     */
    Bundle manageWireGuardKeys(in KeyManagementRequest request);
    
    /**
     * مانیتورینگ tunnel WireGuard
     */
    Bundle monitorWireGuardTunnel(in String tunnelId);
    
    /**
     * بهینه‌سازی عملکرد WireGuard
     */
    Bundle optimizeWireGuardPerformance(in OptimizationParams params);
    
    /**
     * مدیریت peerهای WireGuard
     */
    Bundle manageWireGuardPeers(in PeerManagementRequest request);
}
