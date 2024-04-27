import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/circular_reveal_clipper.dart';
import 'package:med_intern/components/recbutton.dart';
import 'package:med_intern/main.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class Rotation extends StatefulWidget {
  const Rotation({super.key});

  @override
  State<Rotation> createState() => _RotationState();
}

class _RotationState extends State<Rotation> {
  var SUPS;
  var users;
  var courses;

  fun1() {
    print('sunnnnnnnnnnnnnn');
    SUPS = FirebaseFirestore.instance
        .collection('users')
        .where('status', isEqualTo: "1")
        .where('roleid', isEqualTo: 'supervisor')
        .get()
        .then((value) {
      print('value.docs.length');
      selecteditems = value.docs[0].data()['name'];
      for (int i = 0; i < value.docs.length; i++) {
        print(value.docs[i].data()['name']);
        itemslist.add(value.docs[i].data()['name']);
      }
      setState(() {});
    });
    setState(() {});
  }

  fun2() {
    users = FirebaseFirestore.instance
        .collection('users')
        .where('status', isEqualTo: "1")
        .where('roleid', isEqualTo: 'user')
        .get()
        .then((value) {
      selecteditems1 = value.docs[0].data()['name'];
      for (int i = 0; i < value.docs.length; i++) {
        print(value.docs[i].data()['name']);
        itemslist1.add(value.docs[i].data()['name']);
      }
      setState(() {});
    });
    setState(() {});
  }

  bool finished = false;
  fun3() {
    courses =
        FirebaseFirestore.instance.collection('courses').get().then((value) {
      selecteditems3 = value.docs[0].data()['title'];
      for (int i = 0; i < value.docs.length; i++) {
        print(value.docs[i].data()['title']);
        itemslist3.add(value.docs[i].data()['title']);
        if (i == value.docs.length - 1) {
          finished = true;
        }
      }
      setState(() {});
    });
    ;

    setState(() {});
  }

  List<String> itemslist = [' '];
  String? selecteditems = ' ';
  //////////////
  ///
  List<String> itemslist1 = [' '];
  String? selecteditems1 = ' ';
  ////
  List<String> itemslist2 = ['one month', 'tow months'];
  String? selecteditems2 = 'one month';

  ///
  List<String> itemslist3 = [' '];
  String? selecteditems3 = ' ';
  @override
  void initState() {
    fun1();
    fun2();
    fun3();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: finished==false
          ? Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: maincolor,
                ),
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
                        child: Text(
                          "Rotation",
                          style: sub_deepgreen_bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Supervisor name",
                            style: med_green_title,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          DropdownButton<dynamic>(
                            elevation: 30,
                            style: (med_black_title),
                            value: selecteditems,
                            items: itemslist
                                .map((items) => DropdownMenuItem(
                                    value: items,
                                    child: Text(
                                      items,
                                    )))
                                .toList(),
                            onChanged: (items) {
                              setState(() {
                                selecteditems = items;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Text(
                            "Intern Name",
                            style: med_green_title,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          DropdownButton<String>(
                            elevation: 30,
                            style: (med_black_title),
                            value: selecteditems1,
                            items: itemslist1
                                .map((items) => DropdownMenuItem(
                                    value: items,
                                    child: Text(
                                      items,
                                    )))
                                .toList(),
                            onChanged: (items) {
                              setState(() {
                                selecteditems1 = items;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Text(
                            "Period ",
                            style: med_green_title,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          DropdownButton<String>(
                            elevation: 30,
                            style: (med_black_title),
                            value: selecteditems2,
                            items: itemslist2
                                .map((items) => DropdownMenuItem(
                                    value: items,
                                    child: Text(
                                      items,
                                    )))
                                .toList(),
                            onChanged: (items) {
                              setState(() {
                                selecteditems2 = items;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Text(
                            "Course ",
                            style: med_green_title,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          DropdownButton<dynamic>(
                            elevation: 30,
                            style: (med_black_title),
                            value: selecteditems3,
                            items: itemslist3
                                .map((items) => DropdownMenuItem(
                                    value: items,
                                    child: Text(
                                      items,
                                    )))
                                .toList(),
                            onChanged: (items) {
                              setState(() {
                                selecteditems3 = items;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Center(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RecButton(
                                    label: Text(
                                      "Cancel",
                                      style: TextStyle(color: maincolor),
                                    ),
                                    width: 100,
                                    height: 40,
                                    color: Colors.white),
                                SizedBox(
                                  width: 20,
                                ),
                                RecButton(
                                    fun: () async {
                                      await FirebaseFirestore.instance
                                          .collection('rotation')
                                          .add({
                                        "super": selecteditems,
                                        "user": selecteditems1,
                                        "period": selecteditems2,
                                        "course": selecteditems3,
                                      }).then((value) =>
                                              Navigator.of(context).pop());
                                    },
                                    label: Text(
                                      "Next",
                                      style: med_white_title,
                                    ),
                                    width: 100,
                                    height: 40,
                                    color: maincolor)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
