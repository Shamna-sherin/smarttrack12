import 'package:flutter/material.dart';
import 'package:smart_tracking/PARENTS/PGate.dart';
import 'package:smart_tracking/PARENTS/PNoti.dart';
import 'package:smart_tracking/PARENTS/Paccount.dart';
import 'package:smart_tracking/PARENTS/Phomepage.dart';
import 'package:smart_tracking/PARENTS/Ploginpage.dart';
import 'package:smart_tracking/PARENTS/Ptransportation.dart';
import 'package:smart_tracking/PARENTS/pprofile.dart';
import 'package:smart_tracking/student/FilterScreen.dart';
import 'package:smart_tracking/student/bottombar.dart';
import 'package:smart_tracking/student/dem.dart';
import 'package:smart_tracking/student/gate.dart';
import 'package:smart_tracking/student/homepage.dart';
import 'package:smart_tracking/student/lab.dart';
import 'package:smart_tracking/student/loginpage.dart';
import 'package:smart_tracking/student/saccount.dart';
import 'package:smart_tracking/student/snotification.dart';
import 'package:smart_tracking/student/text.dart';
import 'package:smart_tracking/student/transportation.dart';
import 'package:smart_tracking/teacher/THomepage.dart';
import 'package:smart_tracking/teacher/Taccount.dart';
import 'package:smart_tracking/teacher/Tloginpage.dart';
import 'package:smart_tracking/teacher/Tnoti.dart';
import 'package:smart_tracking/teacher/labattendance.dart';
import 'package:smart_tracking/teacher/tgate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
     
    home://loginpage(),
       //transportation(),
      //  HomeScreenPage(),
       //Account(),
      //TransportationScreen(),
      // LabScreen(),
       //GateScreen(),
      //LabAttendanceScreen(),
      //TGateScreen(),
      //Tloginpage(),
      //THomepage(),
      //Ploginpage(),
      //  PHomepage(),
      //PTransportation(),
      //PGateScreen(),
      //NotificationScreen(),
       //TAccount(),
      //TNotificationScreen(),
      //BottomNavBar(),
      //PAccount(),
      // PNotificationScreen(),
      TGateScreen(),
      
      

      

      
      debugShowCheckedModeBanner: false,
    );
  }
}

