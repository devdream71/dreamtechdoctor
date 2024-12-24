import 'dart:convert';

class SignupRequestModel {
  String hospitalName;
  String regNumber;
  String establish;
  String country;
  String division;
  String district;
  String subDistrict;
  String locationDetails;
  String mobileNumber1;
  String mobileNumber2;
  String email;
  String adminName;
  String adminMobile;
  String adminEmail;
  String password;
  String logoPath;
  String frontPicturePath;

  SignupRequestModel({
    required this.hospitalName,
    required this.regNumber,
    required this.establish,
    required this.country,
    required this.division,
    required this.district,
    required this.subDistrict,
    required this.locationDetails,
    required this.mobileNumber1,
    required this.mobileNumber2,
    required this.email,
    required this.adminName,
    required this.adminMobile,
    required this.adminEmail,
    required this.password,
    required this.logoPath,
    required this.frontPicturePath,
  });

  Map<String, String> toFieldsMap() {
    return {
      'hospital_name': hospitalName,
      'reg_number': regNumber,
      'establish': establish,
      'country': country,
      'division': division,
      'district': district,
      'sub_district': subDistrict,
      'location_details': locationDetails,
      'mobile_number_1': mobileNumber1,
      'mobile_number_2': mobileNumber2,
      'email': email,
      'admin_name': adminName,
      'admin_mobile': adminMobile,
      'admin_email': adminEmail,
      'password': password,
    };
  }
}

class SignupResponseModel {
  bool success;
  String message;
  Map<String, dynamic>? data;

  SignupResponseModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory SignupResponseModel.fromJson(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return SignupResponseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'],
    );
  }
}
