import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/Admin_pages/Admin_bottom_appbar.dart';
import 'package:med_intern/Admin_pages/manage_account.dart';
import 'package:med_intern/components/recbutton.dart';
import 'package:med_intern/components/textform2.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class EditAccount extends StatefulWidget {
  var data;
  String docid;
  EditAccount({required this.data, required this.docid});
  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController firstname =
        TextEditingController(text: widget.data['name']);
    final TextEditingController Email =
        TextEditingController(text: widget.data['email']);
    final TextEditingController password =
        TextEditingController(text: widget.data['password']);
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
                                    '',
                                    style: small_black_title,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '',
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
                                    '',
                                    style: small_black_title,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '',
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
                                "Name ",
                                style: small_black_title,
                              ),
                            )),
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
                              "Email            ",
                              style: small_black_title,
                            ),
                          ),
                        ),
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
                              style: small_black_title,
                            ),
                          ),
                        ),
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
                                style: small_black_title,
                              ),
                              width: 100,
                              height: 40,
                              color: Colors.white),
                          SizedBox(
                            width: 20,
                          ),
                          RecButton(
                              fun: () {
                                print(widget.docid);
                                FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(widget.docid)
                                    .set({
                                  "name":
                                      "${firstname.text}".replaceAll(" ", ""),
                                  "email": "${Email.text}".replaceAll(" ", ""),
                                  "password":
                                      "${password.text}".replaceAll(" ", ""),
                                }, SetOptions(merge: true)).then((value) =>
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) {
                                            return Adminbottomappbar();
                                          },
                                        )));
                              },
                              label: Text(
                                "update",
                                style: small_black_title,
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
