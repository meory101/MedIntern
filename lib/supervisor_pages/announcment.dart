import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/editable_announcment.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/components/recbutton.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class SupAnnouncments extends StatefulWidget {
  @override
  State<SupAnnouncments> createState() => _SupAnnouncmentsState();
}

class _SupAnnouncmentsState extends State<SupAnnouncments> {
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
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                'My Announcments',
                style: sub_green_bold,
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: MediaQuery.of(context).size.height / 2,
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return EditableAnnounc(
                        title: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.light,
                                color: subcolor,
                              ),
                            ),
                            Text(
                              'tomorrow\'s meeting',
                              style: small_black_title,
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 50,
              ),
              RecButton(
                  fun: () {
                    Navigator.of(context).pushNamed('createannouncment');
                  },
                  label: Text(
                    'Create Announcment',
                    style: med_white_bold,
                  ),
                  width: double.infinity,
                  height: 50,
                  color: maincolor)
            ],
          ),
        ),
      ),
    );
  }
}
