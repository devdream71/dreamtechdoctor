import 'package:dream_tech_doctor/utils/colors.dart';
import 'package:flutter/material.dart';

class CancelBookingScreen extends StatefulWidget {
  const CancelBookingScreen({super.key});

  @override
  CancelBookingScreenState createState() => CancelBookingScreenState();
}

class CancelBookingScreenState extends State<CancelBookingScreen> {
  // Selected cancellation reason
  String selectedReason = "Schedule Change";

  // List of reasons
  final List<String> reasons = [
    "Schedule Change",
    "Weather conditions",
    "Unexpected Work",
    "Childcare Issue",
    "Travel Delays",
    "Other"
  ];

  // Custom reason controller
  TextEditingController customReasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cancel Booking", style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: AppColor.primaryColor.withOpacity(0.7),
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Please select the reason for cancellations:",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            const SizedBox(height: 8),
            // List of Radio buttons
            Expanded(
              child: ListView.builder(
                itemCount: reasons.length,
                itemBuilder: (context, index) {
                  return RadioListTile<String>(
                    title: Text(reasons[index]),
                    value: reasons[index],
                    groupValue: selectedReason,
                    onChanged: (value) {
                      setState(() {
                        selectedReason = value!;
                      });
                    },
                  );
                },
              ),
            ),
            // Custom reason input
            if (selectedReason == "Other") ...[
              const Text("Other", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              TextField(
                controller: customReasonController,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: "Enter your Reason",
                  
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
            ],
            // Cancel Appointment button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Handle cancel appointment logic here
                  String finalReason = selectedReason == "Other"
                      ? customReasonController.text
                      : selectedReason;
                  debugPrint("Cancellation Reason: $finalReason");
                  showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Feature Not Available"),
            content: const Text("This feature is not available at the moment."),
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
                  "Cancel Appointment",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
