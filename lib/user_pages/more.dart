import 'package:flutter/material.dart';
import 'package:med_intern/components/list_tile.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class More extends StatefulWidget {
  final data;
  final extra;
  More({super.key, this.data, this.extra});
  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> key = GlobalKey();
    return Scaffold(
      key: key,
      // drawer: const MainDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, top: 20),
                alignment: Alignment.topLeft,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 6,
                decoration: BoxDecoration(color: maincolor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'my profile',
                      style: sub_white_bold,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 6 - 50),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 1,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: CircleAvatar(
                    backgroundColor: maincolor,
                    backgroundImage: AssetImage('assets/images/person.jpg'),
                    radius: 60,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 6 + 100,
                    bottom: 30),
                height: MediaQuery.of(context).size.height / 2,
                child: ListView.builder(
                  itemCount: widget.data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 3,
                        ),
                        CustomListTile(
                            icon: widget.data[index]['icon'],
                            title: widget.data[index]['title'],
                            color: Colors.transparent),
                      ],
                    );
                  },
                ),
              ),
              if (widget.extra != null) ...[
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 6 +
                        MediaQuery.of(context).size.height / 2,
                  ),
                  child: widget.extra,
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
