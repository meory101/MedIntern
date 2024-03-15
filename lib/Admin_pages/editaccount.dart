import 'package:flutter/material.dart';
import 'package:med_intern/components/recbutton.dart';
import 'package:med_intern/components/textform2.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({super.key});

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController idnumber = TextEditingController();
  final TextEditingController Mobilenumber = TextEditingController();
  final TextEditingController Email = TextEditingController();
  final TextEditingController password = TextEditingController();

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
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          'assets/images/logo.jpg',
                          fit: BoxFit.cover,
                          width: 80,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'name:',
                                    style: small_black_title,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'nour almuslim',
                                    style: small_deepgreen_title,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'ID:',
                                    style: small_black_title,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '22000004832',
                                    style: small_deepgreen_title,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: subcolor),
                    ),
                  ),
                  child: Text(
                    'Edit Account',
                    style: sub_deepgreen_bold,
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "First Name ",
                              style: med_green_title,
                          ),)
                        ),
                        Expanded(
                          flex: 2,
                          child: Textform2(
                            controller: firstname,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Last Name ",
                              style: med_green_title,)
                          ),
                        ),
                        Expanded(
                            flex: 2, child: Textform2(controller: lastname))
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "ID Number  ",
                              style: med_green_title,
                          ),
                        ),),
                        Expanded(
                          flex: 2,
                          child: Textform2(controller: idnumber))
                        
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Mobile Number",
                              style: med_green_title,
                          ),
                        ),),
                        Expanded(
                          flex: 2,
                          child: Textform2(controller: Mobilenumber),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Email            ",
                              style: med_green_title,
                          ),
                        ),),
                        Expanded(
                          flex: 2,
                          child: Textform2(controller: Email),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Password",
                              style: med_green_title,
                          ),
                        ),),
                        Expanded(
                          flex: 2,
                          child: Textform2(controller: password),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RecButton(
                              label: Text(
                                "Cancel",
                                style: med_green_title,
                              ),
                               width: 100,
                              height: 40,
                              color: Colors.white),
                          SizedBox(
                            width: 20,
                          ),
                          RecButton(
                              label: Text(
                                "update",
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
            )),
      ),
    ));
  }
}
