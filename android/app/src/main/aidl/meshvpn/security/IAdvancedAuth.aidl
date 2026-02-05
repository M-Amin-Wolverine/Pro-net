// فایل: android/app/src/main/aidl/meshvpn/security/IAdvancedAuth.aidl
package meshvpn.security;

import android.os.Bundle;

/**
 * سیستم احراز هویت پیشرفته با مکانیزم‌های مختلف
 */
interface IAdvancedAuth {
    
    // =================%= Zero-Knowledge Proof ====================
    
    /**
     * ایجاد اثبات دانش صفر
     */
    Bundle createZkProof(in ZkStatement statement, in ZkWitness witness);
    
    /**
     * تایید اثبات دانش صفر
     */
    boolean verifyZkProof(in Bundle proof, in ZkStatement statement);
    
    /**
     * اثبات هویت بدون افشای اطلاعات
     */
    Bundle proveIdentityWithoutRevealing(in IdentityClaim claim);
    
    // =================%= احراز هویت چندعاملی ====================
    
    /**
     * احراز هویت با OTP
     */
    boolean authenticateWithOtp(in String otp, in String secret);
    
    /**
     * احراز هویت با زیست‌سنجی
     */
    boolean authenticateWithBiometrics(in Bundle biometricData);
    
    /**
     * احراز هویت با کلید سخت‌افزاری
     */
    boolean authenticateWithHardwareKey(in Bundle keyData);
    
    /**
     * احراز هویت چندعاملی ترکیبی
     */
    Bundle multiFactorAuth(in MultiFactorRequest request);
    
    // =================%= احراز هویت همتا به همتا ====================
    
    /**
     * پروتکل SIGMA برای احراز هویت متقابل
     */
    Bundle sigmaProtocolExchange(in Bundle initMessage);
    
    /**
     * احراز هویت با پروتکل Needham-Schroeder
     */
    Bundle needhamSchroederAuth(in Bundle request);
    
    /**
     * احراز هویت با پروتکل Kerberos-like
     */
    Bundle kerberosStyleAuth(in Bundle ticketRequest);
    
    // =================%= احراز هویت بی‌واسطه ====================
    
    /**
     * احراز هویت با QR Code
     */
    Bundle qrCodeAuthentication(in String qrData);
    
    /**
     * احراز هویت با NFC
     */
    Bundle nfcAuthentication(in Bundle nfcData);
    
    /**
     * احراز هویت با Bluetooth
     */
    Bundle bluetoothAuthentication(in Bundle bleData);
    
    /**
     * احراز هویت با پروکسی‌میت مجاورت
     */
    Bundle proximityAuthentication(in Bundle proximityData);
    
    // =================%= توکن‌های امنیتی ====================
    
    /**
     * ایجاد توکن JWT
     */
    String createJwtToken(in Bundle claims, in String secret);
    
    /**
     * تایید توکن JWT
     */
    Bundle verifyJwtToken(in String token, in String secret);
    
    /**
     * ایجاد توکن یک‌بارمصرف زمان‌دار
     */
    String createTimeBasedToken(in String secret, in long timestamp);
    
    /**
     * ایجاد توکن‌های اپلیکیشن محدود
     */
    Bundle createScopedToken(in String[] scopes, in long duration);
    
    // =================%= سیستم اعتبار سنجی ====================
    
    /**
     * سیستم اعتبارسنجی مبتنی بر اعتماد
     */
    Bundle trustBasedValidation(in TrustScore[] scores);
    
    /**
     * اعتبارسنجی با الگوی رفتاری
     */
    boolean behavioralValidation(in Bundle behaviorPattern);
    
    /**
     * اعتبارسنجی مکانی (Geofencing)
     */
    boolean locationBasedValidation(in Bundle locationData);
    
    /**
     * اعتبارسنجی مبتنی on زمان
     */
    boolean timeBasedValidation(in TimeWindow window);
    
    // =================%= مدیریت هویت دیجیتال ====================
    
    /**
     * ایجاد هویت دیجیتال جدید
     */
    Bundle createDigitalIdentity(in IdentitySpec spec);
    
    /**
     * به‌روزرسانی هویت دیجیتال
     */
    boolean updateDigitalIdentity(String identityId, in Bundle updates);
    
    /**
     * ابطال هویت دیجیتال
     */
    boolean revokeDigitalIdentity(String identityId, in String reason);
    
    /**
     * احراز مالکیت هویت
     */
    Bundle proveIdentityOwnership(String identityId, in Bundle proof);
    
    // =================%= احراز هویت گروهی ====================
    
    /**
     * احراز هویت گروهی (Group Signature)
     */
    Bundle groupAuthentication(in GroupAuthRequest request);
    
    /**
     * احراز هویت آستانه‌ای
     */
    Bundle thresholdAuthentication(in ThresholdParams params);
    
    /**
     * احراز هویت زنجیره اعتماد
     */
    Bundle chainOfTrustAuth(in String[] trustChain);
    
    // =================%= مکانیزم‌های بازیابی ====================
    
    /**
     * بازیابی حساب با کلیدهای بازیابی
     */
    Bundle recoverAccountWithKeys(in RecoveryKeys keys);
    
    /**
     * بازیابی با تاییدیه اجتماعی
     */
    Bundle socialRecovery(in SocialProof[] proofs);
    
    /**
     * بازیابی تدریجی حساب
     */
    Bundle gradualAccountRecovery(in RecoverySteps steps);
    
    // =================%= احراز هویت ناشناس ====================
    
    /**
     * احراز هویت ناشناس با Credential
     */
    Bundle anonymousAuthentication(in AnonymousCredential credential);
    
    /**
     * احراز هویت با امضای کور
     */
    Bundle blindSignatureAuth(in Bundle blindMessage);
    
    /**
     * احراز هویت با Ring Signature
     */
    Bundle ringSignatureAuth(in RingParams params);
    
    // =================%= APIهای مدیریتی ====================
    
    /**
     * پیکربندی سیستم احراز هویت
     */
    boolean configureAuthSystem(in AuthConfig config);
    
    /**
     * آپگرید الگوریتم‌های احراز هویت
     */
    boolean upgradeAuthAlgorithms(in Bundle newAlgorithms);
    
    /**
     * ممیزی سیستم احراز هویت
     */
    Bundle auditAuthSystem(in AuditScope scope);
    
    /**
     * خروج اضطراری از تمام نشست‌ها
     */
    boolean emergencyLogoutAll();
}
