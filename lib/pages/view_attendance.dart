import 'package:flutter/material.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class ViewAttendance extends StatefulWidget {
  const ViewAttendance({super.key});

  @override
  State<ViewAttendance> createState() => _ViewAttendanceState();
}

class _ViewAttendanceState extends State<ViewAttendance> {
  @override
  Widget build(BuildContext context) {
    List<Widget> titles = [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '2-10-2023',
            style: sub_white_title,
          ),
          Column(
            children: [
              Text('Monday', style: small_dark_grey_title),
              Text('7:30 am - 3:00 pm', style: small_dark_grey_title),
            ],
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '3-10-2023',
            style: sub_white_title,
          ),
          Column(
            children: [
              Text('Tuesday', style: small_dark_grey_title),
              Text('7:44 am - 3:00 pm', style: small_dark_grey_title),
            ],
          ),
        ],
      ),
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '4-10-2023',
            style: sub_white_title,
          ),
          Column(
            children: [
              Text('Wednsday', style: small_dark_grey_title),
              Text('7:59 am - 3:00 pm', style: small_dark_grey_title),
            ],
          ),
        ],
      ),
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '5-10-2023',
            style: sub_white_title,
          ),
          Column(
            children: [
              Text('Thursday', style: small_dark_grey_title),
              Text('7:30 am - 3:00 pm', style: small_dark_grey_title),
            ],
          ),
        ],
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
            title: 'View attendance',
          ),
        ),
        body: Container(
      margin: EdgeInsets.only(top: 40),
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('${routes[index]}');
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              child: CustomListTile(
                  color: light_box_color,
                  icon: Icon(
                    Icons.check_box,
                    size: 40,
                    color: Colors.white,
                  ),
                  title: titles[index]),
            ),
          );
        },
      ),
    ));
  }
}
