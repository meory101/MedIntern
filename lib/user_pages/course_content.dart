import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class course_content extends StatefulWidget {
  const course_content({super.key});

  @override
  State<course_content> createState() => _course_contentState();
}

class _course_contentState extends State<course_content> {
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
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(top: 25),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return 
            index ==0? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Course Content',
                    style: sub_black_title,
                  ),
                  Text(
                    'course lessons and assements ..!',
                    style: small_grey_title,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ):
            
            InkWell(
              child: Column(
                
                children: [
                  SizedBox(height: 40,),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('courselessons');
                    },
                    child: CustomListTile(
                      color: light_box_color,
                      icon: Icon(
                        CupertinoIcons.doc,
                        color: subcolor,
                        size: 25,
                      ),
                      title: Text(
                        'Course lessons',
                        style: small_white_title,
                      ),
                                            subtitle: Text(
                        'click here',
                        style: esmall_dark_grey_title,
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
                        size: 25,
                      ),
                      title: Text(
                        'Assements',
                        style: small_white_title,

                      ),
                      subtitle: Text('click here',style: esmall_dark_grey_title,),
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
