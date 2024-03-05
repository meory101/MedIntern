import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/components/recbutton.dart';
import 'package:med_intern/components/roundbutton.dart';
import 'package:med_intern/components/textform.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final TextEditingController con = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: MainAppBar(
          title: 'Report 4',
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
