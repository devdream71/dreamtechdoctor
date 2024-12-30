import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX if you're using it for navigation or snackbar

class LogoutExample extends StatelessWidget {
  // Add a named constructor with the key parameter
  const LogoutExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Logout'),
                content: const Text('Are you sure you want to log out?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      // Close the dialog
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Optional: Style the button
                    ),
                    onPressed: () {
                      // Perform logout action here
                      Navigator.of(context).pop(); // Close the dialog
                      Get.snackbar(
                        'Logged Out',
                        'You have successfully logged out!',
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );
                      // Navigate to login or perform other actions
                      // Get.offAll(LoginView());
                    },
                    child: const Text('Logout'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
