import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/supervisor_pages/course_det.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class SupervisorCourses extends StatefulWidget {
  const SupervisorCourses({super.key});

  @override
  State<SupervisorCourses> createState() => _SupervisorCoursesState();
}

class _SupervisorCoursesState extends State<SupervisorCourses> {
  @override
  Widget build(BuildContext context) {
    List<Text> titles = [
      Text(
        'Childhood Diseases',
        style: small_white_title,
      ),
      Text(
        'Perdiatric Health Care Ethics',
        style: small_white_title,
      ),
      Text(
        'Perdiatric Emergency',
        style: small_white_title,
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
      // drawer: const MainDrawer(),
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(100),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Container(child: Image.asset("assets/images/logo.jpg")),
      //     ],
      //   ),
      // ),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return SupervisorCourseDet(title: titles[index]);
                  },
                ));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
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
