import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/pages/home_content.dart';
import 'package:med_intern/pages/reset_code.dart';
import 'package:med_intern/pages/reset_password.dart';
import 'package:med_intern/theme/colors.dart';
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
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            height: 60,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: BottomAppBar(
                child: FlashyTabBar(
              selectedIndex: _selectedIndex,
              showElevation: true,
              onItemSelected: (index) => setState(() {
                _selectedIndex = index;
              }),
              items: [
                FlashyTabBarItem(
                  icon: Icon(
                    CupertinoIcons.person,
                    color: maincolor,
                  ),
                  title: Text(
                    'Profile',
                  ),
                ),
                 FlashyTabBarItem(
                  icon: Icon(
                    CupertinoIcons.person,
                    color: maincolor,
                  ),
                  title: Text(
                    'Profile',
                  ),
                ),
                 FlashyTabBarItem(
                  icon: Icon(
                    CupertinoIcons.person,
                    color: maincolor,
                  ),
                  title: Text(
                    'Profile',
                  ),
                ),
              ],
            ))),
        body: _selectedIndex == 0
            ? HomeContent()
            : _selectedIndex == 1
                ? HomeContent()
                : HomeContent(),
      ),
    );
  }
}
