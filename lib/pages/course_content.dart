import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class cource_content extends StatefulWidget {
  const cource_content({super.key});

  @override
  State<cource_content> createState() => _cource_contentState();
}

class _cource_contentState extends State<cource_content> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: MainAppBar(
            title: 'Courses content',
          )),
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return InkWell(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('courselessons');
                    },
                    child: CustomListTile(
                      color: light_box_color,
                      icon: Icon(
                        CupertinoIcons.doc,
                        color: subcolor,
                        size: 40,
                      ),
                      title: Text(
                        'Course lessons',
                        style: sub_white_title,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                     onTap: () {
                      Navigator.of(context).pushNamed('assesments');
                    },
                    child: CustomListTile(
                      color: light_box_color,
                      icon: Icon(
                        CupertinoIcons.doc_checkmark,
                        color: subcolor,
                        size: 40,
                      ),
                      title: Text(
                        'Assements',
                        style: sub_white_title,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
