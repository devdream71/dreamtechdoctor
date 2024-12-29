import 'package:flutter/material.dart';

class HospitalDetails extends StatelessWidget {
  const HospitalDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Image and Navigation
          Stack(
            children: [
              Container(
                height: 280,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/hospital_in_bangladesh.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Positioned(
                top: 40,
                left: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: BackButton(),
                ),
              ),
                Positioned(
                top: 40,
                right: 10,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
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
                        child: Icon(Icons.share, color: Colors.black)),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      backgroundColor: Colors.white,
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
                        child: Icon(Icons.favorite_border, color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Clinic Name and Rating
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bashundhara Ad-din',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Dental, Skin Care, Eye Care',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.star, color: Colors.white, size: 16),
                      SizedBox(width: 5),
                      Text(
                        '4.8 (1k+ Review)',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Address and Timings
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Icon(Icons.location_on, color: Colors.blue),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    '8502 Preston Rd, Inglewood, Maine 98380',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Icon(Icons.access_time, color: Colors.blue),
                SizedBox(width: 5),
                Text('15 min, 1.5km, Mon-Sun | 11 am - 11 pm'),
              ],
            ),
          ),
          const SizedBox(height: 15),

          // Action Buttons
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ActionButton(icon: Icons.public, label: 'Website'),
              ActionButton(icon: Icons.message, label: 'Message'),
              ActionButton(icon: Icons.call, label: 'Call'),
              ActionButton(icon: Icons.map, label: 'Direction'),
              ActionButton(icon: Icons.share, label: 'Share'),
            ],
          ),
          const SizedBox(height: 15),

          // Tab Section
          DefaultTabController(
            length: 4,
            child: Column(
              children: [
                const TabBar(
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.blue,
                  tabs: [
                    Tab(text: 'Treatments'),
                    Tab(text: 'Specialist'),
                    Tab(text: 'Gallery'),
                    Tab(text: 'Review'),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Treatments',
                      border: OutlineInputBorder(),
                    ),
                    items: ['Dental', 'Skin Care', 'Eye Care']
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),

          // Book Appointment Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
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
                'Book Appointment',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const ActionButton({required this.icon, required this.label, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue.withOpacity(0.1),
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
            child: Icon(icon, color: Colors.blue)),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}