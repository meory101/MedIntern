import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    List<Text> titles = [
      Text(
        'Record attendance',
        style: sub_white_title,
      ),
      Text(
        'View attendance',
        style: sub_white_title,
      ),
    ];
    List<Icon> icons = [
      Icon(
        Icons.location_on,
        color: subcolor,
        size: 40,
      ),
      Icon(
        Icons.location_history,
        color: subcolor,
        size: 40,
      ),
    ];
       List<String> routes = [
      'record_attendance',
      'view_attendance',
      
    ];
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: MainAppBar(
          title: 'Attendance',
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('${routes[index]}');
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: CustomListTile(
                    color: light_box_color,
                    icon: icons[index],
                    title: titles[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
