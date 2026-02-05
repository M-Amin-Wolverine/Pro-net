package meshvpn.adapter;

import android.os.Bundle;

interface IPsiphonAdapter {
    // ==================== تبدیل Psiphon به Mesh Node ====================
    
    /**
     * تبدیل وضعیت Psiphon به MeshPeer
     */
    Bundle convertPsiphonToMeshPeer(in Bundle psiphonStatus);
    
    /**
     * ثبت Psiphon به عنوان Gateway در شبکه Mesh
     */
    String registerPsiphonAsGateway(in Bundle psiphonConfig);
    
    /**
     * تنظیم Psiphon به عنوان خروجی اینترنت پیش‌فرض
     */
    boolean setPsiphonAsDefaultGateway(in GatewayPriority priority);
    
    // ==================== مدیریت ترافیک ====================
    
    /**
     * هدایت ترافیک Mesh به Psiphon
     */
    boolean routeMeshTrafficThroughPsiphon(in TrafficRoutingRules rules);
    
    /**
     * تقسیم ترافیک بین Psiphon و مسیرهای مستقیم Mesh
     */
    Bundle splitTrafficBetweenPsiphonAndMesh(in SplitRatio ratio);
    
    /**
     * انتخاب خودکار بین Psiphon و اتصالات مستقیم Mesh
     */
    String autoSelectBestPath(in Bundle networkConditions);
    
    // ==================== مدیریت اتصال ====================
    
    /**
     * اتصال شبکه Mesh به Psiphon
     */
    boolean connectMeshToPsiphon(in ConnectionParams params);
    
    /**
     * قطع اتصال Mesh از Psiphon
     */
    boolean disconnectMeshFromPsiphon();
    
    /**
     * مانیتورینگ کیفیت اتصال Psiphon
     */
    Bundle monitorPsiphonConnectionQuality();
    
    // =================%= Failover و Load Balancing ====================
    
    /**
     * تنظیم Psiphon به عنوان Failover
     */
    boolean configurePsiphonAsFailover(in FailoverConfig config);
    
    /**
     * فعال‌سازی Load Balancing بین Psiphon و سایر Gateways
     */
    Bundle enableLoadBalancingWithPsiphon(in LoadBalancingConfig config);
    
    /**
     * تست سرعت Psiphon در مقایسه با مسیرهای Mesh
     */
    Bundle benchmarkPsiphonVsMesh();
}
