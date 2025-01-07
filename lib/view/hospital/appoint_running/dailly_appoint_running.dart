import 'package:flutter/material.dart';

class DaillyAppointRunning extends StatelessWidget {
  final List<Map<String, dynamic>> patients = [
    {
      'slNo': '01',
      'name': 'Jasim',
      'clarified': true,
      'payment': 'Paid',
    },
    {
      'slNo': '02',
      'name': 'Nizam',
      'clarified': false,
      'payment': 'Unpaid',
    },
    {
      'slNo': '01',
      'name': 'Jasim',
      'clarified': true,
      'payment': 'Paid',
    },
  ];

  final Map<String, dynamic> patientDetails = const {
    'Name': 'Md. Jasim Uddin',
    'Mobile': '01778344090',
    'Gender': 'Male',
    'Age': '25',
    'Appoint': 'Online',
    'Visit Time': '1st',
    'Amount': '500',
    'Reference': 'Dr. Kawsar Alom',
  };

  DaillyAppointRunning({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dailly Appoint Running'),
        //backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Visit Date"),
                      TextFormField(
                        cursorHeight: 14,
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          //labelText: 'Visit Date',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Department/Category"),
                      TextFormField(
                        cursorHeight: 14,
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          //labelText: 'Department/Category',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Doctor"),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                //labelText: 'Doctor',
                border: OutlineInputBorder(),
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Doctor1',
                  child: Text('Doctor 1'),
                ),
                DropdownMenuItem(
                  value: 'Doctor2',
                  child: Text('Doctor 2'),
                ),
              ],
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              itemCount: patients.length,
              itemBuilder: (context, index) {
                final patient = patients[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Serial Number
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.teal[100],
                          child: Text(
                            patient['slNo'],
                            style: const TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Patient Name and Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                patient['name'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 1),
                              Row(
                                children: [
                                  // Clarified Status
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: patient['clarified']
                                          ? Colors.green[100]
                                          : Colors.red[100],
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          patient['clarified']
                                              ? Icons.check
                                              : Icons.close,
                                          color: patient['clarified']
                                              ? Colors.green
                                              : Colors.red,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          patient['clarified']
                                              ? 'Clarified'
                                              : 'Pending',
                                          style: TextStyle(
                                            color: patient['clarified']
                                                ? Colors.green
                                                : Colors.red,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  // Payment Status Dropdown
                                  DropdownButton<String>(
                                    value: patient['payment'],
                                    items: ['Paid', 'Unpaid']
                                        .map((status) => DropdownMenuItem(
                                              value: status,
                                              child: Text(
                                                status,
                                                style: TextStyle(
                                                  color: status == 'Paid'
                                                      ? Colors.green
                                                      : Colors.red,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      // Handle dropdown value change
                                    },
                                    underline: const SizedBox(),
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Action Button
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            // Handle action button press
                            _showPatientDetailsDialog(context, patientDetails);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showPatientDetailsDialog(
      BuildContext context, Map<String, dynamic> details) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Close Button
                Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    radius: 15,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.red,
                        size: 15,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                // Table
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(2),
                  },
                  border: TableBorder.all(color: Colors.grey),
                  children: details.entries.map((entry) {
                    return TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            entry.key,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(entry.value.toString()),
                        ),
                      ],
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                // Ok Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),
                  child: const Text(
                    'Ok',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
