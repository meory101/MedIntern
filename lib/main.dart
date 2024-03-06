import 'package:flutter/material.dart';
import 'package:med_intern/pages/announcment.dart';
import 'package:med_intern/pages/assesments.dart';
import 'package:med_intern/pages/attendance.dart';
import 'package:med_intern/pages/bottom_app_bar.dart';
import 'package:med_intern/pages/course_content.dart';
import 'package:med_intern/pages/courses.dart';
import 'package:med_intern/pages/courses_details.dart';
import 'package:med_intern/pages/grades.dart';
import 'package:med_intern/pages/lessons.dart';
import 'package:med_intern/pages/more.dart';
import 'package:med_intern/pages/password_recovery.dart';
import 'package:med_intern/pages/record_attendance.dart';
import 'package:med_intern/pages/report.dart';
import 'package:med_intern/pages/reset_code.dart';
import 'package:med_intern/pages/reset_password.dart';
import 'package:med_intern/pages/login.dart';
import 'package:med_intern/pages/urgent_call.dart';
import 'package:med_intern/pages/view_attendance.dart';
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
      home:CustomBottomAppBar() ,
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
