import 'package:dream_tech_doctor/utils/colors.dart';
import 'package:dream_tech_doctor/utils/images.dart';
import 'package:dream_tech_doctor/view/doctor_appointment/doctor_appointment_pdf.dart';
import 'package:dream_tech_doctor/view/doctor_appointment/fee_visite_time.dart';
import 'package:dream_tech_doctor/view/explore/book_appointment_Screen.dart';
import 'package:dream_tech_doctor/view/explore/doctor_details_page.dart';
import 'package:dream_tech_doctor/view/widgets/doctor_card.dart';
import 'package:dream_tech_doctor/view/widgets/doctor_card2.dart';
import 'package:flutter/material.dart';

class DoctorAllAppointment extends StatefulWidget {
  const DoctorAllAppointment({super.key});

  @override
  State<DoctorAllAppointment> createState() => _DoctorAllAppointmentState();
}

class _DoctorAllAppointmentState extends State<DoctorAllAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Doctor Appointment",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColor.primaryColor.withOpacity(0.7),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: DoctorCard2(
                imageUrl: AppImages.doctor4,
                name: 'Dr. Sarah Connor',
                qualifications:
                    'MBBS MS DMU\nSpecialized in Pediatric Urology\nHarvard Medical School',
                specialization:
                    'Specialist\nPediatric Urology, Surgery, Child Care',
                proposerInfo:
                    'Professor\nDepartment of Pediatric Surgery\nBoston Medical Center\n01234-567890',
                registrationNumber: '987654',
              ),
            ),

            const SizedBox(
              height: 5,
            ),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppImages.hospital, // Replace with your logo
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Square hospital',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'House# 68, Road# 15/A, Dhanmondi, Dhaka-1206',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Text(
                              'nitd22@gmail.com',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Text(
                              '0194-994406, 01778344090',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Schedule Table
            SizedBox(
              height: 380,
              child: Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Table(
                        border: TableBorder.all(color: Colors.grey.shade300),
                        columnWidths: {
                          0: const FlexColumnWidth(1),
                          1: const FlexColumnWidth(2),
                          2: const FlexColumnWidth(2),
                          3: const FlexColumnWidth(1),
                        },
                        children: [
                          _buildTableRow(
                            ['Days', 'Start Time', 'End Time', 'Visit.L'],
                            isHeader: true,
                          ),
                          _buildTableRow(
                              ['Sat', '10:30 AM', '05:30 PM', '120']),
                          _buildTableRow(
                              ['Sun', '10:30 AM', '05:30 PM', '120']),
                          _buildTableRow(
                              ['Mon', '10:30 AM', '05:30 PM', '120']),
                          _buildTableRow(['Tue', '10:30 AM', '05:30 PM', '90']),
                          _buildTableRow(['Wed', '10:30 AM', '05:30 PM', '50']),
                          _buildTableRow(
                              ['Thu', '10:30 AM', '07:30 PM', '120']),
                          _buildTableRow(
                              ['Dri', '10:30 AM', '05:30 PM', '120']),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Appointment action here
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AppointmentBookingPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          'Appointment',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppImages.hospitallogo, // Replace with your logo
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ibna Sina Hospitalet',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'House# 68, Road# 15/A, Dhanmondi, Dhaka-1206',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Text(
                              'nitd22@gmail.com',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Text(
                              '0194-994406, 01778344090',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 380,
              child: Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Table(
                        border: TableBorder.all(color: Colors.grey.shade300),
                        columnWidths: {
                          0: const FlexColumnWidth(1),
                          1: const FlexColumnWidth(2),
                          2: const FlexColumnWidth(2),
                          3: const FlexColumnWidth(1),
                        },
                        children: [
                          _buildTableRow(
                            ['Days', 'Start Time', 'End Time', 'Visit.L'],
                            isHeader: true,
                          ),
                          _buildTableRow(
                              ['Sat', '10:30 AM', '05:30 PM', '120']),
                          _buildTableRow(
                              ['Sun', '10:30 AM', '05:30 PM', '120']),
                          _buildTableRow(
                              ['Mon', '10:30 AM', '05:30 PM', '120']),
                          _buildTableRow(['Tue', '10:30 AM', '05:30 PM', '90']),
                          _buildTableRow(['Wed', '10:30 AM', '05:30 PM', '50']),
                          _buildTableRow(
                              ['Thu', '10:30 AM', '07:30 PM', '120']),
                          _buildTableRow(
                              ['Dri', '10:30 AM', '05:30 PM', '120']),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Appointment action here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          'Appointment',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      children: cells.map((cell) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            cell,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              fontSize: isHeader ? 14 : 12,
              color: isHeader ? Colors.black : Colors.grey[700],
            ),
          ),
        );
      }).toList(),
    );
  }
}
