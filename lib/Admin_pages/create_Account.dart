import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/Admin_pages/manage_account.dart';
import 'package:med_intern/auth_pages/login.dart';
import 'package:med_intern/auth_pages/register%20(2).dart';
import 'package:med_intern/components/recbutton.dart';
import 'package:med_intern/components/textform2.dart';
import 'package:med_intern/main.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class createAccount extends StatefulWidget {
  const createAccount({super.key});

  @override
  State<createAccount> createState() => _createAccountState();
}

class _createAccountState extends State<createAccount> {
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController idnumber = TextEditingController();
  final TextEditingController Mobilenumber = TextEditingController();
  final TextEditingController Email = TextEditingController();
  final TextEditingController password = TextEditingController();
  List<String> itemslist = ['supervisor', 'user'];
  String? selecteditems = 'user';
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Form(
              key: formkey,
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
                        Expanded(flex: 3, child: Column(children: []))
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
                      'Create Account',
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
                                ),
                              )),
                          Expanded(
                            flex: 2,
                            child: Textform2(
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return 'rquired';
                                }
                              },
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
                                  style: med_green_title,
                                )),
                          ),
                          Expanded(
                              flex: 2,
                              child: Textform2(
                                  validator: (p0) {
                                    if (p0!.isEmpty) {
                                      return 'rquired';
                                    }
                                  },
                                  controller: lastname))
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
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Textform2(
                                  validator: (p0) {
                                    if (p0!.isEmpty) {
                                      return 'rquired';
                                    }
                                  },
                                  controller: idnumber))
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
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Textform2(
                                validator: (p0) {
                                  if (p0!.isEmpty) {
                                    return 'rquired';
                                  }
                                },
                                controller: Mobilenumber),
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
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Textform2(
                              controller: Email,
                              validator: (p0) {
                                print(p0);
                                if (p0 != null && p0.isNotEmpty) {
                                  if (!p0.CheckEmail()) {
                                    return "enter valid email";
                                  }
                                } else {
                                  return 'rquired';
                                }
                              },
                            ),
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
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Textform2(
                              controller: password,
                              validator: (p0) {
                                if (p0 != null) {
                                  print(p0.length);
                                  if (p0.IsPassword()) {
                                    print('less');
                                    return "min 6";
                                  }
                                } else {
                                  return 'rquired';
                                }
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Row(children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Accoont type",
                                  style: med_green_title,
                                ),
                              ),
                            ),
                            DropdownButton<String>(
                              dropdownColor: Colors.white,
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
                          ])
                        ],
                      ),
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
                                fun: () {
                                  Navigator.pop(context);
                                },
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
                                fun: () async {
                                  if (formkey.currentState!.validate() &&
                                      selecteditems != null) {
                                    await FirebaseFirestore.instance
                                        .collection('users')
                                        .add({
                                      "name": "${firstname.text}" +
                                          "${lastname.text}"
                                              .replaceAll(" ", ""),
                                      "email": "${Email.text}".replaceAll(" ", ""),
                                      "password": "${password.text}".replaceAll(" ", ""),
                                      "status": "1",
                                      "roleid": selecteditems
                                    }).then((value) {
                                      print(value);
                                      Navigator.of(context).pop();
                                    });
                                  } else if (selecteditems == null) {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.warning,
                                      animType: AnimType.rightSlide,
                                      desc: 'PLease enter data',
                                    )..show();
                                  }

                                  // if (selectedtype == 0) {
                                  //   print('kk');
                                  //   prefs!.setString("role", "user");
                                  // } else if (selectedtype == 1) {
                                  //   prefs!.setString("role", "super");
                                  // }
                                  // Future.delayed(Duration(milliseconds: 1000));
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //   builder: (context) {
                                  //     return LogIn();
                                  //   },
                                  // ));
                                  // }).catchError((_) {
                                  //   print("an error occured");
                                  // });
                                },
                                label: Text(
                                  "Create",
                                  style: med_white_title,
                                ),
                                width: 100,
                                height: 40,
                                color: maincolor),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    ));
  }
}
