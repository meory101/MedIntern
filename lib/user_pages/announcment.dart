import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class Announcments extends StatefulWidget {
  String course_id;
  Announcments({required this.course_id});
  @override
  State<Announcments> createState() => _AnnouncmentsState();
}

class _AnnouncmentsState extends State<Announcments> {
  var data;

  fun() {
    data = FirebaseFirestore.instance.collection('announcments').where('courseid',isEqualTo: widget.course_id).snapshots();
    setState(() {});
  }
  @override
  void initState() {
    fun();
    super.initState();
  }
  List<Text> titles = [
    Text(
      'Pediatrics course',
      style: small_green_title,
    ),
    Text(
      'Pediatrics course',
      style: small_green_title,
    ),
    Text(
      'administrator',
      style: small_green_title,
    ),
  ];
  List<Widget> subtitles = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          'new content uploaded',
          style: small_dark_grey_title,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: Colors.red,
                    size: 16,
                  ),
                  Text(
                    '14-11-2023',
                    style: small_dark_grey_title,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.clock,
                    color: Colors.red,
                    size: 16,
                  ),
                  Text(
                    '18:37pm',
                    style: small_dark_grey_title,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          'Report 3 Grades',
          style: small_dark_grey_title,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: Colors.red,
                    size: 16,
                  ),
                  Text(
                    '14-11-2023',
                    style: esmall_dark_grey_title,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.clock,
                    color: Colors.red,
                    size: 16,
                  ),
                  Text(
                    '18:37pm',
                    style: esmall_dark_grey_title,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          'New updates to system',
          style: small_dark_grey_title,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: Colors.red,
                    size: 16,
                  ),
                  Text(
                    '14-11-2023',
                    style: esmall_dark_grey_title,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.clock,
                    color: Colors.red,
                    size: 16,
                  ),
                  Text(
                    '18:37pm',
                    style: esmall_dark_grey_title,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          'Report 3 Grades',
          style: small_dark_grey_title,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          // height: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 7)
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '14-11-2023',
                style: small_dark_grey_title,
              ),
              Text(
                '18:37pm',
                style: small_dark_grey_title,
              ),
            ],
          ),
        )
      ],
    ),
  ];

  List<Icon> icons = [
    Icon(
      Icons.barcode_reader,
      color: subcolor,
      size: 25,
    ),
    Icon(
      Icons.file_copy,
      color: subcolor,
      size: 25,
    ),
    Icon(
      Icons.barcode_reader,
      color: subcolor,
      size: 25,
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: MainAppBar(
          title: 'Announcments',
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: StreamBuilder<Object>(
          stream: data,
          builder: (context,AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data.docs.length+1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Course announcments',
                            style: sub_black_title,
                          ),
                          Text(
                            'you can find all course announcments here!',
                            style: small_grey_title,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    } else {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Card(
                          elevation: 0.7,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            margin: const EdgeInsets.only(bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    '${snapshot.data.docs[index-1].data()['title']}',style: small_black_title,),
                                Text(
                                    '${snapshot.data.docs[index-1].data()['content']}',style: small_dark_grey_title,)
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                );
            }
            else if (snapshot.connectionState == ConnectionState.waiting) {
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

          }
        ),
      ),
    );
  }
}
