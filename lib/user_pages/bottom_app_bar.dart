import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/user_pages/attendance.dart';
import 'package:med_intern/user_pages/home_content.dart';
import 'package:med_intern/user_pages/more.dart';
import 'package:med_intern/user_pages/urgent_call.dart';
import 'package:med_intern/theme/fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottomAppBar extends StatefulWidget {
  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black),
              ],
            ),
            height: 70,
            margin: EdgeInsets.only(
              bottom: 10,
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SalomonBottomBar(
                    itemPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    unselectedItemColor: Colors.black87.withOpacity(0.7),
                    curve: Curves.linear,
                    selectedItemColor: light_box_color,
                    duration: Duration(seconds: 1),
                    // backgroundColor: ,
                    // selectedColorOpacity: ,
                    currentIndex: selectedIndex,
                    onTap: (i) => setState(() => selectedIndex = i),
                    items: [
                      SalomonBottomBarItem(
                        icon: Icon(
                          Icons.notifications_active,
                          size: 25,
                        ),
                        title: Text("Urgetnt calls"),
                        selectedColor: maincolor,
                      ),
                      SalomonBottomBarItem(
                        icon: Icon(Icons.calendar_month_outlined, size: 25),
                        title: Text("Attendance"),
                        selectedColor: maincolor,
                      ),
                      SalomonBottomBarItem(
                        icon: Icon(Icons.home, size: 25),
                        title: Text("Home"),
                        selectedColor: maincolor,
                      ),
                      SalomonBottomBarItem(
                        icon: Icon(Icons.person, size: 25),
                        title: Text("Profile"),
                        selectedColor: maincolor,
                      ),
                    ]),
              ],
            )),
        body: selectedIndex == 0
            ? const UrgentCalls()
            : selectedIndex == 1
                ? const Attendance()
                : selectedIndex == 2
                    ? const HomeContent()
                    : More(
                        data: [
                          {
                            'title': Text(
                              'Abdulaziz Nawaf',
                              style: small_grey_title,
                            ),
                            'icon': const Icon(
                              Icons.person_2_outlined,
                              size: 25,
                              color: Colors.white,
                            )
                          },
                          {
                            'title': Text(
                              '678054235',
                              style: small_grey_title,
                            ),
                            'icon': const Icon(
                              Icons.medical_services,
                              size: 25,
                              color: Colors.white,
                            )
                          },
                          {
                            'title': Text(
                              'Aziz.na@hotmail.com',
                              style: small_grey_title,
                            ),
                            'icon': const Icon(
                              Icons.mail,
                              size: 25,
                              color: Colors.white,
                            )
                          },
                          {
                            'title': Text(
                              'Bachelor\'s degree in "Radiology"',
                              style: small_grey_title,
                            ),
                            'icon': const Icon(
                              Icons.stars,
                              size: 25,
                              color: Colors.white,
                            )
                          },
                          const {
                            'title': Row(
                              children: [
                                Icon(
                                  Icons.password,
                                  color: Colors.grey,
                                  size: 25,
                                ),
                                Icon(
                                  Icons.password,
                                  color: Colors.grey,
                                  size: 25,
                                ),
                                Icon(
                                  Icons.password,
                                  color: Colors.grey,
                                  size: 25,
                                ),
                              ],
                            ),
                            'icon': Icon(
                              Icons.key_off,
                              size: 25,
                              color: Colors.white,
                            )
                          },
                        ],
                      ),
      ),
    );
  }
}
