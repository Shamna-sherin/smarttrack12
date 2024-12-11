import 'package:flutter/material.dart';
import 'package:smart_tracking/student/gate.dart';
import 'package:smart_tracking/student/lab.dart';
import 'package:smart_tracking/student/transportation.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: const Color.fromARGB(255, 151, 199, 237),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // AppBar background
            Container(
              height: 80, // Height of the AppBar background
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            // Body Content
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 120), // Leave space for the profile section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50),
                      // Carousel/Banner Section
                      Card(
                        elevation: 4,
                        child: ListTile(
                          trailing: Icon(Icons.location_on),
                          title: Text('Location'),
                          leading: CircleAvatar(),
                        ),
                      ),
                      SizedBox(height: 16),
                      // Student Details Section

                      // Attendance Section
                      Text(
                        "Today's Attendance",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: List.generate(6, (index) {
                                  return CircleAvatar(
                                    radius: 20,
                                    child: Text("${index + 1} hr"),
                                  );
                                }),
                              ),
                            ),
                            CircleAvatar(),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),

                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Student Details',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(
                              title: 'Transportation',
                              color: Colors.pink,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TransportationScreen(),
                                  ),
                                );
                              },
                            ),
                            CustomButton(
                              title: 'GATE',
                              color: Colors.pink,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GateScreen(),
                                  ),
                                );
                              },
                            ),
                            CustomButton(
                              title: 'LAB',
                              color: Colors.pink,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LabScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Profile Section
            Positioned(
              top: 15, // Adjust the vertical position of the card
              left: 16,
              right: 16,
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150', // Replace with the actual image URL
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "FATHIMA NIDHA P",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "BSc Computer Science - 2022-25",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Register No: UTAWCS026",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Admission No: 8962",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
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

class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final onPressed;

  CustomButton({required this.title, required this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
