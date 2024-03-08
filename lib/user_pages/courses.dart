import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: MainAppBar(
            title: 'Courses',
          )),
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('coursesdet');
              },
              child: CustomListTile(
                color: light_box_color,
                icon: Icon(
                  CupertinoIcons.book_fill,
                  color: subcolor,
                  size: 40,
                ),
                subtitle: Text(
                  'Dr.khalid',
                  style: small_grey_title,
                ),
                title: Text(
                  'Pediatrices',
                  style: sub_white_title,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
