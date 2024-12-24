import 'dart:async';
import 'package:dream_tech_doctor/view/hospital/auth/hospital_login.dart';
import 'package:dream_tech_doctor/view/hospital/auth/hospital_sign_up/hospital_sign_up.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class HospitalSignUpOtp extends StatefulWidget {
  final adminemail;
  final otp;

  const HospitalSignUpOtp(
      {super.key, required this.adminemail, required this.otp});

  @override
  HospitalSignUpOtpState createState() => HospitalSignUpOtpState();
}

class HospitalSignUpOtpState extends State<HospitalSignUpOtp> {
  final SignupController signupController = Get.find<SignupController>();

  late Timer _timer;
  int _secondsRemaining = 120;
  bool _isTimerActive = true;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _isTimerActive = false;
          _timer.cancel();
        }
      });
    });
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secondsLeft = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secondsLeft.toString().padLeft(2, '0')}';
  }
  //final otp = Get.arguments?['otp'];

  @override
  Widget build(
    BuildContext context,
  ) {
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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Sign up OTP'),
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
              child: const Text(
                "Shakib@gmail.com",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            Pinput(
              length: 5,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: Colors.green),
                ),
              ),
              onCompleted: (pin) => debugPrint(pin),
            ),
            const SizedBox(height: 20),
            Text(
              _isTimerActive
                  ? "Time Remaining: ${_formatTime(_secondsRemaining)}"
                  : "OTP expired",
              style: TextStyle(
                  fontSize: 18,
                  color: _isTimerActive ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isTimerActive ? Colors.blue : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _isTimerActive
                      ? () async {
                          // Handle next action
                          print('Next button clicked');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HospitalLoginPage()),
                          );

                          var adminEmailontroller = "sh@gmail.com";

                          // await signupController.sendOtp(
                          //     adminEmailontroller, context);
                        }
                      : null,
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            if (!_isTimerActive)
              TextButton(
                onPressed: () {
                  // Handle resend OTP action
                  print("Resend OTP clicked");
                  setState(() {
                    _secondsRemaining = 120;
                    _isTimerActive = true;
                    _startTimer();
                  });
                },
                child: const Text(
                  'Resend OTP',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
