import 'package:dream_tech_doctor/view/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';

class HospitalSearchDoctor extends StatefulWidget {
  const HospitalSearchDoctor({super.key});

  @override
  State<HospitalSearchDoctor> createState() => _HospitalSearchDoctorState();
}

class _HospitalSearchDoctorState extends State<HospitalSearchDoctor> {
  final List<String> _DivisionOptions = [
    "Data 1",
    "Data 2",
    "Data 3",
  ];

  String? _selectedDivision;

  final List<String> _symptomsOptions = [
    "symtom 1",
    "symtom 2",
    "symtom 3",
  ];

  // String? _selectedSymtom;

  List<String> _selectedSymptoms = [];

  final List<String> _specialistOptions = [
    "Specialist 1",
    "Specialist 2",
    "Specialist 3",
  ];

  // String? _selectedSpecialist;

  List<String> _selectedSpecialists = [];

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
            // CustomDropdown(
            //   labelText: "Symptoms",
            //   isRequired: true,
            //   items: _symptomsOptions,
            //   selectedItem: _selectedSymtom,
            //   onChanged: (value) {
            //     setState(() {
            //       _selectedSymtom = value;
            //     });
            //   },
            // ),
            const Text("Symptoms"),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Symptoms",
                border: OutlineInputBorder(),
              ),
              items: _symptomsOptions.map((String symptom) {
                return DropdownMenuItem<String>(
                  value: symptom,
                  child: Text(symptom),
                );
              }).toList(),
              onChanged: (String? selected) {
                if (selected != null && !_selectedSymptoms.contains(selected)) {
                  setState(() {
                    _selectedSymptoms.add(selected);
                  });
                }
              },
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: _selectedSymptoms.map((symptom) {
                return Chip(
                  label: Text(symptom),
                  deleteIcon: const CircleAvatar(child: Icon(Icons.close, color: Colors.red, size: 15,)),
                  onDeleted: () {
                    setState(() {
                      _selectedSymptoms.remove(symptom);
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            // CustomDropdown(
            //   labelText: "Specialist",
            //   isRequired: true,
            //   items: _specialistOptions,
            //   selectedItem: _selectedSpecialist,
            //   onChanged: (value) {
            //     setState(() {
            //       _selectedSpecialist = value;
            //     });
            //   },
            // ),
            const Text("Specialist"),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Specialist",
                border: OutlineInputBorder(),
              ),
              items: _specialistOptions.map((String specialist) {
                return DropdownMenuItem<String>(
                  value: specialist,
                  child: Text(specialist),
                );
              }).toList(),
              onChanged: (String? selected) {
                if (selected != null && !_selectedSpecialists.contains(selected)) {
                  setState(() {
                    _selectedSpecialists.add(selected);
                  });
                }
              },
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: _selectedSpecialists.map((specialist) {
                return Chip(
                  label: Text(specialist),
                  deleteIcon: const CircleAvatar(child: Icon(Icons.close, color: Colors.red, size: 15,)),
                  onDeleted: () {
                    setState(() {
                      _selectedSpecialists.remove(specialist);
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
                Expanded(
                  child: CustomDropdown(
                    labelText: "Experience",
                    isRequired: true,
                    items: _expOptions,
                    selectedItem: _selectedExp,
                    onChanged: (value) {
                      setState(() {
                        _selectedExp = value;
                      });
                    },
                  ),
                ),
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
            CustomDropdown(
              labelText: "Hospital",
              isRequired: true,
              items: _hospitalOptions,
              selectedItem: _selectedHospital,
              onChanged: (value) {
                setState(() {
                  _selectedHospital = value;
                });
              },
            ),
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
                   print("Selected Symptoms: $_selectedSymptoms");

                  
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



// import 'package:flutter/material.dart';

// class HospitalSearchDoctor extends StatefulWidget {
//   const HospitalSearchDoctor({super.key});

//   @override
//   State<HospitalSearchDoctor> createState() => _HospitalSearchDoctorState();
// }

// class _HospitalSearchDoctorState extends State<HospitalSearchDoctor> {
//   final List<String> _symptomsOptions = [
//     "Symptom 1",
//     "Symptom 2",
//     "Symptom 3",
//     "Symptom 4",
//   ];

//   // List to hold multiple selected symptoms
//   List<String> _selectedSymptoms = [];

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 16),
//             const Center(
//               child: Text(
//                 'Doctor',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),
//             ),
//             const SizedBox(height: 16),
//             // Multi-select dropdown for symptoms
            
//             const SizedBox(height: 16),
//             SizedBox(
//               width: double.infinity,
//               height: 48,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 onPressed: () {
//                   // Logic for handling selected symptoms
                 
//                 },
//                 child: const Text(
//                   'Doctor Search',
//                   style: TextStyle(color: Colors.white, fontSize: 16),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//           ],
//         ),
//       ),
//     );
//   }
// }
