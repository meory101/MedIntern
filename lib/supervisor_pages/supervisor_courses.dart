import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/main.dart';
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
  void initState() {
    fun();
    super.initState();
  }

  var courses;
  fun() {
    courses = FirebaseFirestore.instance
        .collection('courses')
        .where('superid', isEqualTo: "${prefs!.getString('id')}")
        .snapshots();
    print(courses);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
        child: StreamBuilder<Object>(
            stream: courses,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return SupervisorCourseDet(
                              course_id: snapshot.data.docs[index].reference.id,
                                title: Text(
                                    snapshot.data.docs[index].data()['title']));
                          },
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: CustomListTile(
                            color: light_box_color,
                            title:Text(
                                snapshot.data.docs[index].data()['title'])),
                      ),
                    );
                  },
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(
                      color: maincolor,
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Text('no data'),
                );
              }
            }),
      ),
    );
  }
}
