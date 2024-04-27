import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/components/recbutton.dart';
import 'package:med_intern/components/roundbutton.dart';
import 'package:med_intern/components/textform.dart';
import 'package:med_intern/main.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final TextEditingController con = TextEditingController();
  File ?file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: MainAppBar(
          title: 'Report',
        ),
      ),
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 13),
        decoration: BoxDecoration(
          color: light_box_color,
        ),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'Comments',
              style: med_black_title,
            ),
            SizedBox(
              height: 10,
            ),
            Textform(
                controller: con,
                text: 'add your comment here...',
                textInputType: TextInputType.text,
                obscure: false,
                color: Colors.white,
                height: MediaQuery.of(context).size.height / 3,
                width: double.infinity),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: RecButton(
                fun: () async{
                      FilePickerResult? result = await FilePicker.platform
                            .pickFiles(allowMultiple: false);

                        if (result != null) {
                          List<File> files =
                              result.paths.map((path) => File(path!)).toList();

                          file = files.first;
                        } else {}
                },
                  label: Text('Upload file'),
                  width: 160,
                  height: 40,
                  color: subcolor),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: RoundButton(
                  fun: () {
                  if(con.text.isNotEmpty && file!=null){
                      FirebaseFirestore.instance.collection('report').add({
                        "report": con.text,
                        "userid": prefs!.getString('userid')
                      }).then((value) => Navigator.of(context).pop());
                  }else{
                         AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'all fields are required',
                      )..show();
                  }
                  },
                  label: Text('Submit'),
                  width: 100,
                  height: 40,
                  color: Colors.white),
            )
          ]),
        ),
      ),
    );
  }
}
