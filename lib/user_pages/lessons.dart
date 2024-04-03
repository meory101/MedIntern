import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class CourseLessons extends StatefulWidget {
  const CourseLessons({super.key});

  @override
  State<CourseLessons> createState() => _CourseLessonsState();
}

class _CourseLessonsState extends State<CourseLessons> {
  List<Icon> icons = [
    Icon(
      CupertinoIcons.book,
      color: subcolor,
      size: 25,
    ),
    Icon(
      Icons.file_copy_outlined,
      color: subcolor,
      size: 25,
    ),
    Icon(
      CupertinoIcons.video_camera,
      color: subcolor,
      size: 25,
    ),
  ];
  List<Text> titles = [
    Text(
      'Books',
      style: small_white_title,
    ),
    Text(
      'Slides',
      style: small_white_title,
    ),
    Text(
      'Videos',
      style: small_white_title,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: MainAppBar(
          title: 'Course lessons',
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 70),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // Navigator.of(context).pushNamed('${routes[index]}');
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
