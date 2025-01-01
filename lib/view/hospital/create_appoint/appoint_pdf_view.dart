import 'package:dream_tech_doctor/utils/images.dart';
import 'package:dream_tech_doctor/view/hospital/create_appoint/widget/appoint_table.dart';
import 'package:flutter/material.dart';

class AppointPdfView extends StatelessWidget {
  const AppointPdfView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Appoint View"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ////header
              const Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(AppImages.hospital),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dhanmondi Diabatic Center",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text("H #42, R #12, Dhanmondi 32, Dhaka"),
                      Text("Phone: 01759 546800"),
                    ],
                  )
                ],
              ),
              /////apoint doctor
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
              const SizedBox(
                height: 8,
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
                    "Ref: Md. Roni Islam",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Symtom',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(
                height: 8,
              ),

              const TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),

              const AppointTable(),

              Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 300,
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                          child: Text(
                            "Download PDF",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 300,
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                          child: Text(
                            "Print",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(
                height: 8,
              )
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
