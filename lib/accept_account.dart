import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class AcceptAccounts extends StatefulWidget {
  const AcceptAccounts({super.key});

  @override
  State<AcceptAccounts> createState() => _AcceptAccountsState();
}

class _AcceptAccountsState extends State<AcceptAccounts> {
  var accounts;
  @override
  void initState() {
    fun();
    super.initState();
  }

  fun() {
    accounts = FirebaseFirestore.instance
        .collection('users')
        .where('status', isEqualTo: "0")
        .snapshots();
    setState(() {});
  }

  int clicked = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: MainAppBar(title: "Accept accounts")),
      body: SafeArea(
          child: StreamBuilder(
        stream: accounts,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              margin: EdgeInsets.only(top: 50),
              child: ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: CustomListTile(
                      icon: CircleAvatar(
                        backgroundColor: subcolor,
                        child: IconButton(
                          onPressed: () {
                            print('${snapshot.data.docs[index].reference.id}');
                            FirebaseFirestore.instance
                                .collection('users')
                                .doc('${snapshot.data.docs[index].reference.id}')
                                .set({"status": "1"},
                                    SetOptions(merge: true)).then((value) {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.success,
                                animType: AnimType.rightSlide,
                                title: 'user accepted',
                                desc: 'user can log in now',
                              )..show();
                            });
                          },
                          icon: Icon(
                            Icons.check,
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
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(
                color: maincolor,
              ),
            );
          } else {
            return Center(
              child: Text('no accounts'),
            );
          }
        },
      )),
    );
  }
}
