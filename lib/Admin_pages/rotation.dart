import 'package:flutter/material.dart';
import 'package:med_intern/components/recbutton.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class Rotation extends StatefulWidget {
  const Rotation({super.key});

  @override
  State<Rotation> createState() => _RotationState();
}

class _RotationState extends State<Rotation> {
  List<String> itemslist = ['Dr.ahmed', 'Dr.khaled'];
  String? selecteditems = 'Dr.ahmed';
  //////////////
  ///
  List<String> itemslist1 = ['noor almuslim', 'shahad'];
  String? selecteditems1 = 'shahad';
  ////
  List<String> itemslist2 = ['one month', 'tow months'];
  String? selecteditems2 = 'one month';

  ///
  List<String> itemslist3 = ['child hood', 'pediatric emergency'];
  String? selecteditems3 = 'pediatric emergency';
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
                  child: Text(
                    "Rotation 1",
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
                    DropdownButton<String>(
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
                    DropdownButton<String>(
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
