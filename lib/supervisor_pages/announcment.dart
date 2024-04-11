import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/Admin_pages/create_Account.dart';
import 'package:med_intern/components/editable_announcment.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/components/recbutton.dart';
import 'package:med_intern/main.dart';
import 'package:med_intern/supervisor_pages/create_announcment.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class SupAnnouncments extends StatefulWidget {
  String title;
  String course_id;
  SupAnnouncments({required this.title, required this.course_id});
  @override
  State<SupAnnouncments> createState() => _SupAnnouncmentsState();
}

class _SupAnnouncmentsState extends State<SupAnnouncments> {
  var announcments;
  fun() {
    announcments = FirebaseFirestore.instance
        .collection('announcments')
        .where('superid', isEqualTo: '${prefs!.getString('id')}')
        .where('courseid', isEqualTo: widget.course_id)
        .snapshots();
    print(announcments);
    print(prefs!.getString('id'));
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
      drawer: const MainDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: MainAppBar(
          title: '${widget.title}',
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: maincolor, spreadRadius: 1, blurRadius: 2)
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Announcments',
                style: sub_green_bold,
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height / 2,
                  child: StreamBuilder(
                      stream: announcments,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (context, index) {
                                return EditableAnnounc(
                                  aid:
                                      '${snapshot.data.docs[index].reference.id}',
                                  atitle:
                                      '${snapshot.data.docs[index].data()['title']}',
                                  acontent:
                                      '${snapshot.data.docs[index].data()['content']}',
                                  title: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.light,
                                          color: subcolor,
                                        ),
                                      ),
                                      Text(
                                        '${snapshot.data.docs[index].data()['title']}',
                                        style: small_black_title,
                                      ),
                                    ],
                                  ),
                                );
                              });
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                      })),
              SizedBox(
                height: 50,
              ),
              RecButton(
                  fun: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return CreateAnnouncment(course_id: widget.course_id,);
                      },
                    ));
                  },
                  label: Text(
                    'Create Announcment',
                    style: med_white_bold,
                  ),
                  width: double.infinity,
                  height: 50,
                  color: maincolor)
            ],
          ),
        ),
      ),
    );
  }
}
