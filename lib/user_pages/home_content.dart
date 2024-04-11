import 'package:flutter/material.dart';
import 'package:med_intern/main.dart';
import 'package:med_intern/user_pages/announcment.dart';
import 'package:med_intern/user_pages/courses.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(80),
      //   child: MainAppBar(
      //     showimage: false,
      //     color: Colors.transparent,
      //     title: '',
      //   ),
      // ),
      // drawer: MainDrawer(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hi ${prefs!.getString("name")}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Welcome back to MedIntern!',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        "assets/images/person.jpg",
                      ),
                    ),
                  )
                ],
              ),
              Container(
                  child: Container(
                height: 40,
                margin: const EdgeInsets.only(top: 60, bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12),
                ),
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(Icons.call),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'contact us',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ]),
              )),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return Courses();
                    },
                  ));
                },
                child: Container(
                    child: Container(
                  height: 40,
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Icon(Icons.bookmarks_sharp),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'courses',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ]),
                )),
              ),
              Container(
                  child: Container(
                height: 40,
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12),
                ),
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(Icons.calendar_today_rounded),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'schedule',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ]),
              )),
              InkWell(
                 onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return Announcments(course_id: "1",);
                    },
                  ));},
                child: Container(
                    child: Container(
                  height: 40,
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Icon(Icons.cases_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'annoncment',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ]),
                )),
              ),
              InkWell(
                onTap: () {
                  prefs!.clear();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    "login",
                    (route) => false,
                  );
                },
                child: Container(
                    child: Container(
                  height: 40,
                  margin: const EdgeInsets.only(bottom: 15, top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.logout,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'logout',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ]),
                )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
