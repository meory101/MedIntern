import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/components/roundbutton.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class RecordAttendace extends StatefulWidget {
  const RecordAttendace({super.key});

  @override
  State<RecordAttendace> createState() => _RecordAttendaceState();
}

class _RecordAttendaceState extends State<RecordAttendace> {
  @override
  Widget build(BuildContext context) {
    RecordAttendance() {
      // if recorded
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'Confirmation message',
        desc: 'Your attendance recorded successfully',
      )..show();
      //else
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Confirmation message',
        desc:
            'Your attendance can\'t be recorded because you are not in the hospital area',
      )..show();
    }

    return Scaffold(
      drawer: MainDrawer(),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: MainAppBar(
            title: 'Record attendance',
          )),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      'Date:',
                      style: small_white_title,
                    ),
                    Text(
                      '20-11-2023',
                      style: small_black_title,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Time:',
                      style: small_white_title,
                    ),
                    Text(
                      '7:48',
                      style: small_black_title,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: RoundButton(
                  fun: RecordAttendance,
                  label: Text(
                    'Record attendance',
                    style: small_white_title,
                  ),
                  width: 200,
                  height: 40,
                  color: subcolor),
            )
          ]),
        ),
      ),
    );
  }
}
