import 'package:flutter/material.dart';

class HospitalViewAapointDetails extends StatelessWidget {
  final List<Patient> patients = [
    Patient(
        serialNo: '01',
        name: 'Md. Jasim Uddin',
        mobile: '01778344090',
        gender: 'Male',
        age: 38,
        appoint: 'Nizam',
        visitTime: '1st',
        payment: 'Paid',
        amount: '500'),
  ];

  HospitalViewAapointDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointments Details View'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
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
                          color: Colors.blue, // Background color of the button
                          borderRadius:
                              BorderRadius.circular(8), // Rounded corners
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
                            color: Colors.white, // Text color
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
                          color: Colors.green, // Background color of the button
                          borderRadius:
                              BorderRadius.circular(8), // Rounded corners
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
                                color: Colors.white, // Text color
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ' Appoint',
                              style: TextStyle(
                                color: Colors.white, // Text color
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
                          color: Colors.blue, // Background color of the button
                          borderRadius:
                              BorderRadius.circular(8), // Rounded corners
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
                            color: Colors.white, // Text color
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Visit Date',
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    ' ',
                  ]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {},
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
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Department/Category',
                          border: OutlineInputBorder(),
                        ),
                        items: ['Cardiology', 'Dermatology']
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Doctor',
                          border: OutlineInputBorder(),
                        ),
                        items: ['Dr. Smith', 'Dr. Jane']
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (value) {},
                      ),
                    ),
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
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Appoint  ID: 56",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 300,
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text(
                    "Patient",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              buildTextRow(data1: "Name :", data2: "Md. Shakil AL Hasan"),
              buildTextRow(data1: "Phone :", data2: "01788 693214"),
              buildTextRow(data1: "Gender :", data2: "Male"),
              buildTextRow(data1: "Age :", data2: "38"),
              buildTextRow(data1: "Marital Status :", data2: "Married0"),
              buildTextRow(data1: "Blood Group :", data2: "0+"),
              buildTextRow(data1: "Height :", data2: "5.4"),
              buildTextRow(data1: "Weight :", data2: "70 KG"),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 300,
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text(
                    "Appoint details",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              buildTextRow(data1: "Appoint by :", data2: "Md. Shakil"),
              buildTextRow(data1: "Visit Time :", data2: "First Time"),
              buildTextRow(data1: "Payment :", data2: "Unpaid"),
              buildTextRow(data1: "Payment Amount :", data2: "৳ 500"),
              buildTextRow(
                  data1: "Appoint Date :", data2: "Feb 21, 2025, 08.30 PM"),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 300,
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text(
                    "Appointment Doctor",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const Text(
                "Dr. Shakib al Hasan",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text("MBBS SMU FCPS MS"),
              const Text("WHO Clinical POlw on Child Urogist (India)"),
              const Text(
                'Specialist',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('Child Baby Care, Urologist Medicine'),
              const Text("Hfdhgd Reaset"),
              const Text(
                "Professior",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text("Department of Child Surgery"),
              const Text("Dhka Medical College"),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle tap event
                    },
                    child: Expanded(
                      child: Container(
                        
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.blue, // Background color of the button
                          borderRadius:
                              BorderRadius.circular(8), // Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Center(
                          child:  Text(
                            'Edit',
                            style: TextStyle(
                              color: Colors.white, // Text color
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 2,),
                  GestureDetector(
                    onTap: () {
                      // Handle tap event
                    },
                    child: Expanded(
                      child: Container(
                       
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.red, // Background color of the button
                          borderRadius:
                              BorderRadius.circular(8), // Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Center(
                          child:  Text(
                            'Appoint Decline',
                            style: TextStyle(
                              color: Colors.white, // Text color
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 2,),
                  GestureDetector(
                    onTap: () {
                      // Handle tap event
                    },
                    child: Expanded(
                      child: Container(
                       
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.green, // Background color of the button
                          borderRadius:
                              BorderRadius.circular(8), // Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Center(
                          child:  Text(
                            'Appoint Accept',
                            style: TextStyle(
                              color: Colors.white, // Text color
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextRow({required String data1, required String data2}) {
    return Row(
      children: [
        SizedBox(width: 120, child: Text(data1)),
        const SizedBox(
          width: 20,
        ),
        Text(data2),
      ],
    );
  }
}

class Patient {
  final String serialNo;
  final String name;
  final String mobile;
  final String gender;
  final int age;
  final String appoint;
  final String visitTime;
  final String payment;
  final String amount;

  Patient({
    required this.serialNo,
    required this.name,
    required this.mobile,
    required this.gender,
    required this.age,
    required this.appoint,
    required this.visitTime,
    required this.payment,
    required this.amount,
  });
}
