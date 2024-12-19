import 'package:dream_tech_doctor/utils/colors.dart';
import 'package:dream_tech_doctor/view/profile/prodile.dart';
import 'package:flutter/material.dart';

class HospitalBottomNav extends StatefulWidget {
  const HospitalBottomNav({super.key});

  @override
  HospitalBottomNavState createState() => HospitalBottomNavState();
}

class HospitalBottomNavState extends State<HospitalBottomNav> {
  int _selectedIndex = 0;

  // Screens for each tab
  static final List<Widget> _pages = <Widget>[
     
    Center(child: Text('home 1')),
    Center(child: Text('home 2')),
    Center(child: Text('home 3')),
    Center(child: Text('home 4')),
    Center(child: Text('home 5')),
    const Profile()
  ];

  // Titles for each tab
  static const List<String?> _titles = <String?>[
    'Enam Medical College Hospital',
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
            label: 'Home1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_rounded),
            label: 'Home2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range),
            label: 'Home3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Home4',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Home5',
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
