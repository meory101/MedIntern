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
      Text(
        '2-10-2023',
        style: small_white_title,
      ),

      // Expanded(

      Text(
        '3-10-2023',
        style: small_white_title,
      ),

      Text(
        '4-10-2023',
        style: small_white_title,
      ),

      Text(
        '5-10-2023',
        style: small_white_title,
      ),
    ];
    List<Widget> subs = [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'Monday',
            style: esmall_dark_grey_title,
          ),
          Text(
            '7:30am - 3:00 pm',
            style: esmall_dark_grey_title,
          )
        ],
      )
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
                onTap: () {},
                child: Container(
                  // height: 100,
                  margin: EdgeInsets.only(bottom: 10),
                  child: CustomListTile(
                    color: light_box_color,
                    icon: Icon(
                      Icons.check_box,
                      size: 25,
                      color: Colors.white,
                    ),
                    title: titles[index],
                    subtitle: subs[0],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
