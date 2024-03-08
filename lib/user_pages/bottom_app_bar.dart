import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:med_intern/user_pages/attendance.dart';
import 'package:med_intern/user_pages/home_content.dart';
import 'package:med_intern/user_pages/more.dart';
import 'package:med_intern/user_pages/urgent_call.dart';
import 'package:med_intern/theme/fonts.dart';

class CustomBottomAppBar extends StatefulWidget {
  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
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
                    icon: Icons.calendar_today_rounded,
                    text: 'Attendance',
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
            ? const HomeContent()
            : _selectedIndex == 1
                ? const UrgentCalls()
                : _selectedIndex == 2
                    ? const Attendance()
                    : More(
                        data: [
                          {
                            'title': Text(
                              'Abdulaziz Nawaf',
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
                              '678054235',
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
                              'Aziz.na@hotmail.com',
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
                              'Bachelor\'s degree in "Radiology"',
                              style: med_grey_title,
                            ),
                            'icon': const Icon(
                              Icons.stars,
                              size: 40,
                              color: Colors.black,
                            )
                          },
                          const {
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
