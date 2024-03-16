import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/Admin_pages/Admin_bottom_appbar.dart';
import 'package:med_intern/Admin_pages/editaccount.dart';
import 'package:med_intern/Admin_pages/mangeschedual.dart';
import 'package:med_intern/Admin_pages/rotation.dart';
import 'package:med_intern/supervisor_pages/Assignment.dart';
import 'package:med_intern/supervisor_pages/addAssignmemt.dart';
import 'package:med_intern/supervisor_pages/announcment.dart';
import 'package:med_intern/supervisor_pages/course_content.dart';
import 'package:med_intern/supervisor_pages/course_material.dart';
import 'package:med_intern/supervisor_pages/create_announcment.dart';
import 'package:med_intern/supervisor_pages/internAttendance.dart';
import 'package:med_intern/supervisor_pages/interntGrades.dart';
import 'package:med_intern/supervisor_pages/nexturgentcall.dart';
import 'package:med_intern/supervisor_pages/supervisor_bottom_appbar.dart';
import 'package:med_intern/supervisor_pages/tryagain.dart';
import 'package:med_intern/theme/colors.dart';
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
import 'package:med_intern/auth_pages/password_recovery.dart';
import 'package:med_intern/user_pages/record_attendance.dart';
import 'package:med_intern/user_pages/report.dart';
import 'package:med_intern/auth_pages/reset_code.dart';
import 'package:med_intern/auth_pages/reset_password.dart';
import 'package:med_intern/user_pages/urgent_call.dart';
import 'package:med_intern/user_pages/view_attendance.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //authentication
      // home:LogIn(),

      //user
      // home: CustomBottomAppBar(),

      //admin
      home: Adminbottomappbar(),

      //supervisor
      // home: SupervisorBottomAppBar(),
      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: maincolor),
      ),
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
        'rotation': (context) => Rotation(),
        'editaccount': (context) => EditAccount(),
        'superannounc': (context) => SupAnnouncments(),
        'createannouncment': (context) => CreateAnnouncment(),
        'supcoursecontent': (context) => SupCourseContent(),
        'coursematerial': (context) => CourseMaterial(),
        'Assignment': (context) => Assignment(),
        'addAssignment': (context) => addAssignment(),
        'Attendance': (context) => internAttendance(),
        'grade': (context) => interngrades(),
        'sendcall': (context) => sendcall(),
        'tryagain': (context) => tryagain(),
        'Manage Scheduale': (context) => Mangeschedual(),
      },
    );
  }
}
