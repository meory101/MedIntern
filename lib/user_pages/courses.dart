import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';
import 'package:med_intern/user_pages/courses_details.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  var data;

  fun() {
    data = FirebaseFirestore.instance.collection('courses').snapshots();
    setState(() {});
  }

  @override
  void initState() {
    fun();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MainDrawer(),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: MainAppBar(
            title: 'Courses',
          )),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(top: 40),
        child: StreamBuilder(
            stream: data,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return CourseDet(
                              course_id:
                                  '${snapshot.data.docs[index].reference.id}',
                            );
                          },
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: CustomListTile(
                          color: light_box_color,
                          icon: Icon(
                            CupertinoIcons.book_fill,
                            color: subcolor,
                            size: 25,
                          ),
                          subtitle: Text(
                            'click',
                            style: esmall_dark_grey_title,
                          ),
                          title: Text(
                            '${snapshot.data.docs[index].data()['title']}',
                            style: med_white_title,
                          ),
                        ),
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
