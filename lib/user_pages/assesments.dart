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
          title: 'Assesments',
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      
          children: [
             Text(
              'Assesments',
              style: sub_black_title,
            ),
            Text(
              'click on assesment for more details!',
              style: small_grey_title,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('report');
              },
              child: Container(
                height: 60,
                margin: EdgeInsets.only(top: 40),
                child: CustomListTile(
                  color: light_box_color,
                  icon: Icon(
                    Icons.upload_file_rounded,
                    color: subcolor,
                    size: 25,
                  ),
                  subtitle: Text(
                    'Due date: 20_12_2023',
                    style: esmall_dark_grey_title,
                  ),
                  title: Text(
                    'Report 4',
                    style: small_white_title,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
