import 'package:dream_tech_doctor/utils/images.dart';
import 'package:flutter/material.dart';

class UpcomingScheduleScreen extends StatelessWidget {
  const UpcomingScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      
       
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: ScheduleCard(
            doctorName: "Dr. Alana Rueter",
            consultationType: "Dentist Consultation",
            date: "Monday, 26 July",
            time: "09:00 - 10:00",
          ),
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String doctorName;
  final String consultationType;
  final String date;
  final String time;

  const ScheduleCard({
    Key? key,
    required this.doctorName,
    required this.consultationType,
    required this.date,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
               const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(AppImages.doctor), 
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    consultationType,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.5),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.phone, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue[700],
              borderRadius: BorderRadius.circular(12),
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, color: Colors.white70, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        date,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                    const VerticalDivider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                         Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.white70, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        time,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}