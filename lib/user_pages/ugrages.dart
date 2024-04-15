import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/main.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class Ugrades extends StatefulWidget {
  String course_id;
  Ugrades({required this.course_id});
  @override
  State<Ugrades> createState() => _UgradesState();
}

class _UgradesState extends State<Ugrades> {
  var grade;
  fun() {
    grade = FirebaseFirestore.instance
        .collection('grades')
        .where('userid', isEqualTo: prefs!.getString("id"))
        .where('course_id', isEqualTo: widget.course_id)
        .snapshots();
    print(grade);

    setState(() {});
  }

  @override
  void initState() {
    fun();
    super.initState();
  }

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
          margin: EdgeInsets.only(top: 50),
          child: StreamBuilder(
            stream: grade,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return Container(
                        child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Report 1",
                            style: med_black_title,
                          ),
                          Text('${snapshot.data.docs[index].data()['rep1']}')
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
                          Text('${snapshot.data.docs[index].data()['rep2']}')
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
                          Text('${snapshot.data.docs[index].data()['rep3']}')
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Report 4",
                            style: med_black_title,
                          ),
                          Text('${snapshot.data.docs[index].data()['rep4']}')
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Total grades",
                        style: small_black_title,
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            "${int.parse(snapshot.data.docs[index].data()['rep1']) + int.parse(snapshot.data.docs[index].data()['rep2']) + int.parse(snapshot.data.docs[index].data()['rep3']) + int.parse(snapshot.data.docs[index].data()['rep4'])}",
                            style: med_white_bold,
                          ),
                          height: 40,
                          width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10)
                            ],
                            color: maincolor,
                            borderRadius: BorderRadius.circular(150),
                          )),
                    ]));
                    //       Container(
                    //           child: rep1.text.isNotEmpty &&
                    //                   rep2.text.isNotEmpty &&
                    //                   rep3.text.isNotEmpty &&
                    //                   rep4.text.isNotEmpty
                    //               ? Text(
                    //                   "${int.parse(rep1.text) + int.parse(rep2.text) + int.parse(rep3.text) + int.parse(rep4.text)}",
                    //                   style: med_white_bold,
                    //                 )
                    //               : Text(''),
                    //           height: 40,
                    //           width: 100,
                    //           alignment: Alignment.center,
                    //           decoration: BoxDecoration(
                    //             boxShadow: [
                    //               BoxShadow(
                    //                   color: Colors.black.withOpacity(0.1),
                    //                   blurRadius: 10)
                    //             ],
                    //             color: maincolor,
                    //             borderRadius: BorderRadius.circular(150),
                    //           )),
                    //     ],
                    //   ),
                    // );
                  },
                );
              } else {
                return Text('');
              }
            },
          ),
        ));
  }
}
