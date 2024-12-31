import 'package:dream_tech_doctor/view/auth/signin.dart';
import 'package:dream_tech_doctor/view/doctor_appointment/doctor_all_appointment.dart';
import 'package:dream_tech_doctor/view/hospital/auth/hospital_login/hospital_login.dart';
import 'package:dream_tech_doctor/view/hospital/hospital_bottom_nav.dart';
import 'package:dream_tech_doctor/view/prescription/prescription_create.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

 

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut<LoginController>(() => LoginController());
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              Card(
                child: ListTile(
                  title: const Text("Hospital"),
                  leading: const Icon(Icons.medication),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    String? token = prefs.getString('access_token');

                    if (token != null && token.isNotEmpty) {
                      // Token exists, navigate to the HospitalBottomNav page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HospitalBottomNav()),
                      );
                    } else {
                      // Token doesn't exist, navigate to the HospitalLoginPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HospitalLoginPage()),
                      );
                    }

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => HospitalLoginPage()),
                    //   );
                  },
                ),
              ),
              //const SizedBox(height: 1.0),
              Card(
                child: ListTile(
                  title: const Text("Doctor"),
                  leading: const Icon(Icons.vaccines),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const DoctorAllAppointment()));
                  },
                ),
              ),
              //const SizedBox(height: 1.0),
              Card(
                child: ListTile(
                  title: const Text("Symptoms"),
                  leading: const Icon(Icons.bloodtype),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    //diologMY(context);
                  },
                ),
              ),
              //const SizedBox(height: 1.0),
              Card(
                child: ListTile(
                  title: const Text("Pathology"),
                  leading: const Icon(Icons.healing),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    //diologMY(context);
                  },
                ),
              ),
              //const SizedBox(height: 1.0),
              Card(
                child: ListTile(
                  title: const Text("Medicine"),
                  leading: const Icon(Icons.medical_services),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    //diologMY(context);
                  },
                ),
              ),
              //const SizedBox(height: 1.0),
              Card(
                child: ListTile(
                  title: const Text("Medicine Reminder"),
                  leading: const Icon(Icons.alarm),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    //diologMY(context);
                  },
                ),
              ),
              //const SizedBox(height: 1.0),
              Card(
                child: ListTile(
                  title: const Text("All Prescription"),
                  leading: const Icon(Icons.document_scanner_outlined),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PrescriptionForm()));
                  },
                ),
              ),
              //const SizedBox(height: 1.0),
              Card(
                child: ListTile(
                  title: const Text("Pharmacy"),
                  leading: const Icon(Icons.storefront),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
              ),
              //const SizedBox(height: 1.0),
              Card(
                child: ListTile(
                  title: const Text("Ambulance"),
                  leading: const Icon(Icons.airport_shuttle),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
              ),
              //const SizedBox(height: 1.0),
              Card(
                child: ListTile(
                  title: const Text("Personal Info"),
                  leading: const Icon(Icons.info),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ),
              //const SizedBox(height: 1.0),
              Card(
                child: ListTile(
                  title: const Text("Notification"),
                  leading: const Icon(Icons.fact_check),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
              ),
              //const SizedBox(height: 1.0),

              // Language Change Button
              Card(
                child: ListTile(
                  title: const Text("Change Language"),
                  leading: const Icon(Icons.language),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
              ),

              //const SizedBox(height: 1.0),

              Card(
                child: ListTile(
                  title: const Text("Log out"),
                  leading: const Icon(Icons.logout),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
              ),
              //const SizedBox(height: 1.0),
              Card(
                child: ListTile(
                  title: const Text("Delete Account"),
                  leading: const Icon(Icons.delete),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () async {},
                ),
              ),
              //const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    )));
  }
}
