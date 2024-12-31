import 'package:dream_tech_doctor/utils/images.dart';
import 'package:dream_tech_doctor/view/widgets/view_all_doctor_card.dart';
import 'package:flutter/material.dart';
import 'doctor_details_page.dart';
import 'search_doctor.dart'; // Import the SearchDoctor page

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  // All doctor data
  final List<Map<String, dynamic>> doctors = [
    {
      "imageUrl": AppImages.doctor,
      "doctorName": "Dr. Jane Cooper",
      "specialty": "Dentist",
      "rating": 4.8,
      "reviewers": 49
    },
    {
      "imageUrl": AppImages.doctor2,
      "doctorName": "Dr. Robert Fox",
      "specialty": "Cardiologist",
      "rating": 4.9,
      "reviewers": 54
    },
    // Add more doctor entries here...
  ];

  // Selected Tab
  String selectedTab = "All";

  // Filtered Doctors
  List<Map<String, dynamic>> get filteredDoctors {
    if (selectedTab == "All") return doctors;
    return doctors
        .where((doctor) => doctor['specialty']
            .toString()
            .toLowerCase()
            .contains(selectedTab.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7, // Total tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Explore"),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Navigate to the SearchDoctor page
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const SearchDoctor()),
                // );
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  builder: (context) => const SearchDoctor(),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            // Tab Bar
            TabBar(
              isScrollable: true,
              labelColor: Colors.blueAccent,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blueAccent,
              onTap: (index) {
                setState(() {
                  selectedTab = [
                    "All",
                    "Dentist",
                    "Cardiologist",
                    "Heart",
                    "Eye",
                    "Neurologist",
                    "Orthopaedist"
                  ][index];
                });
              },
              tabs: const [
                Tab(text: "All"),
                Tab(text: "Dentist"),
                Tab(text: "Cardiologist"),
                Tab(text: "Heart"),
                Tab(text: "Eye"),
                Tab(text: "Neurologist"),
                Tab(text: "Orthopaedist"),
              ],
            ),
            const SizedBox(height: 10),
            // Doctor List
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: filteredDoctors.map((doctor) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DoctorDetailsPage()),
                          );
                        },
                        child: DoctorCard(
                          imageUrl: doctor['imageUrl'],
                          doctorName: doctor['doctorName'],
                          specialty: doctor['specialty'],
                          rating: doctor['rating'],
                          reviewers: doctor['reviewers'],
                          onAppointmentTap: () {
                            debugPrint(
                                "Appointment made with ${doctor['doctorName']}");
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





// import 'package:dream_tech_doctor/utils/images.dart';
// import 'package:dream_tech_doctor/view/widgets/view_all_doctor_card.dart';
// import 'package:flutter/material.dart';
// import 'doctor_details_page.dart';

// class Explore extends StatefulWidget {
//   const Explore({super.key});

//   @override
//   State<Explore> createState() => _ExploreState();
// }

// class _ExploreState extends State<Explore> {
//   // All doctor data
//   final List<Map<String, dynamic>> doctors = [
//     {
//       "imageUrl": AppImages.doctor,
//       "doctorName": "Dr. Jane Cooper",
//       "specialty": "Dentist",
//       "rating": 4.8,
//       "reviewers": 49
//     },
//     {
//       "imageUrl": AppImages.doctor2,
//       "doctorName": "Dr. Robert Fox",
//       "specialty": "Cardiologist",
//       "rating": 4.9,
//       "reviewers": 54
//     },
//     {
//       "imageUrl": AppImages.doctor3,
//       "doctorName": "Dr. Jacob Jones",
//       "specialty": "Heart Specialist",
//       "rating": 4.7,
//       "reviewers": 33
//     },
//     {
//       "imageUrl": AppImages.doctor4,
//       "doctorName": "Dr. Carla Schoen",
//       "specialty": "Scan Specialist",
//       "rating": 4.6,
//       "reviewers": 21
//     },
//     {
//       "imageUrl": AppImages.doctor4,
//       "doctorName": "Dr. Carla Schoen",
//       "specialty": "Orthopaedist",
//       "rating": 4.6,
//       "reviewers": 21
//     },
//     {
//       "imageUrl": AppImages.doctor4,
//       "doctorName": "Dr. Carla Schoen",
//       "specialty": "Scan Specialist",
//       "rating": 4.6,
//       "reviewers": 21
//     },
//     {
//       "imageUrl": AppImages.doctor4,
//       "doctorName": "Dr. Carla Schoen",
//       "specialty": "Neurologist",
//       "rating": 4.6,
//       "reviewers": 21
//     },
//     {
//       "imageUrl": AppImages.doctor4,
//       "doctorName": "Dr. Carla Schoen",
//       "specialty": "Eye",
//       "rating": 4.6,
//       "reviewers": 21
//     },
//   ];

//   // Selected Tab
//   String selectedTab = "All";

//   // Filtered Doctors
//   List<Map<String, dynamic>> get filteredDoctors {
//     if (selectedTab == "All") return doctors;
//     return doctors
//         .where((doctor) => doctor['specialty']
//             .toString()
//             .toLowerCase()
//             .contains(selectedTab.toLowerCase()))
//         .toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 7, // Total tabs
//       child: Scaffold(
//         //backgroundColor: Colors.white,
//         body: Column(
//           children: [
//             const SizedBox(height: 20),
//             // Tab Bar
//             TabBar(
//               isScrollable: true,
//               labelColor: Colors.blueAccent,
//               unselectedLabelColor: Colors.grey,
//               indicatorColor: Colors.blueAccent,
//               onTap: (index) {
//                 setState(() {
//                   selectedTab =
//                       ["All", "Dentist", "Cardiologist", "Heart", "Eye", "Neurologist", "Orthopaedist" ][index];
//                 });
//               },
//               tabs: const [
//                 Tab(text: "All"),
//                 Tab(text: "Dentist"),
//                 Tab(text: "Cardiologist"),
//                 Tab(text: "Heart"),
//                 Tab(text: "Eye"),
//                 Tab(text: "Neurologist"),
//                 Tab(text: "Orthopaedist"),

//               ],
//             ),
//             const SizedBox(height: 10),
//             // Doctor List
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: filteredDoctors.map((doctor) {
//                       return InkWell(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     const DoctorDetailsPage()),
//                           );
//                         },
//                         child: DoctorCard(
//                           imageUrl: doctor['imageUrl'],
//                           doctorName: doctor['doctorName'],
//                           specialty: doctor['specialty'],
//                           rating: doctor['rating'],
//                           reviewers: doctor['reviewers'],
//                           onAppointmentTap: () {
//                             print(
//                                 "Appointment made with ${doctor['doctorName']}");
//                           },
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
