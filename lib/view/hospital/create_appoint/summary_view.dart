import 'package:flutter/material.dart';

class AppointmentSummaryScreen extends StatelessWidget {
  const AppointmentSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Appointments Summary View'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Form Inputs
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Visit Date',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Department/Category',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Doctor',
                border: OutlineInputBorder(),
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
            const SizedBox(height: 16),
            // Data Table
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: DataTable(
                    headingRowColor: MaterialStateProperty.all(Colors.blue),
                    headingTextStyle: const TextStyle(color: Colors.white),
                    columns: const [
                      DataColumn(label: Text('S.L No')),
                      DataColumn(label: Text('Category/Department')),
                      DataColumn(label: Text('Doctor Name')),
                      DataColumn(label: Text('Patient Name')),
                      DataColumn(label: Text('Visit Date')),
                      DataColumn(label: Text('Appoint')),
                    ],
                    rows: List<DataRow>.generate(
                      6,
                      (index) => DataRow(
                        cells: [
                          DataCell(Text((index + 1).toString().padLeft(2, '0'))),
                          const DataCell(Text('Heart')),
                          const DataCell(Text('Md. Shakib')),
                          const DataCell(Text('Md. Tamim')),
                          const DataCell(Text('20.02.24')),
                          const DataCell(Text('Online')),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: const Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
