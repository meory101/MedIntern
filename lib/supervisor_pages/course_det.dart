import 'package:flutter/material.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/supervisor_pages/announcment.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';
import 'package:med_intern/user_pages/announcment.dart';
import 'package:med_intern/user_pages/attendance.dart';
import 'package:med_intern/user_pages/course_content.dart';
import 'package:med_intern/user_pages/grades.dart';

class SupervisorCourseDet extends StatefulWidget {
  final Text title;
  final String course_id;

  SupervisorCourseDet({required this.title, required this.course_id});
  @override
  State<SupervisorCourseDet> createState() => _SupervisorCourseDetState();
}

class _SupervisorCourseDetState extends State<SupervisorCourseDet> {
  @override
  void initState() {
    print(widget.course_id);
    super.initState();
  }

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
    List routes = [
      SupAnnouncments(title: widget.title.data!,course_id:  widget.course_id,),
      course_content(),
      grades(),
      Attendance(),
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
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return routes[index];
                  },
                ));
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
