import 'package:flutter/material.dart';
import 'package:med_intern/Admin_pages/add_course.dart';
import 'package:med_intern/Admin_pages/create_Account.dart';
import 'package:med_intern/Admin_pages/mangeschedual.dart';
import 'package:med_intern/Admin_pages/rotation.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/supervisor_drawer.dart';
import 'package:med_intern/main.dart';
import 'package:med_intern/theme/fonts.dart';
import 'package:med_intern/user_pages/courses.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: MainAppBar(
          showimage: false,
          color: Colors.transparent,
          title: '',
        ),
      ),
      drawer: SupervisorDrawer(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hi ${prefs!.getString("name")}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Welcome back to MedIntern!',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                        "assets/images/person.jpg",
                      ),
                    ),
                  )
                ],
              ),
              Container(
                  child: Container(
                height: 40,
                margin: const EdgeInsets.only(top: 60, bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12),
                ),
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(Icons.call),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'contact us',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ]),
              )),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return createAccount();
                    },
                  ));
                },
                child: Container(
                    child: Container(
                  height: 40,
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Icon(Icons.add_circle_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Add Account',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ]),
                )),
              ),
               InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return AddCourse();
                    },
                  ));
                },
                child: Container(
                    child: Container(
                  height: 40,
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Icon(Icons.add_circle_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Add Course',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ]),
                )),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return Mangeschedual();
                    },
                  ));
                },
                child: Container(
                    child: Container(
                  height: 40,
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Icon(Icons.date_range_rounded),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Show Routine',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ]),
                )),
              ),
              InkWell(
                onTap: () {
                  prefs!.clear();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    "login",
                    (route) => false,
                  );
                },
                child: Container(
                    child: Container(
                  height: 40,
                  margin: const EdgeInsets.only(bottom: 15, top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.logout,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'logout',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ]),
                )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
