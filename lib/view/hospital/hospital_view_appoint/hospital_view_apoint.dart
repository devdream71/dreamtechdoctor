import 'package:dream_tech_doctor/view/hospital/hospital_view_appoint/hospital_view_appoint_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HospitalViewAapoint extends StatelessWidget {
  final List<Map<String, String>> appointments = [
    {
      'department': 'Cardiology',
      'doctor': 'Dr. Smith',
      'patient': 'John Doe',
      'visitDate': '12/08/2028',
      'slNo': '1',
      'appointType': 'Online',
      'status': 'Pending',
    },
    {
      'department': 'Dermatology',
      'doctor': 'Dr. Jane',
      'patient': 'Jane Doe',
      'visitDate': '12/08/2028',
      'slNo': '2',
      'appointType': 'In-person',
      'status': 'Accepted',  
    },
    {
      'department': 'Neurology',
      'doctor': 'Dr. Taylor',
      'patient': 'Alice Smith',
      'visitDate': '12/09/2028',
      'slNo': '3',
      'appointType': 'Online',
      'status': 'Cancelled',  
    },
  ];

  HospitalViewAapoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointments'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle tap event
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Text(
                      'Appoint View',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle tap event
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Column(
                      children: [
                        Text(
                          '102',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' Appoint',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle tap event
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Text(
                      'New Appoint',
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Department/Category'),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          labelText: 'Department/Category',
                          border: OutlineInputBorder(),
                        ),
                        items: ['Cardiology', 'Dermatology']
                            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Doctor"),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          labelText: 'Doctor',
                          border: OutlineInputBorder(),
                        ),
                        items: ['Dr. Smith', 'Dr. Jane']
                            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Date: 06.12.25",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appointment = appointments[index];
                return InkWell(
                  onTap: () {
                    Get.to(HospitalViewAapointDetails());
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          appointment['slNo']!,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      title: Text(
                        'Patient: ${appointment['patient']} (${appointment['appointType']})',
                        style: const TextStyle(fontSize: 12),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Doctor: ${appointment['doctor']}',
                            style: const TextStyle(fontSize: 12),
                          ),
                          Text(
                            'Department/Category: ${appointment['department']}',
                            style: const TextStyle(fontSize: 12),
                          ),
                          Text(
                            'Visit Date: ${appointment['visitDate']}',
                            style: const TextStyle(fontSize: 12),
                          ),
                          Text(
                            "Appoint No. : ${appointment['slNo']!}",
                            style: const TextStyle(fontSize: 12),
                          ),
                          Text(
                            "Appoint Type: ${appointment['appointType']}",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Handle button press for appointment status
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  '${appointment['status']} button pressed for ${appointment['patient']}'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              _getStatusColor(appointment['status']!),
                        ),
                        child: Text(
                          appointment['status']!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Pending':
        return Colors.orange;
      case 'Accepted':
        return Colors.green;
      case 'Cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
