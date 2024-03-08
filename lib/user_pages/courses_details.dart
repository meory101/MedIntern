import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class CourseDet extends StatefulWidget {
  const CourseDet({super.key});

  @override
  State<CourseDet> createState() => _CourseDetState();
}

class _CourseDetState extends State<CourseDet> {
  @override
  Widget build(BuildContext context) {
    List<Text> titles = [
      Text(
        'Announcments',
        style: sub_white_title,
      ),
      Text(
        'Grades',
        style: sub_white_title,
      ),
      Text(
        'Course content',
        style: sub_white_title,
      ),
      Text(
        'Dr.Khaled',
        style: sub_white_title,
      ),
    ];
    List<Icon> icons = [
      Icon(
        Icons.barcode_reader,
        color: subcolor,
        size: 40,
      ),
      Icon(
        CupertinoIcons.star_circle_fill,
        color: subcolor,
        size: 40,
      ),
      Icon(
        Icons.menu_book_sharp,
        color: subcolor,
        size: 40,
      ),
      Icon(
        CupertinoIcons.person_crop_circle_fill,
        color: subcolor,
        size: 40,
      ),
    ];
    List<String> routes = [
      'announcments',
      'grades',
      'coursecontent',
      'announcments'
    ];
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: MainAppBar(
          title: 'Courses',
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('${routes[index]}');
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: CustomListTile(
                  color: light_box_color,
                  icon: icons[index],
                  title: titles[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
