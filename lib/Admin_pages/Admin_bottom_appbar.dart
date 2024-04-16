import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:med_intern/Admin_pages/Admin_home_content.dart';
import 'package:med_intern/Admin_pages/mangeschedual.dart';
import 'package:med_intern/components/roundbutton.dart';
import 'package:med_intern/Admin_pages/manage_account.dart';
import 'package:med_intern/main.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';
import 'package:med_intern/user_pages/more.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Adminbottomappbar extends StatefulWidget {
  const Adminbottomappbar({super.key});

  @override
  State<Adminbottomappbar> createState() => _AdminbottomappbarState();
}

class _AdminbottomappbarState extends State<Adminbottomappbar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            // decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(10),
            // border: Border.all(color: Colors.grey)),
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
                    // backgroundColor: ,
                    // selectedColorOpacity: ,
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
                        icon: Icon(Icons.manage_accounts, size: 25),
                        title: Text("mange Accounts"),
                        selectedColor: maincolor,
                      ),
                      SalomonBottomBarItem(
                        icon: Icon(
                          Icons.date_range_rounded,
                          size: 25,
                        ),
                        title: Text("mange Schedual"),
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
            ? const AdminHome()
            : _selectedIndex == 1
                ? const ManageAccounts()
                : _selectedIndex == 2
                    ? const Mangeschedual()
                    : More(
                        data: [
                          {
                            'title': Text(
                              '${prefs!.getString('name')}',
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
                              '22233456785',
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
                              '${prefs!.getString('email')}',
                              style: small_grey_title,
                            ),
                            'icon': const Icon(
                              Icons.mail,
                              size: 25,
                              color: Colors.white,
                            ),
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
