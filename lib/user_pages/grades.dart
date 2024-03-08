import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class grades extends StatefulWidget {
  grades({super.key});

  @override
  State<grades> createState() => _gradesState();
}

class _gradesState extends State<grades> {
  List sum = [
    {"name": "Report 1", "mark": "10/10"},
    {"name": "Report 2", "mark": "9/10"},
    {"name": "Report 3", "mark": "9/10"},
    {"name": "Report 4", "mark": "0/10"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: MainAppBar(
          title: 'Grade',
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: 30,
          width: 400,
        ),
        Container(
            child: Text(
              "28 / 30",
              style: main_white_title,
            ),
            height: 90,
            width: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)
              ],
              color: maincolor,
              borderRadius: BorderRadius.circular(150),
            )),
        SizedBox(
          height: 10,
        ),
        Text(
          "Total grades",
          style: sub_grey_title,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Report 1",
              style: med_black_title,
            ),
            Text("10/10"),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Report 2",
              style: med_black_title,
            ),
            Text("9/10"),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Report 3",
              style: med_black_title,
            ),
            Text("9/10"),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Report 2",
              style: med_black_title,
            ),
            Text("0/10"),
          ],
        ),
      ]),
    );
  }
}
