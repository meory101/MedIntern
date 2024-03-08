import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:med_intern/supervisor_pages/supervisor_courses.dart';
import 'package:med_intern/supervisor_pages/supervisor_home_content.dart';
import 'package:med_intern/user_pages/attendance.dart';
import 'package:med_intern/user_pages/home_content.dart';
import 'package:med_intern/user_pages/more.dart';
import 'package:med_intern/user_pages/urgent_call.dart';
import 'package:med_intern/theme/fonts.dart';

class SupervisorBottomAppBar extends StatefulWidget {
  @override
  State<SupervisorBottomAppBar> createState() => _SupervisorBottomAppBarState();
}

class _SupervisorBottomAppBarState extends State<SupervisorBottomAppBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey)),
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              GNav(
                selectedIndex: _selectedIndex,
                onTabChange: (value) {
                  setState(() {
                    _selectedIndex = value;
                  });
                },
                tabs: [
                  GButton(
                    iconSize: 40,
                    icon: Icons.home_filled,
                    text: 'Home',
                    textStyle: sub_black_bold,
                  ),
                  GButton(
                    iconSize: 40,
                    icon: Icons.notifications_active_outlined,
                    text: 'Urgent call',
                    textStyle: sub_black_bold,
                  ),
                  GButton(
                    iconSize: 40,
                    icon: CupertinoIcons.book_fill,
                    text: 'Courses',
                    textStyle: sub_black_bold,
                  ),
                  GButton(
                    iconSize: 40,
                    icon: Icons.person_2_outlined,
                    text: 'More',
                    textStyle: sub_black_bold,
                  )
                ],
              ),
            ],
          ),
        ),
        body: _selectedIndex == 0
            ? const SupervisorHome()
            : _selectedIndex == 1
                ? const UrgentCalls()
                : _selectedIndex == 2
                    ? const SupervisorCourses()
                    : More(
                        data: [
                          {
                            'title': Text(
                              'Waleed Yousif',
                              style: med_grey_title,
                            ),
                            'icon': const Icon(
                              Icons.person_2_outlined,
                              size: 40,
                              color: Colors.black,
                            )
                          },
                          {
                            'title': Text(
                              '23356789098',
                              style: med_grey_title,
                            ),
                            'icon': const Icon(
                              Icons.medical_services,
                              size: 40,
                              color: Colors.black,
                            )
                          },
                          {
                            'title': Text(
                              'Waleed01@hotmail.com',
                              style: med_grey_title,
                            ),
                            'icon': const Icon(
                              Icons.mail,
                              size: 40,
                              color: Colors.black,
                            )
                          },
                          {
                            'title': Text(
                              'Dentist',
                              style: med_grey_title,
                            ),
                            'icon': const Icon(
                              CupertinoIcons.bag,
                              size: 40,
                              color: Colors.black,
                            )
                          },
                           {
                            'title': Row(
                              children: [
                                Icon(
                                  Icons.password,
                                  color: Colors.grey,
                                  size: 40,
                                ),
                                Icon(
                                  Icons.password,
                                  color: Colors.grey,
                                  size: 40,
                                ),
                                Icon(
                                  Icons.password,
                                  color: Colors.grey,
                                  size: 40,
                                ),
                              ],
                            ),
                            'icon': Icon(
                              Icons.key_off,
                              size: 40,
                              color: Colors.black,
                            )
                          },
                        ],
                      ),
      ),
    );
  }
}
