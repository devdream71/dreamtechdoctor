import 'package:dream_tech_doctor/utils/colors.dart';
import 'package:dream_tech_doctor/view/prescription/prescription_view.dart';
import 'package:dream_tech_doctor/view/widgets/custom_dropdown.dart';
import 'package:dream_tech_doctor/view/widgets/custom_form_textfield.dart';
import 'package:flutter/material.dart';

class PrescriptionForm extends StatefulWidget {
  const PrescriptionForm({super.key});

  @override
  PrescriptionFormState createState() => PrescriptionFormState();
}

class PrescriptionFormState extends State<PrescriptionForm> {
  // Controllers for basic details
  final TextEditingController doctorNameController = TextEditingController();
  final TextEditingController patientNameController = TextEditingController();
  final TextEditingController patientIdController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController adviceController = TextEditingController();
  final TextEditingController followUpDateController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  final List<String> _genderOptions = ["Male", "Female"];

  String? _selectedGender;

  // List to store medicines
  final List<Map<String, String>> medicines = [];

  // Controllers for medicine input
  final TextEditingController medicineNameController = TextEditingController();
  final TextEditingController dosageController = TextEditingController();
  final TextEditingController durationController = TextEditingController();

  void addMedicine() {
    if (medicineNameController.text.isNotEmpty &&
        dosageController.text.isNotEmpty &&
        durationController.text.isNotEmpty) {
      setState(() {
        medicines.add({
          'name': medicineNameController.text,
          'dosage': dosageController.text,
          'duration': durationController.text,
        });
        medicineNameController.clear();
        dosageController.clear();
        durationController.clear();
      });
    }
  }

  void removeMedicine(int index) {
    setState(() {
      medicines.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor.withOpacity(0.7),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Create Prescription',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doctor's Name
              CustomTextFormField(
                hintText: "Doctor's Name",
                labelText: "Doctor's Name",
                controller: doctorNameController,
              ),

              const SizedBox(height: 10),

              // Patient Name and ID

              CustomTextFormField(
                hintText: "Patient's Name",
                labelText: "Patient's Name",
                controller: patientNameController,
              ),
              const SizedBox(height: 10),

              CustomTextFormField(
                hintText: 'Patients ID',
                labelText: "Patients ID",
                controller: patientIdController,
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: CustomDropdown(
                      labelText: "Gender",
                      isRequired: true,
                      items: _genderOptions,
                      selectedItem: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CustomTextFormField(
                      labelText: 'Age',
                      isRequired: true,
                      hintText: '27',
                      controller: ageController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Age';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              // Address
              CustomTextFormField(
                hintText: "Address",
                labelText: "Patient Address",
                controller: addressController,
              ),
              const SizedBox(height: 20),

              // Medicines Table
              const Text(
                "Medicines",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Table(
                border: TableBorder.all(color: Colors.black),
                columnWidths: const {
                  0: FlexColumnWidth(3),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(2),
                  3: FlexColumnWidth(1),
                },
                children: [
                  // Table Header
                  const TableRow(
                    decoration: BoxDecoration(color: Colors.grey),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Medicine Name",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Dosage",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Duration",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Actions",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  // Dynamic Rows for Medicines
                  ...medicines.asMap().entries.map((entry) {
                    int index = entry.key;
                    Map<String, String> medicine = entry.value;
                    return TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(medicine['name']!),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(medicine['dosage']!),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(medicine['duration']!),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => removeMedicine(index),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ],
              ),
              const SizedBox(height: 10),

              // Add Medicine Form
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: medicineNameController,
                      decoration:
                          const InputDecoration(labelText: "Medicine Name"),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: dosageController,
                      decoration: const InputDecoration(labelText: "Dosage"),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: durationController,
                      decoration: const InputDecoration(labelText: "Duration"),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.green),
                    onPressed: addMedicine,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Advice
              CustomTextFormField(
                  controller: adviceController,
                  hintText: 'Advice',
                  labelText: 'Advice'),
              const SizedBox(height: 10),

              // Follow-Up Date
              TextFormField(
                controller: followUpDateController,
                decoration: const InputDecoration(labelText: "Follow-Up Date"),
              ),
              const CustomTextFormField(
                  hintText: 'Follow-up Date', labelText: "Follow-up Date"),
              const SizedBox(height: 20),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Submit Prescription Data

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const DoctorPrescriptionUI()));
                  },
                  child: const Text(
                    "Submit Prescription",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
