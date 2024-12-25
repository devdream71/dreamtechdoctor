import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dream_tech_doctor/view/hospital/auth/hospital_login/hospital_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pinput/pinput.dart';

class HospitalSignUpOtp extends StatefulWidget {
  final Map<String, dynamic> signupData;
  final String otp;
  

  const HospitalSignUpOtp({
    super.key,
    required this.signupData,
    required this.otp,
    
  });

  @override
  HospitalSignUpOtpState createState() => HospitalSignUpOtpState();
}

class HospitalSignUpOtpState extends State<HospitalSignUpOtp> {
  late Timer _timer;
  int _secondsRemaining = 120;
  bool _isTimerActive = true;
  String otp = "";

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


// Future<void> submitSignup() async {
//   if (otp.isEmpty || otp.length != 6) {
//     print('Error: Please enter a valid 6-digit OTP.');
//     return;
//   }

//   try {
//     var request = http.MultipartRequest(
//       'POST',
//       Uri.parse('https://doctorapp.com.softservice.site/api/auth/signup'),
//     );

//     // Adding fields
//     request.fields.addAll({
//       'hospital_name': widget.signupData['hospitalName'] ?? '',
//       'reg_number': widget.signupData['regNumber'] ?? '',
//       'establish': widget.signupData['establish'] ?? '',
//       'country': widget.signupData['country'] ?? '',
//       'division': widget.signupData['division'] ?? '',
//       'district': widget.signupData['district'] ?? '',
//       'sub_district': widget.signupData['subDistrict'] ?? '',
//       'location_details': widget.signupData['locationDetails'] ?? '',
//       'mobile_number_1': widget.signupData['mobileNumber1'] ?? '',
//       'mobile_number_2': widget.signupData['mobileNumber2'] ?? '',
//       'email': widget.signupData['email'] ?? '',
//       'admin_name': widget.signupData['adminName'] ?? '',
//       'admin_mobile': widget.signupData['adminMobile'] ?? '',
//       'admin_email': widget.signupData['adminEmail'] ?? '',
//       'password': widget.signupData['password'] ?? '',
//       'otp': otp.toString(),
//     });

//     // Adding files
//     if (widget.signupData['logoPath'] != null &&
//         File(widget.signupData['logoPath']!).existsSync()) {
//       request.files.add(
//         await http.MultipartFile.fromPath('logo', widget.signupData['logoPath']!),
//       );
//     }

//     if (widget.signupData['frontPicturePath'] != null &&
//         File(widget.signupData['frontPicturePath']!).existsSync()) {
//       request.files.add(
//         await http.MultipartFile.fromPath(
//             'front_picture', widget.signupData['frontPicturePath']!),
//       );
//     }

//     http.StreamedResponse response = await request.send();

//     if (response.statusCode == 200) {
//       String responseBody = await response.stream.bytesToString();
//       final data = jsonDecode(responseBody);

//       if (data['message'] == 'User created successfully') {
//         print('Success: ${data['message']}');
//         // Navigate directly to HospitalLoginPage
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => HospitalLoginPage()),
//         );
//       } else {
//         print('Error: ${data['message'] ?? 'An unknown error occurred.'}');
//       }
//     } else {
//       String responseBody = await response.stream.bytesToString();
//       final errorData = jsonDecode(responseBody);
//       print('Error: ${errorData['message'] ?? 'Failed to sign up. Please try again later.'}');
//     }
//   } catch (e) {
//     print('Error: An unexpected error occurred: $e');
//   }
// }



Future<void> submitSignup() async {
  if (otp.isEmpty || otp.length != 6) {
    print('Error: Please enter a valid 6-digit OTP.');
    return;
  }

  try {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://doctorapp.com.softservice.site/api/auth/signup'),
    );

    // Adding fields
    request.fields.addAll({
      'hospital_name': widget.signupData['hospitalName'] ?? '',
      'reg_number': widget.signupData['regNumber'] ?? '',
      'establish': widget.signupData['establish'] ?? '',
      'country': widget.signupData['country'] ?? '',
      'division': widget.signupData['division'] ?? '',
      'district': widget.signupData['district'] ?? '',
      'sub_district': widget.signupData['subDistrict'] ?? '',
      'location_details': widget.signupData['locationDetails'] ?? '',
      'mobile_number_1': widget.signupData['mobileNumber1'] ?? '',
      'mobile_number_2': widget.signupData['mobileNumber2'] ?? '',
      'email': widget.signupData['email'] ?? '',
      'admin_name': widget.signupData['adminName'] ?? '',
      'admin_mobile': widget.signupData['adminMobile'] ?? '',
      'admin_email': widget.signupData['adminEmail'] ?? '',
      'password': widget.signupData['password'] ?? '',
      'otp': otp.toString(),
    });

    // Adding files
    if (widget.signupData['logoPath'] != null &&
        File(widget.signupData['logoPath']!).existsSync()) {
      request.files.add(
        await http.MultipartFile.fromPath('logo', widget.signupData['logoPath']!),
      );
    }

    if (widget.signupData['frontPicturePath'] != null &&
        File(widget.signupData['frontPicturePath']!).existsSync()) {
      request.files.add(
        await http.MultipartFile.fromPath(
            'front_picture', widget.signupData['frontPicturePath']!),
      );
    }

    // Ensuring that the content type is set properly
    request.headers.addAll({
      'Content-Type': 'multipart/form-data', // Ensure this header is set correctly
    });

    // Sending the request and logging the response status and body
    http.StreamedResponse response = await request.send();

    print('Response status: ${response.statusCode}');
    String responseBody = await response.stream.bytesToString();
    print('Response body: $responseBody');

    if (response.statusCode == 201) {
      final data = jsonDecode(responseBody);

      if (data['message'] == 'User created successfully') {
        print('Success: ${data['message']}');
        // Navigate directly to HospitalLoginPage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HospitalLoginPage()),
        );
      } else {
        print('Error: ${data['message'] ?? 'An unknown error occurred.'}');
      }
    } else {
      final errorData = jsonDecode(responseBody);
      print('Error: ${errorData['message'] ?? 'Failed to sign up. Please try again later.'}');
    }
  } catch (e) {
    print('Error: An unexpected error occurred: $e');
  }
}






  @override
  Widget build(BuildContext context) {
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
           // Text('OTP: $otp'),
           if (widget.signupData['adminEmail'] != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Admin Email: ${widget.signupData['adminEmail']}",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ),
             Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "OTP: ${widget.otp}",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ),
          if (widget.signupData['division'] != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                "Division: ${widget.signupData['division']}",
                style: const TextStyle(
                  color: Colors.grey,
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
                setState(() {
                  otp = pin;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              _isTimerActive
                  ? "Time Remaining: ${_formatTime(_secondsRemaining)}"
                  : "OTP expired",
              style: TextStyle(
                fontSize: 18,
                color: _isTimerActive ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
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
                  onPressed: _isTimerActive ? submitSignup : null,
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            if (!_isTimerActive)
              TextButton(
                onPressed: () {
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










