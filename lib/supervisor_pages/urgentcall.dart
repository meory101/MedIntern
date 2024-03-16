import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/roundbutton.dart';
import 'package:med_intern/components/textform.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class SupUrgentCalls extends StatefulWidget {
  const SupUrgentCalls({super.key});

  @override
  State<SupUrgentCalls> createState() => _SupUrgentCallsState();
}

class _SupUrgentCallsState extends State<SupUrgentCalls> {
  bool val = false;
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
                child: ListView.builder(
                  itemCount: 1,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Text(
                                        'name',
                                        style: small_dark_grey_title,
                                      ),
                                      const SizedBox(
                                        height: 13,
                                      ),
                                      Text(
                                        'nour',
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
                                        'ID',
                                        style: small_dark_grey_title,
                                      ),
                                      const SizedBox(
                                        height: 13,
                                      ),
                                      Text(
                                        '022333221',
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
                                          value: val,
                                          onChanged: (value) {
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
                        SizedBox(
                          height: 100,
                        ),
                        RoundButton(
                            fun: () {
                              Navigator.of(context).pushNamed("sendcall");
                            },
                            label: Text(
                              'next',
                              style: small_white_title,
                            ),
                            width: 100,
                            height: 40,
                            color: maincolor),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
