import 'package:dream_tech_doctor/view/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';

class SearchDoctor extends StatefulWidget {
  const SearchDoctor({super.key});

  @override
  State<SearchDoctor> createState() => _SearchDoctorState();
}

class _SearchDoctorState extends State<SearchDoctor> {
  final List<String> _DivisionOptions = [
    "Data 1",
    "Data 2",
    "Data 3",
  ];

  String? _selectedDivision;

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
            CustomDropdown(
              labelText: "Symptoms",
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
              labelText: "Specialist",
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
            Row(
              children: [
                Expanded(
                  child: CustomDropdown(
                    labelText: "Gender",
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
                const SizedBox(width: 8),
                Expanded(
                  child: CustomDropdown(
                    labelText: "Experience",
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
            Row(
              children: [
                Expanded(
                  child: CustomDropdown(
                    labelText: "Division",
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
              items: _DivisionOptions,
              selectedItem: _selectedDivision,
              onChanged: (value) {
                setState(() {
                  _selectedDivision = value;
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

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Feature Not Available"),
                        content: const Text(
                            "This feature is not available at the moment."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
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

