import 'package:flutter/cupertino.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/components/roundbutton.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class addAssignment extends StatefulWidget {
  const addAssignment({super.key});

  @override
  State<addAssignment> createState() => _addAssignmentState();
}

class _addAssignmentState extends State<addAssignment> {
  DateTime _dateTime = DateTime.now();

  void _showDatepicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        _dateTime = value!;
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
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: maincolor),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Assignment',
                        style: sub_green_bold,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          color: maincolor,
                          child: InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height / 2,
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(
                              child: Container(
                                color: Colors.white,
                                margin: EdgeInsets.only(top: 20),
                                child: CustomListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.upload_file,
                                              size: 30,
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              'click to upload file ',
                                              style: med_black_title,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    color: Colors.white),
                              ),
                            ),
                            InkWell(
                              child: Container(
                                color: Colors.white,
                                margin: EdgeInsets.only(top: 20),
                                child: CustomListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.arrow_forward_ios_sharp,
                                                size: 20,
                                              ),
                                             
                                              Text(
                                                'assignment ',
                                                style: small_black_title,
                                              ),]),
                                        ),
                                           
                                            Expanded(
                                              flex: 1,
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.delete,
                                                  size: 30,
                                                  color: const Color.fromARGB(
                                                      255, 138, 51, 45),
                                                ),
                                                onPressed: () {
                                                  AwesomeDialog(
                                                    context: context,
                                                    dialogType:
                                                        DialogType.warning,
                                                    animType: AnimType.rightSlide,
                                                    title: 'Delete message',
                                                    desc:
                                                        'Are you sure you want to delete this assignment?',
                                                    btnOkColor: maincolor,
                                                    btnCancelColor: Colors.red,
                                                    btnOkOnPress: () {},
                                                    btnCancelOnPress: () {},
                                                  ).show();
                                                },
                                              ),
                                            )
                                      ]
                                    ),
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Due Date",
                                  style: sub_deepgreen_title,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(_dateTime.year.toString()+'-'+_dateTime.month.toString()+'-'+
                                    _dateTime.day.toString() ),
                                IconButton(
                                  onPressed: _showDatepicker,
                                  icon: Icon(Icons.date_range),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 80,
                            ),
                          ],
                        );
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundButton(
                        fun: () {},
                        label: Text(
                          'Cancle',
                          style: small_black_title,
                        ),
                        width: 100,
                        height: 40,
                        color: Colors.white),
                    const SizedBox(
                      width: 20,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
