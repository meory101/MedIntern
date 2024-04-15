import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/main.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class ViewAttendance extends StatefulWidget {
  const ViewAttendance({super.key});

  @override
  State<ViewAttendance> createState() => _ViewAttendanceState();
}

class _ViewAttendanceState extends State<ViewAttendance> {
  @override
  void initState() {
    fun();
    super.initState();
  }

  var data;
  fun() async {
    print(prefs!.getString('id'));
    data = await FirebaseFirestore.instance
        .collection('not')
        .where('userid', isEqualTo: '${prefs!.getString('id')}')
        .snapshots();
    setState(() {});
  }

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
            child: StreamBuilder(
                stream: data,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(bottom: 20),
                            child: CustomListTile(
                              color: light_box_color,
                              subtitle: Text(
                                '${snapshot.data.docs[index].data()['date']}',
                                style: esmall_dark_grey_title,
                              ),
                              title: Text(
                                '${snapshot.data.docs[index].data()['title']}',
                                style: med_white_title,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator(
                          color: maincolor,
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: Text('no data'),
                    );
                  }
                })));
  }
}
