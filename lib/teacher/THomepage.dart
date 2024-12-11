import 'package:flutter/material.dart';
import 'package:smart_tracking/PARENTS/PGate.dart';
import 'package:smart_tracking/PARENTS/PNoti.dart';
import 'package:smart_tracking/PARENTS/Ptransportation.dart';
import 'package:smart_tracking/PARENTS/PAccount.dart';
import 'package:smart_tracking/teacher/TAccount.dart';
import 'package:smart_tracking/teacher/TNoti.dart';
import 'package:smart_tracking/teacher/Tgate.dart';
import 'package:smart_tracking/teacher/labattendance.dart'; // Example account screen import

class THomepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<THomepage> {
  int _selectedIndex = 0; // Keeps track of the selected index

  // List of screens corresponding to the BottomNavigationBar items
  final List<Widget> _screens = [
    HomeScreen(),           // Home screen
    TNotificationScreen(),  // Notifications screen
    TAccount(),             // Account screen
  ];

  // Function to handle BottomNavigationBar item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF1C1C55), // Blue background color
      body: _screens[_selectedIndex], // Display screen based on selected index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            activeIcon: Icon(Icons.home, color: Color(0xFF1C1C55)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
            activeIcon: Icon(Icons.notifications, color: Color(0xFF1C1C55)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
            activeIcon: Icon(Icons.account_circle, color: Color(0xFF1C1C55)),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF1C1C55),
      body: SafeArea(
        child: Column(
          children: [
            // Teacher Profile Section
            Container(
              width: screenWidth,
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey.shade300,
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Teacher Name",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Department: Computer Science",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "ID: T12345",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Add a SizedBox with height equal to 7cm (264.565px) to move the student details down
            SizedBox(height: 50), // Space of 7cm

            // Student Details Section with white background and black text
            Container(
              width: screenWidth,
              height: 200,
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,  // White background color
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Student Details",
                      style: TextStyle(
                        color: Colors.black, // Black text color
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Lab Button (replacing Transportation)
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LabAttendanceScreen(), // Replace with the correct page for Lab
                            ),
                          );
                        },
                        child: Container(
                          height: 70,
                          width: 200,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xFF1C1C55),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Lab", //  "Lab"
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TGateScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 70,
                          width: 200,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xFF1C1C55),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Gate",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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