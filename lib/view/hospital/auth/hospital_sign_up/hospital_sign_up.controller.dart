import 'dart:convert';
import 'package:dream_tech_doctor/view/hospital/auth/sign_up_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SignupController extends GetxController {
  var isLoading = false.obs;

  Future<void> sendOtp(String adminEmail, BuildContext context, 
      {required Map<String, String> signupData}
      ) async {
    isLoading.value = true;
    try {
      final response = await http.post(
        // Uri.parse('https://softservice.site/api/auth/send_otp'),
        Uri.parse('https://doctorapp.com.softservice.site/api/auth/send_otp'),
        body: {'admin_email': adminEmail},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Print and validate the OTP response
        print("OTP response ====== ${response.body}");

        print("OTP response ====== ${data['otp']}");

        if (data['otp'] != null) {
          // Navigate to OTP screen with data if OTP is successfully sent
          //Get.to(() => HospitalSignUpOtp(), arguments: {'otp': data['otp']});

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HospitalSignUpOtp(
                 signupData: signupData,
                  otp: data['otp'].toString(),
                  //otp: data['otp'],
                ),
              ));

          // Get.snackbar('Success', "OTP send successfully",
          //     backgroundColor: Colors.green,
          //     colorText: Colors.white,
          //     snackPosition: SnackPosition.TOP);
        } else {}
      } else {}
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signup({
    required String hospitalName,
    required String regNumber,
    required String establish,
    required String country,
    required String division,
    required String district,
    required String subDistrict,
    required String locationDetails,
    required String mobileNumber1,
    required String mobileNumber2,
    required String email,
    required String adminName,
    required String adminMobile,
    required String adminEmail,
    required String password,
    required String logoPath,
    required String frontPicturePath,
  }) async {
    isLoading.value = true;
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://softservice.site/api/auth/signup'),
      );

      // Adding fields to the request
      request.fields.addAll({
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
      });

      // Adding files to the request
      request.files.add(await http.MultipartFile.fromPath('logo', logoPath));
      request.files.add(
          await http.MultipartFile.fromPath('front_picture', frontPicturePath));

      // Sending the request
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        final data = jsonDecode(responseBody);

        if (data['success']) {
          //Get.snackbar('Success', data['message']);

          // Trigger OTP send call
          //await sendOtp(adminEmail: adminEmail);
          Get.snackbar("title", "message");
        } else {
          // Get.snackbar('Error', data['message']);
        }
      } else {
        //Get.snackbar('Error', 'Failed to sign up. Please try again later.');
      }
    } catch (e) {
      //Get.snackbar('Error', 'An unexpected error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }
}






// import 'dart:convert';
// import 'package:dream_tech_doctor/view/home/home.dart';
// import 'package:dream_tech_doctor/view/hospital/auth/sign_up_otp.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

// class SignupController extends GetxController {
//   var isLoading = false.obs;

//   Future<void> sendOtp(String adminEmail, BuildContext context) async {
//     isLoading.value = true;
//     try {
//       final response = await http.post(
//         Uri.parse('https://softservice.site/api/auth/send_otp'),
//         body: {'admin_email': adminEmail},
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);

//         // Print and validate the OTP response
//         print("OTP response ====== ${response.body}");

//         print("OTP response ====== ${data['otp']}");

//         if (data['otp'] != null) {
//           // Navigate to OTP screen with data if OTP is successfully sent
//           //Get.to(() => HospitalSignUpOtp(), arguments: {'otp': data['otp']});

//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => HospitalSignUpOtp(
//                   adminemail: adminEmail,
//                   otp: data['otp'],
//                 ),
//               ));

//           Get.snackbar('Success', "OTP send successfully",
//               backgroundColor: Colors.green,
//               colorText: Colors.white,
//               snackPosition: SnackPosition.TOP);
//         } else {}
//       } else {}
//     } catch (e) {
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> signup({
//     required String hospitalName,
//     required String regNumber,
//     required String establish,
//     required String country,
//     required String division,
//     required String district,
//     required String subDistrict,
//     required String locationDetails,
//     required String mobileNumber1,
//     required String mobileNumber2,
//     required String email,
//     required String adminName,
//     required String adminMobile,
//     required String adminEmail,
//     required String password,
//     required String logoPath,
//     required String frontPicturePath,
//   }) async {
//     isLoading.value = true;
//     try {
//       var request = http.MultipartRequest(
//         'POST',
//         Uri.parse('https://softservice.site/api/auth/signup'),
//       );

//       // Adding fields to the request
//       request.fields.addAll({
//         'hospital_name': hospitalName,
//         'reg_number': regNumber,
//         'establish': establish,
//         'country': country,
//         'division': division,
//         'district': district,
//         'sub_district': subDistrict,
//         'location_details': locationDetails,
//         'mobile_number_1': mobileNumber1,
//         'mobile_number_2': mobileNumber2,
//         'email': email,
//         'admin_name': adminName,
//         'admin_mobile': adminMobile,
//         'admin_email': adminEmail,
//         'password': password,
//       });

//       // Adding files to the request
//       request.files.add(await http.MultipartFile.fromPath('logo', logoPath));
//       request.files.add(
//           await http.MultipartFile.fromPath('front_picture', frontPicturePath));

//       // Sending the request
//       http.StreamedResponse response = await request.send();

//       if (response.statusCode == 200) {
//         String responseBody = await response.stream.bytesToString();
//         final data = jsonDecode(responseBody);

//         if (data['success']) {
//           //Get.snackbar('Success', data['message']);

//           // Trigger OTP send call
//           //await sendOtp(adminEmail: adminEmail);
//           Get.snackbar("title", "message");
//         } else {
//           // Get.snackbar('Error', data['message']);
//         }
//       } else {
//         //Get.snackbar('Error', 'Failed to sign up. Please try again later.');
//       }
//     } catch (e) {
//       //Get.snackbar('Error', 'An unexpected error occurred: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
