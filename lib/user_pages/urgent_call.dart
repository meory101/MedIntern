import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class UrgentCalls extends StatefulWidget {
  const UrgentCalls({super.key});

  @override
  State<UrgentCalls> createState() => _UrgentCallsState();
}

class _UrgentCallsState extends State<UrgentCalls> {
  List<Text> titles = [
    Text(
      'Dr.khalid',
      style: med_black_title,
    ),
    Text(
      'Dr.khalid',
      style: med_black_title,
    ),
  
  ];
  List<Widget> subtitles = [
 
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          'Patient 2920 lab work',
          style: small_grey_title,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 7)
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '20-11-2023',
                style: small_dark_grey_title,
              ),
              Text(
                '9:37am',
                style: small_dark_grey_title,
              ),
            ],
          ),
        )
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          'ER room 2',
          style: small_grey_title,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 7)
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '19-11-2023',
                style: small_dark_grey_title,
              ),
              Text(
                '10:02am',
                style: small_dark_grey_title,
              ),
            ],
          ),
        )
      ],
    ),
  ];

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: MainAppBar(
          title: 'Urgent Calls',
        ),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            margin: const EdgeInsets.only(bottom: 60),
            child: CustomListTile(
              color: Colors.transparent,
              icon: Icon(
                Icons.notifications_active,
                size: 40,
                color: subcolor,
              ),
              title: titles[index],
              subtitle: subtitles[index],
            ),
          );
        },
      ),
    );
  }
}
