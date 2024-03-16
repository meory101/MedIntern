import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/roundbutton.dart';
import 'package:med_intern/components/textform.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class sendcall extends StatefulWidget {
  const sendcall({super.key});

  @override
  State<sendcall> createState() => _sendcallState();
}

class _sendcallState extends State<sendcall> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController title = TextEditingController();
    final TextEditingController content = TextEditingController();
    return Scaffold(
        body: SafeArea(
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: maincolor, spreadRadius: 1, blurRadius: 2)
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
                        fun: () {
                          Navigator.of(context).pushNamed("tryagain");
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
    ))));
  }
}
