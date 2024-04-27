import 'dart:io';
import 'dart:math';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';
import 'package:http/http.dart' as http;
import 'package:open_app_file/open_app_file.dart';

class CourseLessons extends StatefulWidget {
  String docid;
  CourseLessons({required this.docid});

  @override
  State<CourseLessons> createState() => _CourseLessonsState();
}

class _CourseLessonsState extends State<CourseLessons> {
  Future<String> loadPDF(url) async {
    print('llllllllllllllllllllllllllllllllllll');
    print(url);
    var response = await http.get(Uri.parse(url));
    int i = Random().nextInt(100);
    print(i);
    var uu = '${url.split('/').last}';
    var dir = await getApplicationDocumentsDirectory();
    File file = new File("${dir.path}/$uu");
    file.writeAsBytesSync(response.bodyBytes, flush: true);
    return file.path;
  }

  var course;
  String? path1;
  fun() {
    if (widget.docid != "1") {
      course = FirebaseFirestore.instance
          .collection('courses')
          .doc(widget.docid)
          .get()
          .then((value) async {
        print('gggggggggggggggggggggggg');
        path1 = await loadPDF(value.data()!['link']);

        if (path1 != null) {
          await OpenAppFile.open(path1!);
        }
      });
      setState(() {});
    }
  }

  List<Icon> icons = [
    Icon(
      CupertinoIcons.book,
      color: subcolor,
      size: 25,
    ),
    // Icon(
    //   Icons.file_copy_outlined,
    //   color: subcolor,
    //   size: 25,
    // ),
    // Icon(
    //   CupertinoIcons.video_camera,
    //   color: subcolor,
    //   size: 25,
    // ),
  ];
  List<Text> titles = [
    Text(
      'Books',
      style: small_white_title,
    ),
    // Text(
    //   'Slides',
    //   style: small_white_title,
    // ),
    // Text(
    //   'Videos',
    //   style: small_white_title,
    // ),
  ];
  @override
  void initState() {
    print('----------------------------------------');
    print(widget.docid);
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
            title: 'Course lessons',
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 70),
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {},
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
        ));
  }
}
