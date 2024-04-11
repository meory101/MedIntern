import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/supervisor_pages/edit_announcment.dart';
import 'package:med_intern/theme/colors.dart';

class EditableAnnounc extends StatefulWidget {
  final Widget title;
  final String atitle;
  final String acontent;
  final String aid;

  EditableAnnounc(
      {required this.title,
      required this.atitle,
      required this.acontent,
      required this.aid});

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
      btnOkOnPress: () async {
        await FirebaseFirestore.instance.collection('announcments')
          ..doc(widget.aid).delete().then((_) {
            print("an error occured");
          });
      },
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
            Expanded(
                flex: 3,
                child: Text(
                  '${widget.atitle}',
                  style: TextStyle(overflow: TextOverflow.ellipsis),
                )),
            Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return EditAnnouncment(
                                  id: widget.aid,
                                  content: widget.acontent,
                                  title: widget.atitle);
                            },
                          ));
                        },
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
