import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/Admin_pages/rotation.dart';
import 'package:med_intern/components/list.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class Mangeschedual extends StatefulWidget {
  const Mangeschedual({super.key});

  @override
  State<Mangeschedual> createState() => _MangeschedualState();
}

class _MangeschedualState extends State<Mangeschedual> {
  var rotations;
  fun1() {
    print('sunnnnnnnnnnnnnn');
    rotations = FirebaseFirestore.instance.collection('rotation').snapshots();

    setState(() {});
  }

  @override
  void initState() {
    fun1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/logo.jpg',
                  fit: BoxFit.cover,
                  width: 80,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 40, top: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: subcolor),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Mange Schedual",
                        style: sub_deepgreen_bold,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return const Rotation();
                            },
                          ));
                        },
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                "Add Rotation",
                                style: small_green_title,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  color: maincolor,
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height / 2,
                  child: StreamBuilder(
                    stream: rotations,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          margin: const EdgeInsets.only(top: 50),
                          child: ListView.builder(
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                child: CustomList(
                                  title: InkWell(
                                    onTap: () {},
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "course: ${snapshot.data.docs[index].data()['course']}",
                                            style: med_white_bold),
                                        Text(
                                            "${snapshot.data.docs[index].data()['period']}",
                                            style: med_white_bold),
                                      ],
                                    ),
                                  ),
                                  color: light_box_color,
                                  icon: IconButton(
                                      onPressed: () {
                                        AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.warning,
                                          animType: AnimType.rightSlide,
                                          title: 'Delete message',
                                          desc:
                                              'Are you sure you want to delete this rotation?',
                                          btnOkColor: maincolor,
                                          btnCancelColor: Colors.red,
                                          btnOkOnPress: () async {
                                            await FirebaseFirestore.instance
                                                .collection('rotation')
                                                .doc(snapshot.data.docs[index]
                                                    .reference.id)
                                                .delete();
                                          },
                                          btnCancelOnPress: () {},
                                        ).show();
                                      },
                                      icon: const Icon(Icons.delete_forever)),
                                ),
                              );
                            },
                          ),
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
                        return const Center(
                          child: Text('no data'),
                        );
                      }
                    },
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
