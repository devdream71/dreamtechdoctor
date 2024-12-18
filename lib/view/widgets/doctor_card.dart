import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String qualifications;
  final String specialization;
  final String proposerInfo;
  final String registrationNumber;
  final void Function() onTapDoctorView;
  final void Function() onTapAppointment;

  const DoctorCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.qualifications,
    required this.specialization,
    required this.proposerInfo,
    required this.registrationNumber,
    required this.onTapDoctorView,
    required this.onTapAppointment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row for image and doctor details
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
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
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      qualifications,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Specialist and Registration Info
          Text(
            specialization,
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          ),
          const SizedBox(height: 8),
          Text(
            proposerInfo,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 8),
          Text(
            "Reg.No $registrationNumber",
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildButton("Doctor View", Colors.blueAccent, onTapDoctorView  ),
              _buildButton("Appointment", Colors.green, onTapAppointment ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method for buttons
  Widget _buildButton(String title, Color color, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
