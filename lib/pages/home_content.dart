import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/main_drawer.dart';
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
        iconTheme: IconThemeData(color: maincolor, size: 50),
      ),
      drawer: MainDrawer(),
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
                    style: sub_black_bold,
                  ),
                  Text(
                    'Ali ',
                    style: sub_deepgreen_bold,
                  ),
                  Text(
                    'Welcome to',
                    style: sub_black_bold,
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
