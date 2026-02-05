package ca.psiphon.conduit

import android.os.Build
import android.os.Bundle
import android.view.WindowManager
import androidx.activity.enableEdgeToEdge
import androidx.core.view.WindowInsetsControllerCompat
import com.facebook.react.ReactActivity
import com.facebook.react.ReactActivityDelegate
import com.facebook.react.defaults.DefaultNewArchitectureEntryPoint.fabricEnabled
import com.facebook.react.defaults.DefaultReactActivityDelegate
import expo.modules.ReactActivityDelegateWrapper
import expo.modules.splashscreen.SplashScreenManager

/**
 * MainActivity — GOD MODE
 * ---------------------------------------------------------
 * Ultra-Secure | Edge-to-Edge | Network-Aware | Future-Proof
 * Designed for VPN / Mesh / Anti-Censorship Platforms
 * Ready for Android 15+ / RN New Architecture
 */
class MainActivity : ReactActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {

        // 🔥 Enforced Edge-to-Edge (mandatory for Android 15+)
        enableEdgeToEdge()

        // 🛡️ Secure UI — block screenshots & screen recording
        window.setFlags(
            WindowManager.LayoutParams.FLAG_SECURE,
            WindowManager.LayoutParams.FLAG_SECURE
        )

        // 🚀 Expo SplashScreen (must be before super)
        SplashScreenManager.registerOnActivity(this)

        // 🧠 Cold-start safe (RN + Process death)
        super.onCreate(savedInstanceState)

        configureSystemBars()
        applyRuntimeGuards()
    }

    /**
     * React Native root component
     */
    override fun getMainComponentName(): String = "main"

    /**
     * Expo + New Architecture Delegate (Fabric / TurboModules)
     */
    override fun createReactActivityDelegate(): ReactActivityDelegate {
        return ReactActivityDelegateWrapper(
            this,
            true, // New Architecture enforced
            object : DefaultReactActivityDelegate(
                this,
                mainComponentName,
                fabricEnabled
            ) {}
        )
    }

    /**
     * System Bars — Gesture-First, Immersive, Dark-Optimized
     */
    private fun configureSystemBars() {
        val controller = WindowInsetsControllerCompat(window, window.decorView)

        // VPN / Network apps → dark UI is safer & clearer
        controller.isAppearanceLightStatusBars = false
        controller.isAppearanceLightNavigationBars = false

        // Best behavior for gesture navigation
        controller.systemBarsBehavior =
            WindowInsetsControllerCompat.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE
    }

    /**
     * Runtime guards for stability & security
     */
    private fun applyRuntimeGuards() {

        // 🧪 Emulator / Debug detection (future policy hook)
        val isDebug =
            Build.FINGERPRINT.contains("generic") ||
            Build.FINGERPRINT.contains("emulator") ||
            Build.MODEL.contains("Emulator")

        if (isDebug) {
            // Placeholder for future logic:
            // - disable sensitive UI
            // - watermark
            // - restrict features
        }
    }

    /**
     * Predictive Back + legacy compatibility
     */
    override fun invokeDefaultOnBackPressed() {
        if (Build.VERSION.SDK_INT <= Build.VERSION_CODES.R) {
            if (!moveTaskToBack(false)) {
                super.invokeDefaultOnBackPressed()
            }
        } else {
            super.invokeDefaultOnBackPressed()
        }
    }
}
