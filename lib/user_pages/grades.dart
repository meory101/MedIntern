import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 30,
            width: 400,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Grade Details',
                  style: sub_black_title,
                ),
                Text(
                  'check grade details..!',
                  style: small_grey_title,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
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
          SizedBox(
            height: 50,
          ),
          Text(
            "Total grades",
            style: sub_grey_title,
          ),
             SizedBox(
            height: 20,
          ),
          Container(
              child: Text(
                "28 / 30",
                style: med_white_bold,
              ),
              height: 40,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1), blurRadius: 10)
                ],
                color: maincolor,
                borderRadius: BorderRadius.circular(150),
              )),
          SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}
