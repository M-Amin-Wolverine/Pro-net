// فایل: android/app/src/main/aidl/meshvpn/legacy/IOpenVPNBridge.aidl
package meshvpn.legacy;

import android.os.Bundle;

/**
 * پل ارتباطی با OpenVPN
 */
interface IOpenVPNBridge {
    
    /**
     * بارگیری فایل .ovpn
     */
    Bundle loadOvpnFile(in String filePath, in Bundle options);
    
    /**
     * ایجاد tunnel OpenVPN
     */
    Bundle createOpenVpnTunnel(in Bundle ovpnConfig);
    
    /**
     * مدیریت گواهی‌های OpenVPN
     */
    Bundle manageOpenVpnCertificates(in CertificateRequest request);
    
    /**
     * پشتیبانی از پلاگین‌های OpenVPN
     */
    Bundle supportOpenVpnPlugins(in PluginConfig config);
}
