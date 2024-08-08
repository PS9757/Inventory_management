class ErrorConstants {
  // Firebase Signin With Email and Password
  static const String userNotFound = 'user-not-found';
  static const String invalidEmail = 'invalid-email';
  static const String wrongPassword = 'wrong-password';
  static const String userDisabled = 'user-disabled';

  // create Account
  static const String emailAlreadyInUse = 'email-already-in-use';
  static const String weakPassword = 'weak-password';


  //Send Password Reset Link
  static const String missingAndroidPackageName =
      'auth/missing-android-pkg-name';
  static const String missingIosBundleID = 'auth/missing-ios-bundle-id';
  static const String invalidContinueUrl = 'auth/invalid-continue-uri';
  static const String unauthrizedContinueUrl = 'auth/unauthorized-continue-uri';

  // Firebase Signin With Credential
  static const String invalidVerificationID = 'invalid-verification-id';
  static const String invalidVerificationCode = 'invalid-verification-code';
  static const String operationNotAllowed = 'operation-not-allowed';
  static const String invalidCredential = 'invalid-credential';
  static const String accountExistsWithDifferentCredential =
      'account-exists-with-different-credential';
}
