import 'package:dream_tech_doctor/view/hospital/auth/forget_password/hospital_forget_password_otp.dart';
import 'package:dream_tech_doctor/view/hospital/auth/forget_password/model/forget_password_email_model.dart';
import 'package:dream_tech_doctor/view/hospital/auth/forget_password/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ForgetPasswordController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;
   var otp = ''.obs; 
   var adminEmail = ''.obs;

  Future<void> sendOtp(String adminEmail) async {
    final url =
        Uri.parse('https://doctorapp.com.softservice.site/api/auth/send_otp');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'admin_email': adminEmail});

    try {
      isLoading.value = true;
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final otpResponse = SendOtpResponse.fromJson(responseData);

         

        print('OTP: ${otpResponse.otp}');

         otp.value = otpResponse.otp.toString(); 
         this.adminEmail.value = adminEmail; 
        Get.to(HospitalForgetPasswordOtp(), arguments: {'otp': otp.value, 'adminEmail': adminEmail},);
        Get.snackbar('Success', otpResponse.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
      } else {
        errorMessage.value = 'Failed to send OTP. Please try again.';
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      errorMessage.value = 'An error occurred: $error';
      print('Error: $error');
    } finally {
      isLoading.value = false;
    }
  }
}
