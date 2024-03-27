import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:med_intern/Admin_pages/Admin_home_content.dart';
import 'package:med_intern/Admin_pages/mangeschedual.dart';
import 'package:med_intern/components/roundbutton.dart';
import 'package:med_intern/Admin_pages/manage_account.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';
import 'package:med_intern/user_pages/more.dart';

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
          margin:  EdgeInsets.symmetric(vertical: 8, horizontal: 5),
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
                    icon: Icons.manage_accounts_rounded,
                    text: 'Mange Account',
                    textStyle: sub_black_bold,
                  ),
                  GButton(
                    iconSize: 40,
                    icon: Icons.calendar_month_rounded,
                    text: 'Schedule',
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
            ? const AdminHome()
            : _selectedIndex == 1
                ? const ManageAccounts()
                : _selectedIndex == 2
                    ? const Mangeschedual()
                    : More(
                        extra: RoundButton(
                            label: Text('Edit profile',style: med_white_bold,),
                            width: 200,
                            height: 60,
                            color: maincolor),
                        data: [
                          {
                            'title': Text(
                              'Abdulrahman Mohammed',
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
                              '22233456785',
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
                              'ABDmoh@gmai.com',
                              style: med_grey_title,
                            ),
                            'icon': const Icon(
                              Icons.mail,
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
