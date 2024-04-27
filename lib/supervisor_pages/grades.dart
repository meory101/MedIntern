import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/components/recbutton.dart';
import 'package:med_intern/components/textform.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class grades extends StatefulWidget {
  String course_id;
  grades({super.key, required this.course_id});
  @override
  State<grades> createState() => _gradesState();
}

class _gradesState extends State<grades> {
  TextEditingController rep1 = TextEditingController(text: "0");
  TextEditingController rep2 = TextEditingController(text: "0");
  TextEditingController rep3 = TextEditingController(text: "0");
  TextEditingController rep4 = TextEditingController(text: "0");

  @override
  void initState() {
    fun();
    super.initState();
  }

  final TextEditingController title = TextEditingController();
  final TextEditingController link = TextEditingController();
  final GlobalKey<FormState> fkey = GlobalKey();

  String? userid;
  var users;
  fun() {
    users = FirebaseFirestore.instance
        .collection('users')
        .where('status', isEqualTo: "1")
        .where('roleid', isEqualTo: "user")
        .snapshots();
    print(users);

    setState(() {});
  }

  AddGrade() async {
    await FirebaseFirestore.instance.collection('grades').add({
      "rep1": rep1.text,
      "rep2": rep2.text,
      "rep3": rep3.text,
      "rep4": rep4.text,
      "userid": userid.toString(),
      "course_id": widget.course_id
    }).then((_) {
      Navigator.of(context).pop();
    }).catchError((_) {
      print("an error occured");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: MainAppBar(
          title: 'Grade',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SizedBox(
              height: 30,
              width: 400,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Grade Details',
                    style: sub_black_title,
                  ),
                  Text(
                    'check grade details..!',
                    style: small_grey_title,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: StreamBuilder(
                  stream: users,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: CustomListTile(
                                icon: CircleAvatar(
                                  backgroundColor: subcolor,
                                  child: IconButton(
                                    onPressed: () {
                                      print(
                                          '${snapshot.data.docs[index].reference.id}');
                                      userid =
                                          '${snapshot.data.docs[index].reference.id}';
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.success,
                                        animType: AnimType.rightSlide,
                                        btnOkColor: maincolor,
                                        title: '',
                                        desc: 'student is selected',
                                      ).show();
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.done_all_sharp,
                                      color: snapshot.data.docs[index].reference
                                                  .id ==
                                              userid
                                          ? Colors.red
                                          : Colors.white,
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
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Report 1",
                  style: med_black_title,
                ),
                Textform(
                    onChanged: (p0) {
                      setState(() {});
                    },
                    controller: rep1,
                    text: 'enter',
                    textInputType: TextInputType.number,
                    obscure: false,
                    color: Colors.white,
                    height: 40,
                    width: 100)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Report 2",
                  style: med_black_title,
                ),
                Textform(
                    onChanged: (p0) {
                      setState(() {});
                    },
                    controller: rep2,
                    text: 'enter',
                    textInputType: TextInputType.number,
                    obscure: false,
                    color: Colors.white,
                    height: 40,
                    width: 100)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Report 3",
                  style: med_black_title,
                ),
                Textform(
                    onChanged: (p0) {
                      setState(() {});
                    },
                    controller: rep3,
                    text: 'enter',
                    textInputType: TextInputType.number,
                    obscure: false,
                    color: Colors.white,
                    height: 40,
                    width: 100)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Report 2",
                  style: med_black_title,
                ),
                Textform(
                    onChanged: (p0) {
                      setState(() {});
                    },
                    controller: rep4,
                    text: 'enter',
                    textInputType: TextInputType.number,
                    obscure: false,
                    color: Colors.white,
                    height: 40,
                    width: 100)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Total grades",
              style: small_black_title,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                height: 40,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1), blurRadius: 10)
                  ],
                  color: maincolor,
                  borderRadius: BorderRadius.circular(150),
                ),
                child: rep1.text.isNotEmpty &&
                        rep2.text.isNotEmpty &&
                        rep3.text.isNotEmpty &&
                        rep4.text.isNotEmpty
                    ? Text(
                        "${int.parse(rep1.text) + int.parse(rep2.text) + int.parse(rep3.text) + int.parse(rep4.text)}",
                        style: med_white_bold,
                      )
                    : const Text('')),
            const SizedBox(
              height: 10,
            ),
            RecButton(
                fun: () async {
                  
                    AddGrade();
                  
                },
                label: Text(
                  'Submit',
                  style: small_white_title,
                ),
                color: maincolor,
                height: 60,
                width: double.infinity),
            const SizedBox(
              height: 10,
            ),
          ]),
        ),
      ),
    );
  }
}
