import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:med_intern/supervisor_pages/supervisor_courses.dart';
import 'package:med_intern/supervisor_pages/supervisor_home_content.dart';
import 'package:med_intern/supervisor_pages/urgentcall.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/user_pages/more.dart';
import 'package:med_intern/theme/fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

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
                SalomonBottomBar(
                    itemPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    unselectedItemColor: Colors.black87.withOpacity(0.7),
                    curve: Curves.linear,
                    selectedItemColor: light_box_color,
                    duration: Duration(seconds: 1),
                    currentIndex: _selectedIndex,
                    onTap: (i) => setState(() => _selectedIndex = i),
                    items: [
                      SalomonBottomBarItem(
                        icon: Icon(Icons.home, size: 25),
                        title: Text("Home"),
                        selectedColor: maincolor,
                      ),
                      // SalomonBottomBarItem(
                      //   icon: Icon(
                      //     Icons.notifications_active,
                      //     size: 25,
                      //   ),
                      //   title: Text("Urgetnt calls"),
                      //   selectedColor: maincolor,
                      // ),
                      SalomonBottomBarItem(
                        icon: Icon(Icons.notifications_active, size: 25),
                        title: Text("Send Urgentcall"),
                        selectedColor: maincolor,
                      ),
                      SalomonBottomBarItem(
                        icon: Icon(
                          Icons.menu_book,
                          size: 25,
                        ),
                        title: Text("Courses"),
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
        body: _selectedIndex == 0
            ? const SupervisorHome()
            : _selectedIndex == 1
                ? const SupUrgentCalls()
                : _selectedIndex == 2
                    ? const SupervisorCourses()
                    : More(
                        data: [
                          {
                            'title': Text(
                              'Ahmad',
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
                              '222255556666',
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
                              'ahmadi@hotmail.com',
                              style: small_grey_title,
                            ),
                            'icon': const Icon(
                              Icons.mail,
                              size: 25,
                              color: Colors.white,
                            ),
                          },
                          {
                            'title': Text(
                              'Dntist',
                              style: small_grey_title,
                            ),
                            'icon': const Icon(
                              Icons.work,
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
