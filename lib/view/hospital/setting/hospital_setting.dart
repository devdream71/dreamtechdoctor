import 'package:dream_tech_doctor/view/doctor_appointment/doctor_all_appointment.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/all_doctor_list.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/hospital_doctor_create.dart';
import 'package:flutter/material.dart';

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
              
            ],
          ),
        ),
      ],
    )));
  }
}
