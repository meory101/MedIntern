import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';
import 'package:med_intern/user_pages/announcment.dart';
import 'package:med_intern/user_pages/course_content.dart';
import 'package:med_intern/user_pages/grades.dart';

class CourseDet extends StatefulWidget {
  String course_id;
  CourseDet({required this.course_id});
  @override
  State<CourseDet> createState() => _CourseDetState();
}

class _CourseDetState extends State<CourseDet> {
  @override
  Widget build(BuildContext context) {
    List<Text> titles = [
      Text(
        'Announcments',
        style: med_white_title,
      ),
      Text(
        'Grades',
        style: med_white_title,
      ),
      Text(
        'Course content',
        style: med_white_title,
      ),
      Text(
        'Dr.Khaled',
        style: med_white_title,
      ),
    ];
    List<Icon> icons = [
      Icon(
        Icons.barcode_reader,
        color: subcolor,
        size: 25,
      ),
      Icon(
        CupertinoIcons.star_circle_fill,
        color: subcolor,
        size: 25,
      ),
      Icon(
        Icons.menu_book_sharp,
        color: subcolor,
        size: 25,
      ),
      Icon(
        CupertinoIcons.person_crop_circle_fill,
        color: subcolor,
        size: 25,
      ),
    ];
    List routes = [
      MaterialPageRoute(
        builder: (context) {
          return Announcments(course_id: widget.course_id,);
        },
      ),
      MaterialPageRoute(
        builder: (context) {
          return grades();
        },
      ),
      MaterialPageRoute(
        builder: (context) {
          return course_content();
        },
      ),
      MaterialPageRoute(
        builder: (context) {
          return Announcments(course_id: widget.course_id,);
        },
      ),
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
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(top: 25),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Course Details',
                    style: sub_black_title,
                  ),
                  Text(
                    'all course details here!',
                    style: small_grey_title,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              );
            } else {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(routes[index-1]);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: CustomListTile(
                    color: light_box_color,
                    icon: icons[index - 1],
                    title: titles[index - 1],
                    subtitle: Text(
                      'click here',
                      style: esmall_dark_grey_title,
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
