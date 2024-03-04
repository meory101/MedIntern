import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class Announcments extends StatefulWidget {
  const Announcments({super.key});

  @override
  State<Announcments> createState() => _AnnouncmentsState();
}

class _AnnouncmentsState extends State<Announcments> {
  List<Text> titles = [
    Text(
      'Pediatrics course',
      style: med_green_title,
    ),
    Text(
      'Pediatrics course',
      style: med_green_title,
    ),
    Text(
      'administrator',
      style: med_green_title,
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
          'new content uploaded',
          style: small_dark_grey_title,
        ),
        SizedBox(height: 20,),
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
                '14-11-2023',
                style: small_dark_grey_title,
              ),
              Text(
                '18:37pm',
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
          'New updates to system',
          style: small_dark_grey_title,
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
                '14-11-2023',
                style: small_dark_grey_title,
              ),
              Text(
                '18:37pm',
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
          'New updates to system'
         ,
          style: small_dark_grey_title,
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
                '14-11-2023',
                style: small_dark_grey_title,
              ),
              Text(
                '18:37pm',
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
         'Report 3 Grades',
          style: small_dark_grey_title,
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
                '14-11-2023',
                style: small_dark_grey_title,
              ),
              Text(
                '18:37pm',
                style: small_dark_grey_title,
              ),
            ],
          ),
        )
      ],
    ),
    
   
  ];

  List<Icon> icons = [
    Icon(
      Icons.barcode_reader,
      color: subcolor,
      size: 40,
    ),
    Icon(
      CupertinoIcons.star_circle_fill,
      color: subcolor,
      size: 40,
    ),
    Icon(
      Icons.menu_book_sharp,
      color: subcolor,
      size: 40,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: MainAppBar(
          title: 'Announcments',
        ),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            
            height: 100,
            margin: const EdgeInsets.only(bottom: 60),
            child: CustomListTile(
              color: Colors.transparent,
              icon: icons[index],
              title: titles[index],
              subtitle: subtitles[index],
            ),
          );
        },
      ),
    );
  }
}
