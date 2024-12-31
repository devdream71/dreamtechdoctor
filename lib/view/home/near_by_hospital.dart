import 'package:dream_tech_doctor/view/home/hospital_details.dart';
import 'package:dream_tech_doctor/view/widgets/left_right_row.dart';
import 'package:flutter/material.dart';

class NearbyHospitalsScreen extends StatelessWidget {
  final List<Hospital> hospitals = [
    Hospital(
      name: 'Bashundhara Ad-din',
      time: '10 min',
      distance: '2.5km',
      rating: 4.5,
      imageUrl: 'assets/images/hopital2.jpg',
    ),
    Hospital(
      name: 'ElevateDental',
      time: '15 min',
      distance: '1.5km',
      rating: 4.8,
      imageUrl: 'assets/images/hospital1.jpg',
    ),
    
  ];

  NearbyHospitalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: RowLeftRightText(
              text1: 'Nearby Hospitals',
              //text2: 'View All',
              text2: '',
              onTap: () {},
            ),
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hospitals.length,
              itemBuilder: (context, index) {
                final hospital = hospitals[index];
                return HospitalCard(hospital: hospital);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Hospital {
  final String name;
  final String time;
  final String distance;
  final double rating;
  final String imageUrl;

  Hospital({
    required this.name,
    required this.time,
    required this.distance,
    required this.rating,
    required this.imageUrl,
  });
}

class HospitalCard extends StatelessWidget {
  final Hospital hospital;

  const HospitalCard({super.key, required this.hospital});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HospitalDetails()),
        );
      },
      child: Container(
        width: 270,
        //height: 50,
        margin: const EdgeInsets.only(left: 16, right: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.asset(
                    hospital.imageUrl,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                  Positioned(
                  top: 8,
                  right: 8,
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
                    child: const Icon(Icons.favorite_border, color: Colors.white)),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          hospital.rating.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hospital.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.access_time,
                          size: 14, color: Colors.blue),
                      const SizedBox(width: 4),
                      Text(
                        '${hospital.time}, ${hospital.distance}',
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(Icons.location_city, size: 14, color: Colors.blue),
                      SizedBox(width: 4),
                      Text(
                        '8502 Preston Rd, Inglewood, Maine 98380',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(Icons.calendar_month, size: 14, color: Colors.blue),
                      SizedBox(width: 4),
                      Text(
                        'Mon -  Sun || 9.00 AM - 12.00 AM',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
