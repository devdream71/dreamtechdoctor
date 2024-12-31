import 'package:dream_tech_doctor/utils/images.dart';
import 'package:dream_tech_doctor/view/booking/appointment_details.dart';
import 'package:dream_tech_doctor/view/booking/cancle_booking.dart';
import 'package:dream_tech_doctor/view/explore/book_appointment_Screen.dart';
import 'package:flutter/material.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  _MyBookingsScreenState createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  // Example list of doctor bookings with status
  final List<Map<String, dynamic>> bookings = [
    {
      "name": "Dr. Jane Cooper",
      "location": "G8502 Preston Rd. Inglewood",
      "bookingID": "#DR452SA54",
      "imagePath": AppImages.doctor,
      "status": "Upcoming",
    },
    {
      "name": "Dr. Robert Fox",
      "location": "G8502 Preston Rd. Inglewood",
      "bookingID": "#DR452SA54",
      "imagePath": AppImages.doctor2,
      "status": "Completed",
    },
    {
      "name": "Dr. Robert Fox",
      "location": "G8502 Preston Rd. Inglewood",
      "bookingID": "#DR452SA54",
      "imagePath": AppImages.doctor2,
      "status": "Completed",
    },
    {
      "name": "Dr. Robert Fox",
      "location": "G8502 Preston Rd. Inglewood",
      "bookingID": "#DR452SA54",
      "imagePath": AppImages.doctor2,
      "status": "Completed",
    },
    {
      "name": "Dr. Jacob Jones",
      "location": "G8502 Preston Rd. Inglewood",
      "bookingID": "#DR452SA54",
      "imagePath": AppImages.doctor,
      "status": "Cancelled",
    },
  ];

  // Manage the active tab
  String selectedTab = "Upcoming";
  

  @override
  Widget build(BuildContext context) {
    // Filter bookings based on the selected tab
    final filteredBookings =
        bookings.where((booking) => booking["status"] == selectedTab).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 8),
          // Tabs for Upcoming, Completed, Cancelled
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => setState(() => selectedTab = "Upcoming"),
                  child: TabItem(
                    title: "Upcoming",
                    isActive: selectedTab == "Upcoming",
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => selectedTab = "Completed"),
                  child: TabItem(
                    title: "Completed",
                    isActive: selectedTab == "Completed",
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => selectedTab = "Cancelled"),
                  child: TabItem(
                    title: "Cancelled",
                    isActive: selectedTab == "Cancelled",
                  ),
                ),
              ],
            ),
          ),
          const Divider(),

          // List of Bookings
          Expanded(
            child: filteredBookings.isEmpty
                ? Center(
                    child: Text(
                      "No $selectedTab Bookings",
                      style: const TextStyle(fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredBookings.length,
                    itemBuilder: (context, index) {
                      return BookingCard(
                        doctorName: filteredBookings[index]["name"]!,
                        location: filteredBookings[index]["location"]!,
                        bookingID: filteredBookings[index]["bookingID"]!,
                        imagePath: filteredBookings[index]["imagePath"]!,
                        showReminder: selectedTab == "Upcoming",
                        selected2Tab: selectedTab,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class BookingCard extends StatefulWidget {
  final String doctorName;
  final String location;
  final String bookingID;
  final String imagePath;
  final bool showReminder;
  final String selected2Tab;

  const BookingCard({
    super.key,
    required this.doctorName,
    required this.location,
    required this.bookingID,
    required this.imagePath,
    required this.showReminder,
    required this.selected2Tab,
  });

  @override
  BookingCardState createState() => BookingCardState();
}

class BookingCardState extends State<BookingCard> {
  bool remindMe = false; // State for the Switch

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AppointmentDetailsScreen(),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Aug 24, 2024 - 10.00 AM",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  if (widget.showReminder)
                    Row(
                      children: [
                        const Text(
                          "Remind me",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        Switch(
                          value: remindMe,
                          onChanged: (value) {
                            setState(() {
                              remindMe = value;
                            });
                          },
                        ),
                      ],
                    ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(widget.imagePath),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.doctorName,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.location_on),
                            const SizedBox(width: 2),
                            Text(widget.location),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.badge,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 2),
                            Text("Booking ID: ${widget.bookingID}",
                                style: const TextStyle(color: Colors.blue)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              // Conditional Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widget.showReminder
                    ? [
                        Expanded(
                          child: OutlinedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.red[50]),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CancelBookingScreen(),
                                ),
                              );
                            },
                            child: const Text('Cancel'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.blue),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const BookAppointmentScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Reschedule',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ]
                    : [
                        Expanded(
                          child: OutlinedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.green[50]),
                            ),
                            onPressed: () {
                              // Add functionality to add review
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
                            child: const Text('Add Review'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.blue),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const BookAppointmentScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Re-book',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ]
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget for tabs
class TabItem extends StatelessWidget {
  final String title;
  final bool isActive;

  const TabItem({super.key, required this.title, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: isActive ? Colors.blue : Colors.grey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        const SizedBox(height: 4),
        if (isActive)
          Container(
            height: 2,
            width: 60,
            color: Colors.blue,
          ),
      ],
    );
  }
}
