import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/recbutton.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Navigation Drawer"),
        iconTheme: IconThemeData(color: maincolor, size: 50),
      ),
      drawer: Drawer(
        backgroundColor: maincolor,
        width: MediaQuery.of(context).size.width / 2.5,
        child: ListView(
          padding: EdgeInsets.all(4),
          children: [
            SizedBox(
              height: 60,
            ),
            RecButton(
                label: Text(
                  'Contact us',
                  style: small_black_title,
                ),
                width: MediaQuery.of(context).size.width / 3 - 20,
                height: 50,
                color: boxcolor),
            SizedBox(
              height: 20,
            ),
            RecButton(
                label: Text(
                  'Courses',
                  style: small_black_title,
                ),
                width: MediaQuery.of(context).size.width / 3 - 20,
                height: 50,
                color: boxcolor),
            SizedBox(
              height: 20,
            ),
            RecButton(
                label: Text(
                  'Schedule',
                  style: small_black_title,
                ),
                width: MediaQuery.of(context).size.width / 3 - 20,
                height: 50,
                color: boxcolor),
            SizedBox(
              height: 20,
            ),
            RecButton(
                label: Text(
                  'announcement',
                  style: small_black_title,
                ),
                width: MediaQuery.of(context).size.width / 3 - 20,
                height: 50,
                color: boxcolor),
            SizedBox(
              height: 20,
            ),
            RecButton(
                label: Text(
                  'logout',
                  style: small_black_title,
                ),
                width: MediaQuery.of(context).size.width / 3 - 20,
                height: 50,
                color: boxcolor)
          ],
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hello ',
                    style: sub_black_title,
                  ),
                  Text(
                    'Ali ',
                    style: sub_deepgreen_title,
                  ),
                  Text(
                    'Welcome to',
                    style: sub_black_title,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                height: MediaQuery.of(context).size.height / 5,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      "assets/images/logo.jpg",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
