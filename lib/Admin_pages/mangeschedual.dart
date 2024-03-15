import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/list.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class Mangeschedual extends StatefulWidget {
  const Mangeschedual({super.key});

  @override
  State<Mangeschedual> createState() => _MangeschedualState();
}

class _MangeschedualState extends State<Mangeschedual> {
  DeleteRotation() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.rightSlide,
      title: 'Delete message',
      desc: 'Are you sure you want to delete this rotation?',
      btnOkColor: maincolor,
      btnCancelColor: Colors.red,
      btnOkOnPress: () {},
      btnCancelOnPress: () {},
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/logo.jpg',
                  fit: BoxFit.cover,
                  width: 80,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 40, top: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: subcolor),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Mange Schedual",
                        style: sub_deepgreen_bold,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              "Add Rotation",
                              style: small_green_title,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                color: maincolor,
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CustomList(
                title: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed("rotation");
                  },
                  child: Text("rotation 1", style: med_white_bold),
                ),
                color: light_box_color,
                icon: IconButton(
                    onPressed: DeleteRotation,
                    icon: const Icon(Icons.delete_forever)),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomList(
                title: Text("rotation 2", style: med_white_bold),
                color: light_box_color,
                icon: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.delete_forever)),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomList(
                title: Text("rotation 3", style: med_white_bold),
                color: light_box_color,
                icon: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.delete_forever)),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomList(
                title: Text("rotation 4", style: med_white_bold),
                color: light_box_color,
                icon: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.delete_forever)),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomList(
                title: Text("rotation 5", style: med_white_bold),
                color: light_box_color,
                icon: IconButton(
                    onPressed: DeleteRotation,
                    icon: const Icon(Icons.delete_forever)),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
