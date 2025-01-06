import 'dart:convert';

import 'package:dream_tech_doctor/utils/images.dart';
import 'package:dream_tech_doctor/view/hospital/doctor/doctor_details_view/controller_doctor_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DoctorDetailScreen extends StatelessWidget {
  final int doctorId;

  const DoctorDetailScreen({super.key, required this.doctorId});

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

                  const Text('Schedule:', style:   TextStyle(fontSize: 16)),

                  const SizedBox(
                    height: 5,
                  ),
                  DoctorScheduleTable(scheduleJson: doctor.schedule),
                  // You can add more details as needed

                  const SizedBox(
                    height: 20,
                  ),

                  

                  ////////////==============api
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
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Confirmation'),
                content: const Text('Are you sure you want to Deactivate the doctor?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(), // Close the dialog
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () async {

                      var doctorId = doctor.id;
                      // Close the dialog
                      // Call API to activate doctor
                      var headers = {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                      };
                      var request = http.MultipartRequest(
                        'POST',
                        Uri.parse('https://doctorapp.com.softservice.site/api/auth/hospital-doctor/change-status'),
                      );
                      request.fields.addAll({
                        'doctorId': '$doctorId',
                        'status': '0' // Activate doctor
                      });
                      request.headers.addAll(headers);

                      http.StreamedResponse response = await request.send();

                      if (response.statusCode == 201) {
                        debugPrint(await response.stream.bytesToString());
                        doctorController.toggleDoctorStatus();
                      } else {
                        debugPrint(response.reasonPhrase);
                      }
                       Navigator.of(context).pop();
                    },
                    child: const Text('Deactive', style: TextStyle(color: Colors.red),),
                  ),
                ],
              );
            },
          );
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
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Confirmation'),
                content: const Text('Are you sure you want to Activate the doctor?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(), // Close the dialog
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () async {
                      // Close the dialog
                      // Call API to deactivate doctor
                      var headers = {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                      };
                      var request = http.MultipartRequest(
                        'POST',
                        Uri.parse('https://doctorapp.com.softservice.site/api/auth/hospital-doctor/change-status'),
                      );
                      request.fields.addAll({
                        'doctorId': '$doctorId',
                        'status': '1' // Deactivate doctor
                      });
                      request.headers.addAll(headers);

                      http.StreamedResponse response = await request.send();

                      if (response.statusCode == 201) {
                        debugPrint(await response.stream.bytesToString());
                        doctorController.toggleDoctorStatus();
                      } else {
                        debugPrint(response.reasonPhrase);
                      }
                       Navigator.of(context).pop();
                    },
                    child: const Text('Active', style: TextStyle(color: Colors.green),),
                  ),
                ],
              );
            },
          );
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
)
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

  const DoctorScheduleTable({super.key, required this.scheduleJson});

  @override
  Widget build(BuildContext context) {
    // Safely parse the schedule JSON
    List<dynamic> scheduleList = [];
    if (scheduleJson.isNotEmpty) {
      try {
        scheduleList = json.decode(scheduleJson);
      } catch (e) {
        // Handle invalid JSON
        print('Error parsing schedule JSON: $e');
      }
    }

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
          decoration: const BoxDecoration(color: Colors.blue),
          children: [
            _buildHeaderCell('Days'),
            _buildHeaderCell('Start Time'),
            _buildHeaderCell('End Time'),
            _buildHeaderCell('Visit Fee'),
          ],
        ),
        // Data rows
        if (scheduleList.isEmpty)
          TableRow(children: [
            _buildDataCell('No schedule available'),
            _buildDataCell(''),
            _buildDataCell(''),
            _buildDataCell(''),
          ])
        else
          ...scheduleList.map((schedule) {
            return TableRow(
              children: [
                _buildDataCell(schedule['day'] ?? 'N/A'),
                _buildDataCell(schedule['start'] ?? 'N/A'),
                _buildDataCell(schedule['end'] ?? 'N/A'),
                _buildDataCell(schedule['visitLimit']?.toString() ?? 'N/A'),
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

  const SymptomList({super.key, required this.symptomText});

  @override
  Widget build(BuildContext context) {
    // Split the symptom text into a list of strings by periods (excluding empty strings)
    final symptoms =
        symptomText.split('.').where((s) => s.trim().isNotEmpty).toList();

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
