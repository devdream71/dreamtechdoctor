class LoginResponseModel {
  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final int userId;
  final String hospitalName;
  final String adminEmail;
  final String adminName;
  final String adminMobile;

  LoginResponseModel({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.userId,
    required this.hospitalName,
    required this.adminEmail,
    required this.adminName,
    required this.adminMobile,
  });

  // Convert JSON response to LoginResponseModel
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      expiresIn: json['expires_in'],
      userId: json['user_id'],
      hospitalName: json['hospital_name'],
      adminEmail: json['admin_email'],
      adminName: json['admin_name'],
      adminMobile: json['admin_mobile'],
    );
  }
}
