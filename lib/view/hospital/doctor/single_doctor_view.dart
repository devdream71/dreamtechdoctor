import 'package:dream_tech_doctor/utils/colors.dart';
import 'package:dream_tech_doctor/utils/images.dart';
import 'package:flutter/material.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Doctor Details",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColor.primaryColor.withOpacity(0.7),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Header
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                color: Colors.blue.shade800,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                            AppImages.hospital), 
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'IBN Sina Hospital',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'House# 68, Road #15/A, Dhanmondi, Dhaka-1206',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.white, fontSize: 11),
                          ),
                          Text(
                            'ntibd22@gmail.com',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '0194-994406, 01778-344090',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 5),

              // Doctor Details
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                                AppImages.doctor4), // Replace with your asset
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Dr. Md. Jasim Uddin Nizami',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'MBBS DMU FCPS MS\nWHO Clinical Fellow On Child Urologist (India)\nPow On Child Urologist (USA)',
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                const SizedBox(height: 8),
                                const Text('Reg. No: 2132134'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Symptom',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '• You experience chest pain.\n'
                        '• You have high blood pressure.\n'
                        '• You have shortness of breath, palpitations, or dizziness.\n'
                        '• You have diabetes.\n'
                        '• You have a history of smoking.\n'
                        '• You have a history of high cholesterol.\n'
                        '• You have kidney disease.\n'
                        '• You have a family history of heart disease.',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 5),

              // Schedule Table
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Schedule',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Table(
                        border: TableBorder.all(color: Colors.grey),
                        children: [
                          _buildTableRow(
                              ['Days', 'Start Time', 'End Time', 'Visit L.'],
                              isHeader: true),
                          _buildTableRow(
                              ['Sat', '10:30 AM', '05:30 PM', '120']),
                          _buildTableRow(
                              ['Sun', '10:30 AM', '05:30 PM', '120']),
                          _buildTableRow(
                              ['Mon', '10:30 AM', '05:30 PM', '120']),
                          _buildTableRow(
                              ['Tue', '10:30 AM', '05:30 PM', '120']),
                          _buildTableRow(
                              ['Wed', '10:30 AM', '05:30 PM', '120']),
                          _buildTableRow(
                              ['Thu', '10:30 AM', '05:30 PM', '120']),
                          _buildTableRow(
                              ['Fri', '10:30 AM', '05:30 PM', '120']),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 5),

              // Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text(
                  //   'www.healthfover.com',
                  //   style: TextStyle(color: Colors.blue.shade800),
                  // ),
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // Square shape
                        ),
                        backgroundColor: Colors.blue[400],
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.language,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'www.healthfover.com',
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), 
                        ),
                        backgroundColor: Colors.blue[400],
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      label: const Text(
                        '01778-344090',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Appointment',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
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
            ),
          ),
        );
      }).toList(),
    );
  }
}
