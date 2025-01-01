import 'dart:convert';

import 'package:dream_tech_doctor/utils/images.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/doctor_details_view/controller_doctor_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorDetailScreen extends StatelessWidget {
  final int doctorId;

  DoctorDetailScreen({required this.doctorId});

  @override
  Widget build(BuildContext context) {
    final doctorController = Get.put(DoctorDetailsViewController());

    // Fetch doctor details when the screen is loaded
    doctorController.fetchDoctorDetails(doctorId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Details'),
      ),
      body: Obx(() {
        if (doctorController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (doctorController.doctor.value == null) {
          return const Center(child: Text('No doctor data available.'));
        } else {
          final doctor = doctorController.doctor.value!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(doctor.doctorImage),
                        onBackgroundImageError: (error, stackTrace) {
                          // If loading fails, fallback to a default image
                        },
                        child: doctor.doctorImage
                                .isEmpty // If the image is empty, show default
                            ? Image.asset(
                                AppImages.doctor2,
                                fit: BoxFit.cover,
                              )
                            : null, // Show nothing if the image loads successfully
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name: ${doctor.doctorName}',
                              style: const TextStyle(fontSize: 20)),
                          Text('Department: ${doctor.departmentCategory}',
                              style: const TextStyle(fontSize: 16)),
                          Text('Department: ${doctor.regNum}',
                              style: const TextStyle(fontSize: 16)),
                        ],
                      )
                    ],
                  ),
              
                  const SizedBox(height: 16),
              
                  Text('Email: ${doctor.email}',
                      style: const TextStyle(fontSize: 16)),
                  Text('Age: ${doctor.age}',
                      style: const TextStyle(fontSize: 16)),
                  Text('Gender: ${doctor.gender}',
                      style: const TextStyle(fontSize: 16)),
                  Text('Specialist: ${doctor.specialist.join(", ")}',
                      style: const TextStyle(fontSize: 16)),
                  // Text('Schedule: ${doctor.schedule}',
                  //     style: const TextStyle(fontSize: 16)),
                  // Text('Symptom: ${doctor.symptom}',
                  //     style: const TextStyle(fontSize: 16)),
                  SymptomList(symptomText: doctor.symptom),
                  const SizedBox(height: 20),
                  Text('Visit Fee: ${doctor.visitFee}',
                      style: const TextStyle(fontSize: 16)),
                  Text('Payment Type: ${doctor.paymentType}',
                      style: const TextStyle(fontSize: 16)),
              
                  Text('Schedule:', style: const TextStyle(fontSize: 16)),

                  SizedBox(height: 5,),
                  DoctorScheduleTable(scheduleJson: doctor.schedule),
                  // You can add more details as needed
              
                  const SizedBox(
                    height: 20,
                  ),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Active button (Visible only if doctor is inactive)
                      if (!doctorController.isDoctorActive.value)
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onPressed: () {
                            doctorController.toggleDoctorStatus();
                          },
                          child: const Text(
                            'Active',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      const SizedBox(width: 10),
                      // Inactive button (Visible only if doctor is active)
                      if (doctorController.isDoctorActive.value)
                        ElevatedButton(
                          onPressed: () {
                            doctorController.toggleDoctorStatus();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            backgroundColor: Colors.red,
                          ),
                          child: const Text(
                            'Inactive',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}

class DoctorScheduleTable extends StatelessWidget {
  final String scheduleJson;

  DoctorScheduleTable({required this.scheduleJson});

  @override
  Widget build(BuildContext context) {
    // Parse the schedule JSON
    final List<dynamic> scheduleList = json.decode(scheduleJson);

    return Table(
      border: TableBorder.all(color: Colors.black),
      columnWidths: const {
        0: FlexColumnWidth(2), // Days column
        1: FlexColumnWidth(2), // Start Time column
        2: FlexColumnWidth(2), // End Time column
        3: FlexColumnWidth(2), // Visit Fee column
      },
      children: [
        // Header row
        TableRow(
          decoration: BoxDecoration(color: Colors.blue),
          children: [
            _buildHeaderCell('Days'),
            _buildHeaderCell('Start Time'),
            _buildHeaderCell('End Time'),
            _buildHeaderCell('Visit Fee'),
          ],
        ),
        // Data rows
        ...scheduleList.map((schedule) {
          return TableRow(
            children: [
              _buildDataCell(schedule['day']),
              _buildDataCell(schedule['start']),
              _buildDataCell(schedule['end']),
              _buildDataCell(schedule['visitLimit']),
            ],
          );
        }).toList(),
      ],
    );
  }

  Widget _buildHeaderCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDataCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}



 

class SymptomList extends StatelessWidget {
  final String symptomText;

  SymptomList({required this.symptomText});

  @override
  Widget build(BuildContext context) {
    // Split the symptom text into a list of strings by periods (excluding empty strings)
    final symptoms = symptomText.split('.').where((s) => s.trim().isNotEmpty).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Symptom',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...symptoms.map((symptom) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '\u2022 ', // Bullet symbol
                  style: TextStyle(fontSize: 16),
                ),
                Expanded(
                  child: Text(
                    symptom.trim(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}

