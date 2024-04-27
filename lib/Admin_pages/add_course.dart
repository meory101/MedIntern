import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/Admin_pages/Admin_bottom_appbar.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/components/recbutton.dart';
import 'package:med_intern/components/roundbutton.dart';
import 'package:med_intern/components/textform.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class AddCourse extends StatefulWidget {
  const AddCourse({super.key});

  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  File? file;

  @override
  void initState() {
    fun();
    super.initState();
  }

  final TextEditingController title = TextEditingController();
  final TextEditingController link = TextEditingController();
  final GlobalKey<FormState> fkey = GlobalKey();
  List<String> itemslist = ['supervisor', 'user'];
  String? selecteditems = 'user';
  String? superid;
  var supers;
  fun() {
    supers = FirebaseFirestore.instance
        .collection('users')
        .where('status', isEqualTo: "1")
        .where('roleid', isEqualTo: "supervisor")
        .snapshots();
    print(supers);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    AddCourse() async {
      if (fkey.currentState!.validate() && superid != null && file != null) {
       
        var ref = await FirebaseStorage.instance
            .ref('files')
            .child(basename(file!.path));
        await ref.putFile(file!);

        var url = await ref.getDownloadURL();
        await FirebaseFirestore.instance
            .collection('courses')
            .add({"title": title.text, "link": url, "superid": superid}).then(
                (value) {
          Navigator.of(context).pop();
        });
      } else {
        return AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.rightSlide,
          title: '',
          desc: 'all fields are required',
        )..show();
      }
    }

    return Scaffold(
      drawer: const MainDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: MainAppBar(
          title: 'Courses',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(color: maincolor, spreadRadius: 1, blurRadius: 2)
                ]),
            child: Form(
              key: fkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New Course',
                    style: sub_green_bold,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Textform(
                      val: (p0) {
                        if (p0 != null && p0.isNotEmpty) {
                        } else {
                          return 'rquired';
                        }
                        return null;
                      },
                      controller: title,
                      text: 'title',
                      textInputType: TextInputType.text,
                      obscure: false,
                      color: Colors.white,
                      height: 60,
                      width: double.infinity),
                  const SizedBox(
                    height: 10,
                  ),
                  RecButton(
                      fun: () async {
                        // var image;
                        // image = await ImagePicker.platform
                        //     .pickImage(source: ImageSource.gallery);
                        // if (image != null) {
                        //   file = File(image.path);
                        //   setState(() {});
                        // }
                        FilePickerResult? result = await FilePicker.platform
                            .pickFiles(allowMultiple: false);

                        if (result != null) {
                          List<File> files =
                              result.paths.map((path) => File(path!)).toList();

                          file = files.first;
                        } else {}
                      },
                      label: Text(
                        'upload course',
                        style: file != null
                            ? small_white_title
                            : small_dark_grey_title,
                      ),
                      color: file != null ? maincolor : Colors.white,
                      height: 60,
                      width: double.infinity),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        'select supervisor... ',
                        style: small_black_title,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          child: StreamBuilder(
                            stream: supers,
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return Container(
                                  margin: const EdgeInsets.only(top: 50),
                                  child: ListView.builder(
                                    itemCount: snapshot.data.docs.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 20),
                                        child: CustomListTile(
                                          icon: CircleAvatar(
                                            backgroundColor: snapshot
                                                        .data
                                                        .docs[index]
                                                        .reference
                                                        .id ==
                                                    superid
                                                ? const Color.fromARGB(
                                                    255, 121, 37, 31)
                                                : subcolor,
                                            child: IconButton(
                                              onPressed: () {
                                                print(
                                                    '${snapshot.data.docs[index].reference.id}');
                                                superid =
                                                    '${snapshot.data.docs[index].reference.id}';
                                                setState(() {});
                                                AwesomeDialog(
                                                  context: context,
                                                  dialogType:
                                                      DialogType.success,
                                                  animType: AnimType.rightSlide,
                                                  title: '',
                                                  desc:
                                                      'supervisor is selected',
                                                ).show();
                                              },
                                              icon: const Icon(
                                                Icons.done_all_sharp,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          color: light_box_color,
                                          title: Text(
                                            '${snapshot.data.docs[index].data()['email']}',
                                            style: small_white_title,
                                          ),
                                          subtitle: Text(
                                              '${snapshot.data.docs[index].data()['roleid']}',
                                              style: esmall_dark_grey_title),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              } else if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: CircularProgressIndicator(
                                      color: maincolor,
                                    ),
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: Text('no accounts'),
                                );
                              }
                            },
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundButton(
                          fun: () {
                            Navigator.of(context).pop();
                          },
                          label: Text(
                            'Cancle',
                            style: small_black_title,
                          ),
                          width: 100,
                          height: 40,
                          color: Colors.white),
                      const SizedBox(
                        width: 20,
                      ),
                      RoundButton(
                          fun: AddCourse,
                          label: Text(
                            'Submit',
                            style: small_white_title,
                          ),
                          width: 100,
                          height: 40,
                          color: maincolor),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
