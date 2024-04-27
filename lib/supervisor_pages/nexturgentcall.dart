import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/roundbutton.dart';
import 'package:med_intern/components/textform.dart';
import 'package:med_intern/main.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class sendcall extends StatefulWidget {
  var selectedtype;
    sendcall({required this.selectedtype});

  @override
  State<sendcall> createState() => _sendcallState();
}

class _sendcallState extends State<sendcall> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController title = TextEditingController();
    final TextEditingController content = TextEditingController();
    GlobalKey<FormState> formkey = GlobalKey();

    return Scaffold(
        body: Form(
      key: formkey,
      child: SafeArea(
          child: SingleChildScrollView(
              child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: double.infinity,
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/images/logo.jpg',
              fit: BoxFit.cover,
              width: 80,
            ),
          ),
          Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: maincolor, spreadRadius: 1, blurRadius: 2)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Send urgent call',
                      style: sub_green_bold,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Textform(
                        val: (p0) {
                          if (p0 != null && p0.isNotEmpty) {
                            if (!p0.CheckName()) {
                              return "enter valid title ";
                            }
                          } else {
                            return 'rquired';
                          }
                        },
                        controller: title,
                        text: 'title',
                        textInputType: TextInputType.text,
                        obscure: false,
                        color: Colors.white,
                        height: 60,
                        width: double.infinity),
                    const SizedBox(
                      height: 10,
                    ),
                    Textform(
                        val: (p0) {
                          if (p0 != null && p0.isNotEmpty) {
                            if (!p0.CheckName()) {
                              return "enter valid content  ";
                            }
                          } else {
                            return 'rquired';
                          }
                        },
                        controller: content,
                        text: 'content',
                        textInputType: TextInputType.text,
                        obscure: false,
                        color: Colors.white,
                        height: 60,
                        width: double.infinity),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: RoundButton(
                          fun: () async {
                            if (formkey.currentState!.validate()) {
                              await FirebaseFirestore.instance
                                  .collection('sendurgentcall')
                                  .add({
                                "title": "${title.text}",
                                "date": "${DateTime.now()}",
                                "content":
                                    "${content.text}".replaceAll(" ", ""),
                                    "userid" : widget.selectedtype.toString()
                              }).then((value) {
                                print(value);
                                Navigator.of(context).pop();
                              });
                            } else if (content.text.isEmpty&& title.text.isNotEmpty) {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.warning,
                                animType: AnimType.rightSlide,
                                desc: 'PLease enter data',
                              )..show();
                            }
                            // Navigator.of(context).pushNamed("try/again");
                          },
                          label: Text(
                            'send call',
                            style: small_white_title,
                          ),
                          width: 100,
                          height: 40,
                          color: maincolor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ))),
    ));
  }
}
