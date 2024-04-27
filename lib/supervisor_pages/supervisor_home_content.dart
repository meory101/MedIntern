import 'package:flutter/material.dart';
import 'package:med_intern/Admin_pages/create_Account.dart';
import 'package:med_intern/Admin_pages/mangeschedual.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/supervisor_drawer.dart';
import 'package:med_intern/main.dart';
import 'package:med_intern/supervisor_pages/nexturgentcall.dart';
import 'package:med_intern/supervisor_pages/supervisor_courses.dart';
import 'package:med_intern/theme/fonts.dart';

class SupervisorHome extends StatefulWidget {
  const SupervisorHome({super.key});

  @override
  State<SupervisorHome> createState() => _SupervisorHomeState();
}

class _SupervisorHomeState extends State<SupervisorHome> {
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
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) {
                  //     // return sendcall();
                  //   },
                  // ));
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
                            Icon(Icons.notifications_active),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Send Urgentcall',
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
                      return SupervisorCourses();
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
                            Icon(Icons.menu_book),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Courses ',
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
                  Navigator.of(context).pushNamedAndRemoveUntil("login",(route) =>false,);
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
