import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/theme/colors.dart';

class EditableAnnounc extends StatefulWidget {
  final Widget title;
  EditableAnnounc({
    required this.title,
  });

  @override
  State<EditableAnnounc> createState() => _EditableAnnouncState();
}

class _EditableAnnouncState extends State<EditableAnnounc> {
  DeleteAnnounc() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.rightSlide,
      title: 'Delete message',
      desc: 'Are you sure you want to delete this announcment?',
      btnOkColor: maincolor,
      btnCancelColor: Colors.red,
      btnOkOnPress: () {},
      btnCancelOnPress: () {},
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: light_box_color),
      child: ListTile(
        title: Row(
          children: [
            Expanded(flex: 3, child: widget.title),
            Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: subcolor,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: DeleteAnnounc,
                        icon: Icon(
                          Icons.delete,
                          color: const Color.fromARGB(255, 138, 51, 45),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
