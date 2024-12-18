// import 'package:dream_tech_doctor/utils/images.dart';
// import 'package:dream_tech_doctor/view/auth/signin.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';

// class CreateAccountPage extends StatefulWidget {
//   @override
//   _CreateAccountPageState createState() => _CreateAccountPageState();
// }

// class _CreateAccountPageState extends State<CreateAccountPage> {
//   bool _isPasswordHidden = true;
//   bool _isTermsAccepted = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           const SizedBox(height: 80,),
//           Center(
//             child: Container(
//               height: 100,
//               width: 200,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(AppImages.popup),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           const Center(
//             child: Text(
//               'Create Account',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           const SizedBox(height: 8),
//           const Center(
//             child: Text(
//               'Fill your information below or register with\n your social account.',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 14,
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//            const Padding(
//              padding: EdgeInsets.symmetric(horizontal: 24.0),
//              child: Text(
//               'Name',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 14,
//               ),
//                          ),
//            ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: TextField(
//               decoration: InputDecoration(
//                 labelText: 'Name',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 12),
//           const Padding(
//              padding: EdgeInsets.symmetric(horizontal: 24.0),
//              child: Text(
//               'Email',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 14,
//               ),
//                          ),
//            ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: TextField(
//               decoration: InputDecoration(
//                 labelText: 'Email',
//                 hintText: 'example@gmail.com',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 12),
//           const Padding(
//              padding: EdgeInsets.symmetric(horizontal: 24.0),
//              child: Text(
//               'Password',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 14,
//               ),
//                          ),
//            ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: TextField(
//               obscureText: _isPasswordHidden,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 suffixIcon: IconButton(
//                   icon: Icon(
//                     _isPasswordHidden
//                         ? Icons.visibility_off
//                         : Icons.visibility,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       _isPasswordHidden = !_isPasswordHidden;
//                     });
//                   },
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 12),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Row(
//               children: [
//                 Checkbox(
//                   value: _isTermsAccepted,
//                   onChanged: (value) {
//                     setState(() {
//                       _isTermsAccepted = value!;
//                     });
//                   },
//                 ),
//                 RichText(
//                   text: const TextSpan(
//                     text: 'Agree with ',
//                     style: TextStyle(color: Colors.black),
//                     children: [
//                       TextSpan(
//                         text: 'Terms & Condition',
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 12),

//           const Spacer(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: SizedBox(
//               width: double.infinity,
//               height: 48,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 onPressed: () {
//                   if (_isTermsAccepted) {
//                     // Handle sign-up action
//                     print('Account Created');
//                   } else {
//                     // Show message
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text('Please accept terms & conditions'),
//                       ),
//                     );
//                   }
//                 },
//                 child: const Text(
//                   'Sign Up',
//                   style: TextStyle(color: Colors.white, fontSize: 16),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
          
           
//           Center(
//             child:  RichText(
//             text: TextSpan(
//               text: 'Already have an account? ',
//               style: const TextStyle(color: Colors.black),
//               children: [
//                 TextSpan(
//                   text: 'Sign In',
//                   style: const TextStyle(
//                     color: Colors.blue,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   recognizer: TapGestureRecognizer()
//                     ..onTap = () {
//                       Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) =>   LoginPage()),
//                 );
//                       print('Sign In clicked');
//                     },
//                 ),
//               ],
//             ),
//           ),
//           ),
//           const SizedBox(height: 30),
//         ],
//       ),
//     );
//   }

//   Widget _socialIconButton(String assetPath) {
//     return Container(
//       height: 50,
//       width: 50,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         border: Border.all(color: Colors.grey, width: 1),
//       ),
//       child: Center(
//         child: Image.asset(
//           assetPath,
//           height: 24,
//           width: 24,
//         ),
//       ),
//     );
//   }
// }






 import 'package:dream_tech_doctor/utils/images.dart';
import 'package:dream_tech_doctor/view/auth/signin.dart';
import 'package:dream_tech_doctor/view/auth/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool _isPasswordHidden = true;
  bool _isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Sign up',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(text: "Patient Sign up"),
              Tab(text: "Doctor Sign up"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildLoginForm(context, "Patient"),
            _buildLoginForm(context, "Doctor"),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context, String userType) {
    return Column(
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
                image: AssetImage(AppImages.popup),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Text(
            'Sign up as $userType',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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
        const Padding(
             padding: EdgeInsets.symmetric(horizontal: 24.0),
             child: Text(
              'Name',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
                         ),
           ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextField(
              decoration: InputDecoration(
                //labelText: 'Name',
                hintText: 'Md. Musa Ahmed',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'Email',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TextField(
            decoration: InputDecoration(
              //labelText: 'Email',
              hintText: 'example@gmail.com',
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'Password',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TextField(
            obscureText: _isPasswordHidden,
            decoration: InputDecoration(
              //labelText: 'Password',
               hintText: '&8/%^56',
               hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordHidden
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordHidden = !_isPasswordHidden;
                  });
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Checkbox(
                  value: _isTermsAccepted,
                  onChanged: (value) {
                    setState(() {
                      _isTermsAccepted = value!;
                    });
                  },
                ),
                RichText(
                  text: const TextSpan(
                    text: 'Agree with ',
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Terms & Condition',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        Spacer(),
        Padding(
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
              onPressed: () {
                // Handle login action
                print('$userType sign up');
              },
              child: Text(
                'Sign Up as $userType',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
 
        Center(
            child:  RichText(
            text: TextSpan(
              text: 'Already have an account? ',
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: 'Sign In',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>   LoginPage()),
                );
                      print('Sign In clicked');
                    },
                ),
              ],
            ),
          ),
          ),
        const SizedBox(height: 20),
      ],
    );
  }
}
