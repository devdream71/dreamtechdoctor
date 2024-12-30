import 'package:dream_tech_doctor/view/hospital/auth/hospital_login/hospital_login.dart';
import 'package:dream_tech_doctor/view/widgets/custom_form_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dream_tech_doctor/view/hospital/auth/forget_password/controller/reset_password_controller.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();

  final ResetPasswordController controller = Get.put(ResetPasswordController());

  bool _isPasswordHidden = true;
  bool _isConfirmPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
     final Map<String, dynamic> args = Get.arguments;
    final String adminEmail = args['adminEmail'];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Reset Password hospital"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Text(adminEmail),
            const SizedBox(height: 90),
            CustomTextFormField(
              labelText: 'Password',
              isRequired: true,
              hintText: 'Enter your password',
              controller: passwordController,
              obscureText: _isPasswordHidden,
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordHidden = !_isPasswordHidden;
                  });
                },
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 5),
            CustomTextFormField(
              isRequired: true,
              labelText: 'Confirm Password',
              hintText: 'Enter your confirm password',
              controller: passwordConfirmController,
              obscureText: _isConfirmPasswordHidden,
              suffixIcon: IconButton(
                icon: Icon(
                  _isConfirmPasswordHidden ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _isConfirmPasswordHidden = !_isConfirmPasswordHidden;
                  });
                },
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your confirm password';
                }
                return null;
              },
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (passwordController.text.isEmpty ||
                      passwordConfirmController.text.isEmpty) {
                    Get.snackbar('Error', 'Please fill in both password fields.',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white);
                    return;
                  }

                  if (passwordController.text != passwordConfirmController.text) {
                    Get.snackbar('Error', 'Passwords do not match.',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white);
                    return;
                  }

                  // final adminEmail = '$adminEmail'; // Replace with actual email
                  controller.resetPassword(
                    adminEmail,
                    passwordController.text,
                    passwordConfirmController.text,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}




// class ResetPassword extends StatefulWidget {
//   const ResetPassword({super.key});

//   @override
//   State<ResetPassword> createState() => _ResetPasswordState();
// }

// class _ResetPasswordState extends State<ResetPassword> {
//   final TextEditingController passwordController = TextEditingController();

//   final TextEditingController passwordConformController =
//       TextEditingController();

//   bool _isPasswordHidden = true;

//   bool _isConformPasswordHidden = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text("Reset Password hospital"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 90,
//             ),
//             CustomTextFormField(
//               labelText: 'Password',
//               isRequired: true,
//               hintText: 'Enter your password',
//               controller: passwordController,
//               obscureText: _isPasswordHidden,
//               suffixIcon: IconButton(
//                 icon: Icon(
//                   _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _isPasswordHidden = !_isPasswordHidden;
//                   });
//                 },
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your password';
//                 }
//                 return null;
//               },
//             ),
//             const SizedBox(height: 5),
//             CustomTextFormField(
//               isRequired: true,
//               labelText: 'Conform Password',
//               hintText: 'Enter your conform password',
//               controller: passwordConformController,
//               obscureText: _isConformPasswordHidden,
//               suffixIcon: IconButton(
//                 icon: Icon(
//                   _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _isConformPasswordHidden = !_isConformPasswordHidden;
//                   });
//                 },
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your password';
//                 }
//                 return null;
//               },
//             ),
//             const Spacer(),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=>HospitalLoginPage()));
//                   },
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12))),
//                   child: const Text(
//                     'Next',
//                     style: TextStyle(color: Colors.white),
//                   )),
//             ),
//             const SizedBox(
//               height: 10,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
