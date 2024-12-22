import 'package:dream_tech_doctor/utils/colors.dart';
import 'package:flutter/material.dart';

class DoctorPrescriptionUI extends StatelessWidget {
  const DoctorPrescriptionUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Prescription",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColor.primaryColor.withOpacity(0.7),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor and Clinic Info
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr. Onkar Bhave",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text("M.B.B.S., M.D., M.S. | Reg No: 270988"),
                    Text("Mob: 9983390126"),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Care Clinic",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text("Near Axis Bank, Kothrud, Pune - 411038."),
                    Text("Ph: 09423380390, Timing: 9:00 AM - 2:00 PM"),
                    Text("Closed: Thursday"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Patient Info
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ID: 266 - DEMO PATIENT (M)",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Address: Dhaka"),
                  Text("Temp (deg): 36, BP: 120/80 mmHg"),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Date and Time
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Date: 27-Apr-2020, 04:37 PM"),
              ],
            ),
            const SizedBox(height: 16),

            // Prescription Table Header
            Table(
              border: TableBorder.all(color: Colors.black),
              columnWidths: const {
                0: FlexColumnWidth(4),
                1: FlexColumnWidth(3),
                2: FlexColumnWidth(3),
              },
              children: const [
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Medicine Name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Dosage",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Duration",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Prescription Table Content
            Table(
              border: TableBorder.all(color: Colors.black),
              columnWidths: const {
                0: FlexColumnWidth(4),
                1: FlexColumnWidth(3),
                2: FlexColumnWidth(3),
              },
              children: const [
                TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("1) TAB. DEMO MEDICINE 1"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("1 Morning, 1 Night\n(Before Food)"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("10 Days\n(Tot: 20 Tab)"),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("2) CAP. DEMO MEDICINE 2"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("1 Morning, 1 Night\n(Before Food)"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("10 Days\n(Tot: 20 Cap)"),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("3) TAB. DEMO MEDICINE 3"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child:
                          Text("1 Morning, 1 Afternoon, 1 Night\n(After Food)"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("10 Days\n(Tot: 30 Tab)"),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("4) TAB. DEMO MEDICINE 4"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("1/2 Morning, 1/2 Night\n(After Food)"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("10 Days\n(Tot: 10 Tab)"),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Advice Given
            const Text(
              "Advice Given:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text("• AVOID OILY AND SPICY FOOD"),
            const SizedBox(height: 8),

            // Follow-Up
            const Text(
              "Follow Up: 12-05-2020",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
