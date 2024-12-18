import 'package:dream_tech_doctor/utils/images.dart';
import 'package:dream_tech_doctor/view/explore/book_appointment_Screen.dart';
import 'package:dream_tech_doctor/view/explore/doctor_details_page.dart';
import 'package:dream_tech_doctor/view/home/near_by_hospital.dart';
import 'package:dream_tech_doctor/view/home/upcoming_schedule_Screen.dart';
import 'package:dream_tech_doctor/view/widgets/auto_scroll_carousel.dart';
import 'package:dream_tech_doctor/view/widgets/doctor_card.dart';
import 'package:dream_tech_doctor/view/widgets/home_card.dart';
import 'package:dream_tech_doctor/view/widgets/left_right_row.dart';
import 'package:dream_tech_doctor/view/widgets/popup.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Static variable to track dialog status across app pages
  static bool _hasDialogShown = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showDialogOnce();
    });
  }

  void _showDialogOnce() {
    // Show dialog only if it hasn't been shown before
    if (_hasDialogShown) return;

    _hasDialogShown = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => PopUp(
        onClose: () {
          Navigator.of(context).pop();
        },
      ),
    );

    // Automatically close dialog after 8 seconds
    Future.delayed(const Duration(seconds: 8), () {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StatCard(
                    icon: Icons.local_hospital_outlined,
                    title: "Hospital",
                    value: "412",
                    color: Colors.pinkAccent,
                  ),
                  SizedBox(width: 20),
                  StatCard(
                    icon: Icons.vaccines,
                    title: "Doctor",
                    value: "4875",
                    color: Colors.pinkAccent,
                  ),
                  SizedBox(width: 20),
                  StatCard(
                    icon: Icons.favorite,
                    title: "Patient",
                    value: "12545",
                    color: Colors.pinkAccent,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: RowLeftRightText(
                  text1: 'Upcoming Schedule',
                  text2: 'View All',
                  onTap: () {},
                ),
              ),
              const UpcomingScheduleScreen(),
              const SizedBox(height: 8),
              NearbyHospitalsScreen(),
              const SizedBox(height: 8),
              const AutoScrollCarousel(),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: RowLeftRightText(
                  text1: 'Top Specialist',
                  text2: 'View All',
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: DoctorCard(
                  imageUrl: AppImages.doctor2,
                  name: 'Dr. Md. Shakib',
                  qualifications:
                      'MBBS DMU FCPS MS\nWHO Clinical Polw On Child Urologist(India)\nPolw On Child Urologist (USA)',
                  specialization:
                      'Specialist\nChild, BabyCare, Urologists, Medicine\nHfdngf, Reseat',
                  proposerInfo:
                      'Proposer\nDepartment of Child Surgery\nSohid Sorowardy Medical College\n01984-994406',
                  registrationNumber: '2132134',
                  onTapAppointment: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BookAppointmentScreen()));
                  },
                  onTapDoctorView: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DoctorDetailsPage()));
                  },
                ),
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: DoctorCard(
                  imageUrl: AppImages.doctor3,
                  name: 'Dr. Sarah Connor',
                  qualifications:
                      'MBBS MS DMU\nSpecialized in Pediatric Urology\nHarvard Medical School',
                  specialization:
                      'Specialist\nPediatric Urology, Surgery, Child Care',
                  proposerInfo:
                      'Proposer\nDepartment of Pediatric Surgery\nBoston Medical Center\n01234-567890',
                  registrationNumber: '987654',
                   onTapAppointment: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BookAppointmentScreen()));
                  },
                  onTapDoctorView: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DoctorDetailsPage()));
                  },
                ),
              ),
              const SizedBox(height: 6),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: DoctorCard(
                  imageUrl: AppImages.doctor4,
                  name: 'Dr. Sarah Connor',
                  qualifications:
                      'MBBS MS DMU\nSpecialized in Pediatric Urology\nHarvard Medical School',
                  specialization:
                      'Specialist\nPediatric Urology, Surgery, Child Care',
                  proposerInfo:
                      'Proposer\nDepartment of Pediatric Surgery\nBoston Medical Center\n01234-567890',
                  registrationNumber: '987654',
                   onTapAppointment: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BookAppointmentScreen()));
                  },
                  onTapDoctorView: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DoctorDetailsPage()));
                  },
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
