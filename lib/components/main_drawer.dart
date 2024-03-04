import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/recbutton.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      backgroundColor: maincolor,
      width: MediaQuery.of(context).size.width / 2.5,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(4),
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    CupertinoIcons.line_horizontal_3,
                    color: Colors.white,
                    size: 50,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            RecButton(
                label: Text(
                  'Contact us',
                  style: small_black_title,
                ),
                width: MediaQuery.of(context).size.width / 3 - 20,
                height: 50,
                color: boxcolor),
            SizedBox(
              height: 20,
            ),
            RecButton(
                fun: () {
                  Navigator.of(context).pushNamed('courses');
                },
                label: Text(
                  'Courses',
                  style: small_black_title,
                ),
                width: MediaQuery.of(context).size.width / 3 - 20,
                height: 50,
                color: boxcolor),
            SizedBox(
              height: 20,
            ),
            RecButton(
                label: Text(
                  'Schedule',
                  style: small_black_title,
                ),
                width: MediaQuery.of(context).size.width / 3 - 20,
                height: 50,
                color: boxcolor),
            SizedBox(
              height: 20,
            ),
            RecButton(
                label: Text(
                  'announcement',
                  style: small_black_title,
                ),
                width: MediaQuery.of(context).size.width / 3 - 20,
                height: 50,
                color: boxcolor),
            SizedBox(
              height: 20,
            ),
            RecButton(
                label: Text(
                  'logout',
                  style: small_black_title,
                ),
                width: MediaQuery.of(context).size.width / 3 - 20,
                height: 50,
                color: boxcolor)
          ],
        ),
      ),
    );
  }
}
