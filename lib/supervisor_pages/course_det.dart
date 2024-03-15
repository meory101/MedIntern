import 'package:flutter/material.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class SupervisorCourseDet extends StatefulWidget {
  final Text title;
  SupervisorCourseDet({required this.title});
  @override
  State<SupervisorCourseDet> createState() => _SupervisorCourseDetState();
}

class _SupervisorCourseDetState extends State<SupervisorCourseDet> {
  @override
  Widget build(BuildContext context) {
    List<Text> titles = [
      Text(
        'Announcment',
        style: sub_white_title,
      ),
      Text(
        'Course content',
        style: sub_white_title,
      ),
      Text(
        'Grade',
        style: sub_white_title,
      ),
      Text(
        'Attendance',
        style: sub_white_title,
      ),
    ];
    List<String> routes = [
      'superannounc',
      'supcoursecontent',
      'superannounc',
      'superannounc',
    ];
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: MainAppBar(
          title: '${widget.title.data}',
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
                    color: light_box_color, title: titles[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
