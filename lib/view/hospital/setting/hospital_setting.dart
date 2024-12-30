import 'package:dream_tech_doctor/view/bottom_nav.dart';
import 'package:dream_tech_doctor/view/doctor_appointment/doctor_all_appointment.dart';
import 'package:dream_tech_doctor/view/home/home.dart';
import 'package:dream_tech_doctor/view/hospital/auth/hospital_login/hospital_login.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/all_doctor_list.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/hospital_doctor_create.dart';
import 'package:dream_tech_doctor/view/hospital/hospital_bottom_nav.dart';
import 'package:dream_tech_doctor/view/widgets/logout_alart_diolog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HospitalSetting extends StatelessWidget {
  const HospitalSetting({super.key});



  @override
  Widget build(BuildContext context) {
    // Get.lazyPut<LoginController>(() => LoginController());
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              //const SizedBox(height: 1.0),
              Card(
                child: ListTile(
                  title: const Text("Doctor Create"),
                  leading: const Icon(Icons.vaccines),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const HospitalDoctorCreate()));
                  },
                ),
              ),
              //const SizedBox(height: 1.0),
              Card(
                child: ListTile(
                  title: const Text("View All Doctor"),
                  leading: const Icon(Icons.vaccines),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                  DoctorManagementScreen()));
                  },
                ),
              ),

              Card(
                child: ListTile(
                  title: const Text("Log out"),
                  leading: const Icon(Icons.vaccines),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                      showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Logout'),
                content: const Text('Are you sure you want to log out?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      // Close the dialog
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Optional: Style the button
                    ),
                    onPressed: () {
                      // Perform logout action here
                      //Navigator.of(context).pop(); // Close the dialog

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const BottomNav()));
                      
                    },
                    child: const Text('Logout', style: TextStyle(color: Colors.white),),
                  ),
                ],
              );
            },
          );
                  },
                ),
              ),

              Card(
                child: ListTile(
                  title: const Text("Delete Account"),
                  leading: const Icon(Icons.vaccines),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    
                  },
                ),
              ),
              
            ],
          ),
        ),
      ],
    )));
  }
}
