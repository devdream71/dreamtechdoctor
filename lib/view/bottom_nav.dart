import 'package:dream_tech_doctor/utils/colors.dart';
import 'package:dream_tech_doctor/view/auth/signup.dart';
import 'package:dream_tech_doctor/view/booking/booking.dart';
import 'package:dream_tech_doctor/view/explore/explore.dart';
import 'package:dream_tech_doctor/view/home/home.dart';
import 'package:dream_tech_doctor/view/profile/prodile.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  BottomNavState createState() => BottomNavState();
}

class BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  // Screens for each tab
  static final List<Widget> _pages = <Widget>[
    const Home(),
    const Explore(),
    MyBookingsScreen(),
    //Center(child: Text('home 3')),
    Center(child: Text('home 4')),
    //CreateAccountPage(),
    const Profile()
  ];

  // Titles for each tab
  static const List<String?> _titles = <String?>[
    'Home',
    "Explore",
    'Doctor Booking',
    'Chat',
    'Profile',
  ];

  // Function to handle tab selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titles[_selectedIndex] != null
          ? AppBar(
              title: Text(
                _titles[_selectedIndex]!,
                style: const TextStyle(color: Colors.white),
              ),
              // title: Text(
              //   "Find Your Doctor",
              //   style: TextStyle(color: AppColor.doctorDTBody),
              // ),
              backgroundColor: AppColor.primaryColor.withOpacity(0.7),
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white10,
                    child: Icon(
                      Icons.notifications,
                      color: AppColor.primaryColor,
                    ),
                  ),
                )
              ],
            )
          : null,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_rounded),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}