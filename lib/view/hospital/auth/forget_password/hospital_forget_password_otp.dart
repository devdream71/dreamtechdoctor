import 'package:dream_tech_doctor/view/hospital/auth/forget_password/controller/forget_passord_otp_check.dart';
import 'package:dream_tech_doctor/view/hospital/auth/forget_password/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';




class HospitalForgetPasswordOtp extends StatelessWidget {
  const HospitalForgetPasswordOtp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final otp = args['otp'] ?? '';  // Retrieve OTP
    final adminEmail = args['adminEmail'] ?? '';  
    final controller = Get.put(ForgetPasswordOtpCheckController());

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    // Variable to hold the input PIN
    String enteredOtp = '';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('OTP'),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        width: double.infinity,
        child: Column(
          children: [
            const Text(
              "Verification",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 40),
              child: const Text(
                "Enter the code sent to your email",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              child: Text(
                "$adminEmail",  // Display OTP and admin email
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              child: Text(
                "OTP: $otp",  // Display OTP
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: Colors.green),
                ),
              ),
              onCompleted: (pin) {
                enteredOtp = pin; // Save the entered OTP
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (enteredOtp.isEmpty) {
                      // Show a Snackbar if OTP is not entered
                      Get.snackbar(
                        'Error',
                        'Please enter OTP before proceeding.',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    } else {
                      // Proceed to check OTP if it is not empty
                      controller.checkOtp(adminEmail, enteredOtp);
                    }
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}



