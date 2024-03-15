import 'package:flutter/material.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/supervisor_drawer.dart';
import 'package:med_intern/theme/fonts.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: MainAppBar(
          showimage: false,
          color: Colors.transparent,
          title: '',
        ),
      ),
      drawer: SupervisorDrawer(),
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
                    'Ibrahem ',
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
