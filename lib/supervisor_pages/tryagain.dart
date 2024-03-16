import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/roundbutton.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class tryagain extends StatefulWidget {
  const tryagain({super.key});

  @override
  State<tryagain> createState() => _tryagainState();
}

class _tryagainState extends State<tryagain> {
  @override
  Widget build(BuildContext context) {
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
        SizedBox(
          height: 30,
        ),
        Container(
          width: double.infinity,
          height: 400,
          child: Image(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/tryagain.jpg")),
        ),
        Center(
          child: RoundButton(
              fun: () {
                Navigator.of(context).pushNamed("sendcall");
              },
              label: Text(
                'try again',
                style: small_white_title,
              ),
              width: 100,
              height: 40,
              color: maincolor),
        ),
      ]),
    ))));
  }
}
