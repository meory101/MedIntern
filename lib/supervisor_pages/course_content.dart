import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class SupCourseContent extends StatefulWidget {
  const SupCourseContent({super.key});

  @override
  State<SupCourseContent> createState() => _CourseContentState();
}

class _CourseContentState extends State<SupCourseContent> {
  @override
  Widget build(BuildContext context) {
    List<String> title = ['Course Material', 'Assignment', 'Manage Scheduale'];
    List<String> routes = ['coursematerial', 'Assignment', 'Manage Scheduale'];

    return Scaffold(
      drawer: const MainDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: MainAppBar(
          title: 'Childhood diseases',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: maincolor),
                    ),
                  ),
                  child: Text(
                    'Course Content',
                    style: sub_green_bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height / 2,
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(routes[index]);
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            child: CustomListTile(
                              color: light_box_color,
                              title: Text(
                                '${title[index]}',
                                style: sub_white_title,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
