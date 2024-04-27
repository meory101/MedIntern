import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/main.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class UrgentCalls extends StatefulWidget {
  const UrgentCalls({super.key});

  @override
  State<UrgentCalls> createState() => _UrgentCallsState();
}

class _UrgentCallsState extends State<UrgentCalls> {
  void initState() {
    fun();
    super.initState();
  }

  var accounts;

  fun() {
    print("${prefs!.getString('id')}");
    accounts = FirebaseFirestore.instance
        .collection('sendurgentcall')
        .where('userid', isEqualTo: "${prefs!.getString('id')}")
        .snapshots();
    setState(() {});
  }

  List<Text> titles = [
    Text(
      'Dr.khalid',
      style: med_white_title,
    ),
    Text(
      'Dr.khalid',
      style: med_white_title,
    ),
  ];
  List<Widget> subtitles = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Patient 2920 lab work',
          style: small_grey_title,
        ),
        Container(
          // height: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 7)
            ],
          ),
        )
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ER room 2',
          style: small_grey_title,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 7)
            ],
          ),
        )
      ],
    ),
  ];
  var date = [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Icon(
              Icons.calendar_month,
              color: Colors.red,
              size: 19,
            ),
            Text(
              '20-11-2023',
              style: esmall_dark_grey_title,
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              CupertinoIcons.clock,
              color: Colors.red,
              size: 19,
            ),
            Text(
              '9:37am',
              style: esmall_dark_grey_title,
            ),
          ],
        ),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Icon(
              Icons.calendar_month,
              color: Colors.red,
              size: 19,
            ),
            Text(
              '19-11-2023',
              style: esmall_dark_grey_title,
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              CupertinoIcons.clock,
              color: Colors.red,
              size: 19,
            ),
            Text(
              '10:02am',
              style: esmall_dark_grey_title,
            ),
          ],
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const MainDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: MainAppBar(
          title: 'Urgent Calls',
        ),
      ),
      body: StreamBuilder(
          stream: accounts,
          builder: (context, AsyncSnapshot snapshot) {
            return !snapshot.hasData
                ? Text('')
                : ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      return Container(
                        // height: 100,
                        margin: const EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                            CustomListTile(
                              color: Colors.transparent,
                              icon: Icon(
                                Icons.notifications_active,
                                size: 25,
                                color: subcolor,
                              ),
                              title: Text(
                                  snapshot.data.docs[index].data()['title']),
                              subtitle: Text(
                                  snapshot.data.docs[index].data()['content']),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(snapshot.data.docs[index]
                                .data()['date']
                                .toString())
                          ],
                        ),
                      );
                    },
                  );
          }),
    );
  }
}
