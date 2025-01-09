import 'package:dream_tech_doctor/view/hospital/hospital_search_doctor/controller_search.dart';
import 'package:dream_tech_doctor/view/hospital/hospital_search_doctor/search_model/model_search_specialist.dart';
import 'package:dream_tech_doctor/view/hospital/hospital_search_doctor/search_model/model_search_symptoms.dart';
import 'package:dream_tech_doctor/view/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HospitalSearchDoctor extends StatefulWidget {
  const HospitalSearchDoctor({super.key});

  @override
  State<HospitalSearchDoctor> createState() => _HospitalSearchDoctorState();
}

class _HospitalSearchDoctorState extends State<HospitalSearchDoctor> {
  final SearchNewController controller = Get.put(SearchNewController());
  List<String> _selectedSymptoms = [];

  List<String> _selectedSpecialists = [];

  List<String> _selectedDepartments = [];

  String? _selectedDepartment;

  final List<String> _DivisionOptions = [
    "Data 1",
    "Data 2",
    "Data 3",
  ];

  String? _selectedDivision;

  final List<String> _genderOptions = [
    "Male",
    "Female",
  ];

  String? _selectedGender;

  final List<String> _expOptions = [
    "0 to 1 Years Exp",
    "1 to 2 Years Exp",
    "2 to 3 Years Exp",
    "4 to 5 Years Exp",
    "5 Years above",
    "10 Years above",
    "15 Years above",
  ];

  String? _selectedExp;

  final List<String> _divisionOptions = [
    "Barisal ",
    "Chittagong",
    "Dhaka",
    "Khulna",
    "Mymensingh",
    "Rajshahi",
    "Sylhet",
    "Sylhet",
    "Rangpur",
  ];

  String? _selecteddivision;

  final List<String> _hospitalOptions = [
    "Hospital 1",
    "Hospital 2",
    "Hospital 3",
  ];

  String? _selectedHospital;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'Doctor',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),

            ////====>symptom
            const Text("Symptoms"),
            const SizedBox(
              height: 5,
            ),

            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.symptoms.isEmpty) {
                return const Center(
                  child: Text("No symptoms available."),
                );
              }

              return DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  //labelText: "Symptoms",
                  border: OutlineInputBorder(),
                ),
                items: controller.symptoms
                    .map((SearchSymptom symptom) => DropdownMenuItem<String>(
                          value: symptom.symptom,
                          child: Text(symptom.symptom),
                        ))
                    .toList(),
                onChanged: (String? selected) {
                  if (selected != null &&
                      !_selectedSymptoms.contains(selected)) {
                    setState(() {
                      _selectedSymptoms.add(selected);
                    });
                  }
                },
              );
            }),

            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: _selectedSymptoms.map((symptom) {
                return Chip(
                  label: Text(symptom),
                  deleteIcon: const CircleAvatar(
                      child: Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 15,
                  )),
                  onDeleted: () {
                    setState(() {
                      _selectedSymptoms.remove(symptom);
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 8),

            ////=====>specialist
            const Text("Specialist"),
            const SizedBox(
              height: 5,
            ),

            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: SizedBox());
              }

              if (controller.specialists.isEmpty) {
                return const Center(
                  child: Text("No specialists available."),
                );
              }

              return DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  //labelText: "Specialist",
                  border: OutlineInputBorder(),
                ),
                items: controller.specialists
                    .map((SearchSpecialist specialist) =>
                        DropdownMenuItem<String>(
                          value: specialist.specialist,
                          child: Text(specialist.specialist),
                        ))
                    .toList(),
                onChanged: (String? selected) {
                  if (selected != null &&
                      !_selectedSpecialists.contains(selected)) {
                    setState(() {
                      _selectedSpecialists.add(selected);
                    });
                  }
                },
              );
            }),

            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: _selectedSpecialists.map((specialist) {
                return Chip(
                  label: Text(specialist),
                  deleteIcon: const CircleAvatar(
                      child: Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 15,
                  )),
                  onDeleted: () {
                    setState(() {
                      _selectedSpecialists.remove(specialist);
                    });
                  },
                );
              }).toList(),
            ),

            const SizedBox(
              height: 5,
            ),

            /////=====>department
            ///
            const Text("Departments"),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: SizedBox());
              }

              if (controller.departments.isEmpty) {
                return const Center(
                  child: Text("No departments available."),
                );
              }

              return DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  //labelText: "Department",
                  border: OutlineInputBorder(),
                ),
                items: controller.departments
                    .map((department) => DropdownMenuItem<String>(
                          value: department.departmentCategory,
                          child: Text(department.departmentCategory),
                        ))
                    .toList(),
                onChanged: (String? selected) {
                  setState(() {
                    _selectedDepartment = selected;
                  });
                },
                value: _selectedDepartment,
              );
            }),

            const SizedBox(height: 8),

            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: _selectedDepartments.map((department) {
                return Chip(
                  label: Text(department),
                  deleteIcon: const CircleAvatar(
                      child: Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 15,
                  )),
                  onDeleted: () {
                    setState(() {
                      _selectedDepartments.remove(department);
                    });
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 8),
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
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: CustomDropdown(
                    labelText: "Division",
                    isRequired: true,
                    items: _divisionOptions,
                    selectedItem: _selecteddivision,
                    onChanged: (value) {
                      setState(() {
                        _selecteddivision = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomDropdown(
                    labelText: "District",
                    isRequired: true,
                    items: _DivisionOptions,
                    selectedItem: _selectedDivision,
                    onChanged: (value) {
                      setState(() {
                        _selectedDivision = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            CustomDropdown(
              labelText: "Upazila",
              isRequired: true,
              items: _DivisionOptions,
              selectedItem: _selectedDivision,
              onChanged: (value) {
                setState(() {
                  _selectedDivision = value;
                });
              },
            ),
            const SizedBox(height: 8),

            const Text("Hospitals"),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: SizedBox());
              }

              if (controller.hospitalData.value.hospitalNames.isEmpty) {
                return const Center(
                  child: Text("No hospitals available."),
                );
              }

              return DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  border: OutlineInputBorder(),
                ),
                items: controller.hospitalData.value.hospitalNames
                    .map((hospital) => DropdownMenuItem<String>(
                          value: hospital,
                          child: Text(hospital),
                        ))
                    .toList(),
                onChanged: (String? selected) {
                  setState(() {
                    _selectedHospital = selected;
                  });
                },
                value: _selectedHospital,
              );
            }),

            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Add your search logic here
                  Navigator.pop(context);
                  debugPrint("Selected Symptoms: $_selectedSymptoms");
                },
                child: const Text(
                  'Doctor Search',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
