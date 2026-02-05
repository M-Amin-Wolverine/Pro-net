// فایل: android/app/src/main/aidl/meshvpn/adapter/IPsiphonAdapter.aidl
package meshvpn.adapter;

import android.os.Bundle;

interface IPsiphonAdapter {
    /**
     * تبدیل وضعیت Psiphon به وضعیت Mesh
     */
    Bundle convertToMeshState(in Bundle psiphonState);
    
    /**
     * فعال کردن Psiphon به عنوان یک Node در Mesh
     */
    boolean integratePsiphonNode(in String psiphonConfig);
    
    /**
     * دریافت وضعیت Bridge
     */
    Bundle getBridgeStatus();
}
