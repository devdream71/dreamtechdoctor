import 'package:dream_tech_doctor/view/hospital/auth/forget_password/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dream_tech_doctor/view/hospital/auth/forget_password/model/otp_check_response.dart';


class ForgetPasswordOtpCheckController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  // Update to accept and handle failure better
  Future<void> checkOtp(String adminEmail, String otpCheck) async {
    final url = Uri.parse('https://doctorapp.com.softservice.site/api/auth/password_reset_otp_check');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'admin_email': adminEmail, 'otp_check': otpCheck});

    try {
      isLoading.value = true;
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final otpResponse = OtpCheckResponse.fromJson(responseData);

        // On successful OTP check, show a success message and navigate to next page
        print('OTP Check Success: ${otpResponse.otpMessage}');
        Get.snackbar('Success', otpResponse.otpMessage,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
        Get.to(ResetPassword(), arguments: {'adminEmail': adminEmail}); // Only navigate if successful
      } else {
        errorMessage.value = 'Failed to verify OTP. Please try again.';
        print('Error: ${response.statusCode}');
        Get.snackbar('Error', errorMessage.value,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } catch (error) {
      errorMessage.value = 'An error occurred: $error';
      print('Error: $error');
      Get.snackbar('Error', errorMessage.value,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }
}




// class ForgetPasswordOtpCheckController extends GetxController {
//   var isLoading = false.obs;
//   var errorMessage = ''.obs;

//   // Update to accept and handle failure better
//   Future<void> checkOtp(String adminEmail, String otpCheck) async {
//     final url = Uri.parse('https://doctorapp.com.softservice.site/api/auth/password_reset_otp_check');
//     final headers = {'Content-Type': 'application/json'};
//     final body = json.encode({'admin_email': adminEmail, 'otp_check': otpCheck});

//     try {
//       isLoading.value = true;
//       final response = await http.post(url, headers: headers, body: body);

//       if (response.statusCode == 200) {
//         final responseData = json.decode(response.body);
//         final otpResponse = OtpCheckResponse.fromJson(responseData);

//         // On successful OTP check, show a success message and navigate to next page
//         print('OTP Check Success: ${otpResponse.otpMessage}');
//         Get.snackbar('Success', otpResponse.otpMessage,
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: Colors.green,
//             colorText: Colors.white);
//         Get.to(ResetPassword()); // Only navigate if successful
//       } else {
//         errorMessage.value = 'Failed to verify OTP. Please try again.';
//         print('Error: ${response.statusCode}');
//         Get.snackbar('Error', errorMessage.value,
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: Colors.red,
//             colorText: Colors.white);
//       }
//     } catch (error) {
//       errorMessage.value = 'An error occurred: $error';
//       print('Error: $error');
//       Get.snackbar('Error', errorMessage.value,
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.red,
//           colorText: Colors.white);
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
