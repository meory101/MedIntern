import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/components/roundbutton.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class internAttendance extends StatefulWidget {
  const internAttendance({super.key});

  @override
  State<internAttendance> createState() => _internAttendanceState();
}

class _internAttendanceState extends State<internAttendance> {
  DateTime _dateTime = DateTime.now();
  bool val = false;
  void _showDatepicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        if (value == null) {
          _dateTime = DateTime.now();
        } else {
          _dateTime = value;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: MainAppBar(
          title: 'Childhood diseases',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(color: maincolor),
                      ),
                    ),
                    child: Text(
                      'Intern Attendance',
                      style: sub_green_bold,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Monday', style: small_dark_grey_title),
                        Text('26/1/2024', style: small_dark_grey_title),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  Text(
                    "Search By Date: ",
                    style: small_deepgreen_title,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    _dateTime.year.toString() +
                        '-' +
                        _dateTime.month.toString() +
                        '-' +
                        _dateTime.day.toString(),
                    style: small_black_title,
                  ),
                  IconButton(
                    onPressed: _showDatepicker,
                    icon: Icon(Icons.date_range),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 100,
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(
                              top: 10,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 13),
                            decoration: BoxDecoration(
                              color: light_box_color,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Text(
                                        'name',
                                        style: small_dark_grey_title,
                                      ),
                                      const SizedBox(
                                        height: 13,
                                      ),
                                      Text(
                                        'nour',
                                        style: med_white_bold,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Text(
                                        'ID',
                                        style: small_dark_grey_title,
                                      ),
                                      const SizedBox(
                                        height: 13,
                                      ),
                                      Text(
                                        '022333221',
                                        style: med_white_bold,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Text(
                                        'status',
                                        style: small_dark_grey_title,
                                      ),
                                      CircleAvatar(
                                        backgroundColor: subcolor,
                                        child: Checkbox(
                                          value: val,
                                          onChanged: (value) {
                                            setState(() {
                                              val = value!;
                                            });
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Text(
                                        'arrived time',
                                        style: small_dark_grey_title,
                                      ),
                                      Text(
                                        "8:05 am",
                                        style: med_white_bold,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 100,
                        ),
                        RoundButton(
                            fun: () {},
                            label: Text(
                              'Submit',
                              style: small_white_title,
                            ),
                            width: 100,
                            height: 40,
                            color: maincolor),
                      ],
                    );
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
