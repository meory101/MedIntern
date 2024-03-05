import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class Assesments extends StatefulWidget {
  const Assesments({super.key});

  @override
  State<Assesments> createState() => _AssesmentsState();
}

class _AssesmentsState extends State<Assesments> {
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
      body: InkWell(
        onTap: () {
          // Navigator.of(context).pushNamed('coursesdet');
        },
        child: Container(
          margin: EdgeInsets.only(top: 40),
          child: CustomListTile(
            color: light_box_color,
            icon: Icon(
              Icons.upload_file_rounded,
              color: subcolor,
              size: 40,
            ),
            subtitle: Text(
              'Due date: 20_12_2023',
              style: small_grey_title,
            ),
            title: Text(
              'Report 4',
              style: sub_white_title,
            ),
          ),
        ),
      ),
    );
  }
}
