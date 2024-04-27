import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/auth_pages/register%20(2).dart';
import 'package:med_intern/components/roundbutton.dart';
import 'package:med_intern/components/textform.dart';
import 'package:med_intern/supervisor_pages/nexturgentcall.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class SupUrgentCalls extends StatefulWidget {
  SupUrgentCalls({super.key});

  @override
  State<SupUrgentCalls> createState() => _SupUrgentCallsState();
}

class _SupUrgentCallsState extends State<SupUrgentCalls> {
  bool val = false;
  var accounts;
  var selectedtype;
  fun() {
    accounts = FirebaseFirestore.instance
        .collection('users')
        .where('roleid', isEqualTo: "user")
        .snapshots();
    setState(() {});
  }

  void initState() {
    fun();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
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
                child: Text(
                  'Send Urgent call',
                  style: sub_deepgreen_bold,
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Search By Name Or ID Number',
                      style: med_deepgreen_title,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Textform(
                        suf_icon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: subcolor,
                          ),
                        ),
                        controller: search,
                        text: '',
                        textInputType: TextInputType.text,
                        obscure: false,
                        color: Colors.white,
                        height: 50,
                        width: double.infinity),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 100,
                child: StreamBuilder(
                    stream: accounts,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(
                                      top: 10,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 13),
                                    decoration: BoxDecoration(
                                      color: light_box_color,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            children: [
                                              Text(
                                                'name',
                                                style: med_white_bold,
                                              ),
                                              const SizedBox(
                                                height: 13,
                                              ),
                                              Text(
                                                '${snapshot.data.docs[index].data()['name']}',
                                                style: med_white_bold,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            children: [
                                              Text(
                                                'Email',
                                                style: small_dark_grey_title,
                                              ),
                                              const SizedBox(
                                                height: 13,
                                              ),
                                              Text(
                                                '${snapshot.data.docs[index].data()['email']}',
                                                style: med_white_bold,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              Text(
                                                'select',
                                                style: small_dark_grey_title,
                                              ),
                                              CircleAvatar(
                                                backgroundColor: subcolor,
                                                child: Checkbox(
                                                  value: selectedtype ==
                                                          ('${snapshot.data.docs[index].reference.id}')
                                                      ? true
                                                      : false,
                                                  onChanged: (value) {
                                                    selectedtype =
                                                        ('${snapshot.data.docs[index].reference.id}');
                                                    print(selectedtype);
                                                    selectedtype ==
                                                            ('${snapshot.data.docs[index].reference.id}')
                                                        ? true
                                                        : false;
                                                    setState(() {
                                                      val = value!;
                                                    });
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: Text("no data"),
                        );
                      }
                    }),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: RoundButton(
                    fun: () {
                      print(selectedtype);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return sendcall(selectedtype: selectedtype);
                        },
                      ));
                    },
                    label: Text(
                      'next',
                      style: small_white_title,
                    ),
                    width: 100,
                    height: 40,
                    color: maincolor),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
