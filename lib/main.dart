import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/Admin_pages/Admin_bottom_appbar.dart';
import 'package:med_intern/Admin_pages/editaccount.dart';
import 'package:med_intern/Admin_pages/mangeschedual.dart';
import 'package:med_intern/Admin_pages/rotation.dart';
import 'package:med_intern/auth_pages/login.dart';
import 'package:med_intern/auth_pages/register%20(2).dart';
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
import 'package:med_intern/accept_account.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

extension IsEmail on String {
  CheckEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }
}

extension Password on String {
  bool IsPassword() {
    return this.length < 6;
  }
}
SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyA-phM3cvU3pbLRfMrsqavx3o9uck_g_nA",
        appId: "1:694621040839:android:9b9fb31ac36fc23f038ee2",
        messagingSenderId: "694621040839",
        projectId: "medi-deb3a"),
  );
  prefs = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? role;
  @override
  void initState() {
    if (prefs!.getString('role') != null) {
      print(prefs!.getString('role'));
      if (prefs!.getString('role') == "user") {
        role = "user";
      } else if (prefs!.getString('role') == "admin") {
        role = "admin";
      } else if (prefs!.getString('role') == "super") {
        role = "super";
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //authentication
      // home:LogIn(),

      //user
      // home: Register(),
      home: role =="user" ? BottomAppBar():role == "admin" ? Adminbottomappbar():role =="super"?SupervisorBottomAppBar(): Register(),

      //admin
      // home: Adminbottomappbar(),

      //supervisor
      // home: SupervisorBottomAppBar(),
      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: maincolor),
      ),
      routes: {
        "login": (context) => LogIn(),
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
