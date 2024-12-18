import 'package:dream_tech_doctor/utils/colors.dart';
import 'package:flutter/material.dart';

class PatientDetailsScreen extends StatefulWidget {
  @override
  State<PatientDetailsScreen> createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
  String bookingFor = "Self";
  String gender = "Male";
  String age = "24 Years";

  final TextEditingController problemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        //backgroundColor: Colors.white,
         backgroundColor: AppColor.primaryColor.withOpacity(0.7),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        elevation: 0,
        leading: const   BackButton(color: Colors.white),
        //centerTitle: true,
        title: const Text(
          "Patient Details",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Booking for"),
            _buildDropdown(
              value: bookingFor,
              items: ["Self", "Family", "Other"],
              onChanged: (value) => setState(() => bookingFor = value!),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle("Gender"),
            _buildDropdown(
              value: gender,
              items: ["Male", "Female", "Other"],
              onChanged: (value) => setState(() => gender = value!),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle("Your Age"),
            _buildDropdown(
              value: age,
              items: ["18 Years", "24 Years", "30 Years", "40+ Years"],
              onChanged: (value) => setState(() => age = value!),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle("Write Your Problem"),
            _buildProblemTextField(),
            const SizedBox(height: 40),
             const Spacer(),
            _buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black54,
      ),
    );
  }

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        underline: SizedBox(),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildProblemTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: problemController,
        maxLines: 5,
        decoration: const InputDecoration(
          hintText: "Write here...",
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          print("Booking For: $bookingFor");
          print("Gender: $gender");
          print("Age: $age");
          print("Problem: ${problemController.text}");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          "Next",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}