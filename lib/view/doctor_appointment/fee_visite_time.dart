import 'package:dream_tech_doctor/utils/colors.dart';
import 'package:dream_tech_doctor/utils/images.dart';
import 'package:dream_tech_doctor/view/doctor_appointment/doctor_appointment_pdf.dart';
import 'package:dream_tech_doctor/view/widgets/doctor_card2.dart';
import 'package:flutter/material.dart';

class AppointmentBookingPage extends StatefulWidget {
  @override
  State<AppointmentBookingPage> createState() => _AppointmentBookingPageState();
}

class _AppointmentBookingPageState extends State<AppointmentBookingPage> {
  DateTime? _selectedDate;

  final List<bool> _isSelected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Appointment Booking",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColor.primaryColor.withOpacity(0.7),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              height: 10,
            ),
            const Text("Book an appointment at your convenience time"),
            const SizedBox(
              height: 10,
            ),
            // Schedule Table
            Container(
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
                  Table(
                    border: TableBorder.all(color: Colors.grey.shade300),
                    columnWidths: const {
                      0: FlexColumnWidth(0.5), // Adjusted for checkbox
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(1.5),
                      3: FlexColumnWidth(1.5),
                      4: FlexColumnWidth(1),
                    },
                    children: [
                      _buildTableRow(
                        [
                          '', // Checkbox placeholder
                          'Days',
                          'Start Time',
                          'End Time',
                          'Visit.L',
                        ],
                        isHeader: true,
                      ),
                      _buildTableRowWithCheckbox(
                          0, 'Sat', '10:30 AM', '05:30 PM', '120'),
                      _buildTableRowWithCheckbox(
                          1, 'Sun', '10:30 AM', '05:30 PM', '120'),
                      _buildTableRowWithCheckbox(
                          2, 'Mon', '10:30 AM', '05:30 PM', '120'),
                      _buildTableRowWithCheckbox(
                          3, 'Tue', '10:30 AM', '05:30 PM', '90'),
                      _buildTableRowWithCheckbox(
                          4, 'Wed', '10:30 AM', '05:30 PM', '50'),
                      _buildTableRowWithCheckbox(
                          5, 'Thu', '10:30 AM', '05:30 PM', '120'),
                      _buildTableRowWithCheckbox(
                          6, 'Fri', '10:30 AM', '05:30 PM', '100'),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Fee and Visit Time Section
            Column(
              children: [
                GestureDetector(
                  onTap: () => _pickDate(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          size: 20,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          _selectedDate == null
                              ? 'Select Date'
                              : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            Text(
                              'Fee: ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '600',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'Online Payment',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Visit Time',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[700]),
                            ),
                            const SizedBox(width: 8),
                            DropdownButton<String>(
                              items: const [
                                DropdownMenuItem(
                                    value: 'first', child: Text('1st Time')),
                                DropdownMenuItem(
                                    value: 'second', child: Text('2nd Time')),
                                DropdownMenuItem(
                                    value: 'third', child: Text('3rd Time')),
                              ],
                              onChanged: (value) {},
                              hint: const Text('Select'),
                              underline: Container(),
                            ),
                            const SizedBox(width: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Symptom Field
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButtonFormField<String>(
                    items: const [
                      DropdownMenuItem(value: 'Fever', child: Text('Fever')),
                      DropdownMenuItem(value: 'Cold', child: Text('Cold')),
                      DropdownMenuItem(
                          value: 'Headache', child: Text('Headache')),
                    ],
                    onChanged: (value) {},
                    hint: const Text('Symptom'),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                      alignLabelWithHint: true,
                    ),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Apply Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppointmentDetailsPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: const Text(
                  'Apply',
                  style: TextStyle(fontSize: 16, color: Colors.white),
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

  TableRow _buildTableRowWithCheckbox(
      int index, String day, String startTime, String endTime, String visitL) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Checkbox(
            value: _isSelected[index],
            onChanged: (bool? value) {
              setState(() {
                _isSelected[index] = value ?? false; 
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            day, 
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            startTime,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            endTime,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            visitL,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
          ),
        ),
      ],
    );
  }
}
