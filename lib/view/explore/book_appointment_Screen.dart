import 'package:dream_tech_doctor/utils/colors.dart';
import 'package:dream_tech_doctor/utils/images.dart';
import 'package:dream_tech_doctor/view/explore/package_screen.dart';
import 'package:flutter/material.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  BookAppointmentScreenState createState() => BookAppointmentScreenState();
}

class BookAppointmentScreenState extends State<BookAppointmentScreen> {
  int selectedDayIndex = 0;
  int selectedTimeIndex = 0;

  final List<String> days = [
    "Today\n4 Oct",
    "Mon\n5 Oct",
    "Tue\n6 Oct",
    "Wed\n7 Oct"
  ];
  final List<String> timeSlots = ["7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: const Text(
          'Book Appointment',
          style: TextStyle(color: Colors.white, fontSize: 20),
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
            // Doctor Info Section
            const Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(AppImages.doctor2),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Robert Fox',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('Dentist', style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_pin, color: Colors.blue, size: 18),
                        Text('New York, United States'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Stats
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatCard(label: '7500+', sublabel: 'Patients'),
                _StatCard(label: '10+', sublabel: 'Years Exp.'),
                _StatCard(label: '4.9+', sublabel: 'Rating'),
                _StatCard(label: '4,956', sublabel: 'Review'),
              ],
            ),
            const SizedBox(height: 20),

            const Text("Day",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 10),

            // Day Selector
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDayIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: selectedDayIndex == index
                            ? Colors.blue
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Text(
                        days[index],
                        style: TextStyle(
                          color: selectedDayIndex == index
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            const Text("Time",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 10),

            // Time Selector
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: timeSlots.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTimeIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: selectedTimeIndex == index
                            ? Colors.blue
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Center(
                        child: Text(
                          timeSlots[index],
                          style: TextStyle(
                            color: selectedTimeIndex == index
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Request Custom Schedule
            // GestureDetector(
            //   onTap: () {
            //     // Handle custom schedule logic
            //   },
            //   child: Container(
            //     padding: const EdgeInsets.symmetric(vertical: 12),
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(8),
            //       color: Colors.grey.shade100,
            //     ),
            //     child: const Center(
            //       child: Text(
            //         "Request Schedule",
            //         style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //   ),
            // ),
            const Spacer(),

            // Make Appointment Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SelectPackageScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Make Appointment',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String sublabel;

  const _StatCard({required this.label, required this.sublabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        Text(
          sublabel,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
