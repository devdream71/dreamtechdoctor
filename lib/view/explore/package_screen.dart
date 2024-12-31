import 'package:dream_tech_doctor/utils/colors.dart';
import 'package:dream_tech_doctor/view/explore/patient_details_screen.dart';
import 'package:flutter/material.dart';

class SelectPackageScreen extends StatefulWidget {
  const SelectPackageScreen({super.key});

  @override
  State<SelectPackageScreen> createState() => _SelectPackageScreenState();
}

class _SelectPackageScreenState extends State<SelectPackageScreen> {
  String selectedDuration = "15 minute";
  String selectedPackage = "Messaging";

  // Package data
  final List<Map<String, dynamic>> packages = [
    {"name": "Messaging", "price": 20, "description": "Chat with Doctor"},
    {
      "name": "Voice Call",
      "price": 40,
      "description": "Voice call with doctor"
    },
    {
      "name": "Video Call",
      "price": 60,
      "description": "Video call with doctor"
    },
    {
      "name": "In Person",
      "price": 100,
      "description": "In Person visit with doctor"
    },
  ];

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
        title: const Text(
          "Select Package",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        leading: const BackButton(color: Colors.white),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          // Duration Dropdown
          _buildSectionTitle("Select Duration"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black12),
              ),
              child: DropdownButton<String>(
                value: selectedDuration,
                isExpanded: true,
                underline: const SizedBox(),
                items: ["15 minute", "30 minute", "1 hour"].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedDuration = newValue!;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Package Selection
          _buildSectionTitle("Select Package"),
          Expanded(
            child: ListView.builder(
              itemCount: packages.length,
              itemBuilder: (context, index) {
                final package = packages[index];
                return _buildPackageOption(
                  package["name"],
                  package["price"],
                  package["description"],
                  selectedPackage == package["name"],
                );
              },
            ),
          ),
          // Next Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  debugPrint("Selected Package: $selectedPackage");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PatientDetailsScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black54,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildPackageOption(
      String name, int price, String description, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPackage = name;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade50 : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? Colors.blue : Colors.black12),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blue.shade100,
              child: Icon(
                name == "Messaging"
                    ? Icons.chat
                    : name == "Voice Call"
                        ? Icons.call
                        : name == "Video Call"
                            ? Icons.videocam
                            : Icons.person,
                color: Colors.blue.shade700,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
            Text(
              "৳ $price",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.blue : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
