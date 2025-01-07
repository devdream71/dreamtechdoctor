import 'package:dream_tech_doctor/utils/images.dart';
import 'package:dream_tech_doctor/view/hospital/auth/forget_password/forget_password.dart';
import 'package:dream_tech_doctor/view/hospital/auth/hospital_login/login_controller.dart';
import 'package:dream_tech_doctor/view/hospital/auth/hospital_sign_up/hospital_signup.dart';
import 'package:dream_tech_doctor/view/widgets/custom_form_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Add Get package for controller

// class HospitalLoginPage extends StatefulWidget {
//   @override
//   _HospitalLoginPageState createState() => _HospitalLoginPageState();
// }

// class _HospitalLoginPageState extends State<HospitalLoginPage> {
//   bool _isPasswordHidden = true;
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   final _formkey = GlobalKey<FormState>();

//   final LoginController loginController =
//       Get.put(LoginController()); // Initialize the controller

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//           backgroundColor: Colors.white,
//           appBar: AppBar(
//             backgroundColor: Colors.white,
//             elevation: 0,
//             title: const Text(
//               'Hospital Login',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           body: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 14.0),
//             child: Form(
//               key: _formkey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const SizedBox(height: 40),
//                   Center(
//                     child: Container(
//                       height: 100,
//                       width: 200,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(AppImages.hospitallogo),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   const Center(),
//                   const SizedBox(height: 8),
//                   const Center(
//                     child: Text(
//                       "Welcome back, you've been missed!",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),

//                   CustomTextFormField(
//                     labelText: 'Email',
//                     isRequired: true,
//                     hintText: 'example@gmail.com',
//                     controller: emailController,
//                     keyboardType: TextInputType.name,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter Email';
//                       }
//                       return null;
//                     },
//                   ),

//                   const SizedBox(height: 12),

//                   CustomTextFormField(
//                     labelText: 'Password',
//                     isRequired: true,
//                     hintText: 'Enter your password',
//                     controller: passwordController,
//                     obscureText: _isPasswordHidden,
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _isPasswordHidden
//                             ? Icons.visibility_off
//                             : Icons.visibility,
//                         size: 18,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _isPasswordHidden = !_isPasswordHidden;
//                         });
//                       },
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your password';
//                       }
//                       if (value.length < 6) {
//                         return 'Password must be at least 6 characters long';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   //====>forget password
//                   InkWell(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ForgetPasswordPage()));
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 24.0),
//                       child: Align(
//                         alignment: Alignment.centerRight,
//                         child: Text(
//                           'Forget Password ?',
//                           style: TextStyle(
//                               color: Colors.blue,
//                               fontSize: 14,
//                               decoration: TextDecoration.underline,
//                               decorationColor: Colors.blue),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   const Spacer(),

//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 24),
//                     child: SizedBox(
//                       width: double.infinity,
//                       height: 48,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         onPressed: loginController.isLoading.value
//                             ? null
//                             : () {
//                                 if (_formkey.currentState?.validate() ??
//                                     false) {
//                                   loginController.login(
//                                     emailController.text,
//                                     passwordController.text,
//                                     context,
//                                   );
//                                 }
//                               },
//                         child: loginController.isLoading.value
//                             ? CircularProgressIndicator(
//                                 color: Colors.white,
//                               )
//                             : const Text('Sign In',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16)),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Center(
//                     child: RichText(
//                       text: TextSpan(
//                         text: 'Don\'t have an account? ',
//                         style: const TextStyle(color: Colors.black),
//                         children: [
//                           TextSpan(
//                             text: 'Sign up',
//                             style: const TextStyle(
//                               color: Colors.blue,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             recognizer: TapGestureRecognizer()
//                               ..onTap = () {
//                                 Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const HospitalSignUpPage()),
//                                 );
//                               },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                 ],
//               ),
//             ),
//           )),
//     );
//   }
// }





class HospitalLoginPage extends StatefulWidget {
  const HospitalLoginPage({super.key});

  @override
  HospitalLoginPageState createState() => HospitalLoginPageState();
}

class HospitalLoginPageState extends State<HospitalLoginPage> {
  bool _isPasswordHidden = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Hospital Login',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Center(
                child: Container(
                  height: 100,
                  width: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.hospitallogo),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Center(),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  "Welcome back, you've been missed!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                labelText: 'Email',
                isRequired: true,
                hintText: 'example@gmail.com',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              CustomTextFormField(
                labelText: 'Password',
                isRequired: true,
                hintText: 'Enter your password',
                controller: passwordController,
                obscureText: _isPasswordHidden,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                    size: 18,
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
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 5),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HospitalForgetPasswordPage(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Obx(() {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
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
                      onPressed: loginController.isLoading.value
                          ? null
                          : () {
                               ////===>login commit , 
                              if (_formKey.currentState?.validate() ?? false) {
                                loginController.login(
                                  emailController.text,
                                  passwordController.text,
                                  context,
                                );
                              }

                              ////====> with out login 
                      //         Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const HospitalBottomNav()),
                      // );
                             },
                      child: loginController.isLoading.value
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                    ),
                  ),
                );
              }),

              const SizedBox(height: 8,),
              Obx(() {
                if (loginController.loginError.isNotEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        loginController.loginError.value,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              }),
              const SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HospitalSignUpPage(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
