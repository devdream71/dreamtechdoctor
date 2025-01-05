import 'package:dream_tech_doctor/view/bottom_nav.dart';
import 'package:flutter/material.dart';
 
import 'package:get/get.dart';
 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BottomNav(),
      

    );
  }
}


                  //   showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return AlertDialog(
                  //       title: const Text("Feature Not Available"),
                  //       content: const Text(
                  //           "This feature is not available at the moment."),
                  //       actions: [
                  //         TextButton(
                  //           onPressed: () {
                  //             Navigator.of(context).pop(); // Close the dialog
                  //           },
                  //           child: const Text("OK"),
                  //         ),
                  //       ],
                  //     );
                  //   },
                  // );




