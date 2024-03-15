import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class CourseMaterial extends StatefulWidget {
  const CourseMaterial({super.key});

  @override
  State<CourseMaterial> createState() => _CourseMaterialState();
}

class _CourseMaterialState extends State<CourseMaterial> {
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
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: maincolor),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Course Content',
                        style: sub_green_bold,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          color: maincolor,
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height / 2,
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(top: 20),
                          child: CustomListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.remove_red_eye,size: 30,),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'chapter $index',
                                        style: med_white_bold,
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    
                            icon: Icon(
                                      Icons.delete,
                                      size: 30,
                                      color: const Color.fromARGB(
                                          255, 138, 51, 45),
                                    ),
                                    onPressed: () {
                                       AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.warning,
                                        animType: AnimType.rightSlide,
                                        title: 'Delete message',
                                        desc:
                                            'Are you sure you want to delete this content?',
                                        btnOkColor: maincolor,
                                        btnCancelColor: Colors.red,
                                        btnOkOnPress: () {},
                                        btnCancelOnPress: () {},
                                      ).show();
                                    },
                                  )
                                ],
                              ),
                              color: light_box_color),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
