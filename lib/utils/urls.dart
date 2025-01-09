class AppURL {
  // static const String baseURL = "https://softservice.site/api/";

  static const String baseURL =
      "https://doctorapp.com.softservice.site/api/auth/";

  static const String hospitalSignUP = "${baseURL}auth/signup";
  static const String hospitalSignIn = "${baseURL}auth/login";
  static const String hospitalSendOTP = "${baseURL}auth/sendOTP";
  static const String hospitalResetPassword = "${baseURL}auth/resetPassword";

  static const String doctorCreateSymptom = "${baseURL}symptoms";
  static const String doctorCreateSpcialist = "${baseURL}specialist";
  static const String doctorCreateExperience = "${baseURL}experience";
  static const String doctorCreateDepartment = "${baseURL}department";



}
