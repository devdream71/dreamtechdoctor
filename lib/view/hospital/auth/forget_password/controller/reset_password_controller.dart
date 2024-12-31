import 'dart:convert';
import 'package:dream_tech_doctor/view/hospital/auth/hospital_login/hospital_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ResetPasswordController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var successMessage = ''.obs;

  Future<void> resetPassword(String adminEmail, String password, String passwordConfirmation) async {
    final url = Uri.parse('https://doctorapp.com.softservice.site/api/auth/reset_password');
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final body = json.encode({
      'admin_email': adminEmail,
      'password': password,
      'password_confirmation': passwordConfirmation,
    });

    try {
      isLoading.value = true;

      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      debugPrint('Response Status Code: ${response.statusCode}');
      debugPrint('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['message'] == "Password updated successfully") {
          successMessage.value = responseData['message'];
          debugPrint('Success: ${responseData['message']}');
          Get.snackbar(
            'Success',
            'Password updated successfully',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );

          // Navigate to login page after success
          Future.delayed(const Duration(seconds: 2), () {
            Get.offAll(() => HospitalLoginPage());
          });
        } else {
          errorMessage.value = 'Password reset failed. Please try again.';
          debugPrint('Error Message: ${responseData['message']}');
          Get.snackbar(
            'Error',
            errorMessage.value,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        // Handle non-200 responses
        errorMessage.value = 'Failed to reset password. Please check your inputs.';
        debugPrint('Error: ${response.statusCode}, Body: ${response.body}');
        Get.snackbar(
          'Error',
          errorMessage.value,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (error) {
      errorMessage.value = 'An error occurred: $error';
      debugPrint('Exception: $error');
      Get.snackbar(
        'Error',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}






