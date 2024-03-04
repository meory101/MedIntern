import 'package:flutter/material.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class MainAppBar extends StatefulWidget {
  String title;
  MainAppBar({required this.title});
  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: maincolor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.white, width: 3),
              ),
            ),
          ),
          SizedBox(
            width: 50,
          ),
          Text(
            widget.title,
            style: sub_white_title,
          ),
        ],
      ),
      iconTheme: IconThemeData(color: Colors.white, size: 50),
      actions: [
      
        Container(
          margin: EdgeInsets.only(top: 10, right: 6),
          height: 80,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/logo.jpg',
                ),
                fit: BoxFit.cover),
          ),
        )
      ],
    );
  }
}
