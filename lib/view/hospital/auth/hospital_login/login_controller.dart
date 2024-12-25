import 'dart:convert';
import 'package:dream_tech_doctor/view/hospital/auth/hospital_login/hospital_login_model.dart';
import 'package:dream_tech_doctor/view/hospital/hospital_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var loginError = ''.obs;

  // Function to handle login
  Future<void> login(String adminEmail, String password, BuildContext context) async {
    isLoading(true); // Start loading
    loginError('');

    try {
      // Make the POST request to the login API
      var response = await http.post(
        Uri.parse('https://doctorapp.com.softservice.site/api/auth/login'),
        body: {
          'admin_email': adminEmail,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // Parse the JSON response
        final data = jsonDecode(response.body);
        LoginResponseModel loginResponse = LoginResponseModel.fromJson(data);

        // Save the token in SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', loginResponse.accessToken);

        print('Login Successful! Token saved: ${loginResponse.accessToken}');

         Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HospitalBottomNav()));
      } else {
        loginError('Failed to login. Please check your credentials and try again.');
      }
    } catch (e) {
      loginError('An error occurred: $e');
    } finally {
      isLoading(false); // Stop loading
    }
  }
}
