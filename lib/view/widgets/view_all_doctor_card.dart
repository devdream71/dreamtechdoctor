import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String imageUrl;
  final String doctorName;
  final String specialty;
  final double rating;
  final int reviewers;
  final VoidCallback onAppointmentTap;

  const DoctorCard({
    super.key,
    required this.imageUrl,
    required this.doctorName,
    required this.specialty,
    required this.rating,
    required this.reviewers,
    required this.onAppointmentTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imageUrl,
                  height: 80,
                  width: 80,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 12),
              // Doctor Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.verified, color: Colors.blue, size: 18),
                        SizedBox(width: 4),
                        Text(
                          "Proffesional Doctor",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      doctorName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      specialty,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Rating Row
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "| $reviewers Reviewers",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Heart Icon (Favorite)
              InkWell(
                onTap: (){
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
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Appointment Button
          GestureDetector(
            onTap: onAppointmentTap,
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: InkWell(
                onTap: (){
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
                  "Make Appointment",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
