import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:med_intern/supervisor_pages/supervisor_bottom_appbar.dart';
import 'package:med_intern/user_pages/announcment.dart';
import 'package:med_intern/user_pages/assesments.dart';
import 'package:med_intern/user_pages/attendance.dart';
import 'package:med_intern/user_pages/bottom_app_bar.dart';
import 'package:med_intern/user_pages/course_content.dart';
import 'package:med_intern/user_pages/courses.dart';
import 'package:med_intern/user_pages/courses_details.dart';
import 'package:med_intern/user_pages/grades.dart';
import 'package:med_intern/user_pages/lessons.dart';
import 'package:med_intern/user_pages/more.dart';
import 'package:med_intern/user_pages/password_recovery.dart';
import 'package:med_intern/user_pages/record_attendance.dart';
import 'package:med_intern/user_pages/report.dart';
import 'package:med_intern/user_pages/reset_code.dart';
import 'package:med_intern/user_pages/reset_password.dart';
import 'package:med_intern/user_pages/login.dart';
import 'package:med_intern/user_pages/urgent_call.dart';
import 'package:med_intern/user_pages/view_attendance.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SupervisorBottomAppBar(),
      routes: {
        "resetpassword": (context) => Resetpassword(),
        "resetcode": (context) => ResetCode(),
        "PasswordRec": (context) => PasswordRec(),
        "bottomappbar": (context) => CustomBottomAppBar(),
        "courses": (context) => Courses(),
        "coursesdet": (context) => CourseDet(),
        "announcments": (context) => Announcments(),
        "courselessons": (context) => CourseLessons(),
        "assesments": (context) => Assesments(),
        "report": (context) => Report(),
        'grades': (context) => grades(),
        'coursecontent': (context) => course_content(),
        'attendance': (context) => Attendance(),
        'record_attendance': (context) => RecordAttendace(),
        'view_attendance': (context) => ViewAttendance(),
        'urgent_calls': (context) => UrgentCalls(),
        'more': (context) => More(),
      },
    );
  }
}
