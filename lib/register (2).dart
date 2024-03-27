import 'package:flutter/material.dart';
import 'package:med_intern/Admin_pages/Admin_bottom_appbar.dart';
import 'package:med_intern/components/recbutton.dart';
import 'package:med_intern/components/textform.dart';
import 'package:med_intern/main.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

int selectedtype = 0;

class _RegisterState extends State<Register> {
  final TextEditingController username = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> fkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              height: MediaQuery.of(context).size.height / 7,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    "assets/images/logo.jpg",
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 1,
                  ),
                  Center(
                      child: Text(
                    "Signup",
                    style: main_deepgreen_title,
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'UserName',
                      style: sub_deepgreen_title,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Textform(
                      width: double.infinity,
                      height: 55,
                      color: maincolor,
                      controller: username,
                      text: '',
                      obscure: false,
                      textInputType: TextInputType.name,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Email',
                        style: sub_deepgreen_title,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Textform(
                      width: double.infinity,
                      height: 55,
                      color: maincolor,
                      controller: emailController,
                      text: '',
                      obscure: false,
                      textInputType: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Password',
                      style: sub_deepgreen_title,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Textform(
                      width: double.infinity,
                      height: 55,
                      color: maincolor,
                      controller: passwordController,
                      text: '',
                      obscure: true,
                      textInputType: TextInputType.visiblePassword,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedtype = 0;
                          });
                        },
                        child: RecButton(
                          color: selectedtype == 0 ? maincolor : Colors.white,
                          label: Text(
                            'User',
                            style: selectedtype == 0
                                ? small_deepgreen_title
                                : small_black_title,
                          ),
                          width: 80,
                          height: 40,
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedtype = 1;
                          });
                        },
                        child: RecButton(
                          label: Text(
                            'Admin',
                            style: selectedtype == 1
                                ? small_deepgreen_title
                                : small_black_title,
                          ),
                          color: selectedtype == 1 ? maincolor : Colors.white,
                          width: 80,
                          height: 40,
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedtype = 2;
                          });
                        },
                        child: RecButton(
                          label: Text(
                            'supervisor',
                            style: selectedtype == 2
                                ? small_deepgreen_title
                                : small_black_title,
                          ),
                          color: selectedtype == 2 ? maincolor : Colors.white,
                          width: 80,
                          height: 40,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "ALready have Account? ",
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed("login");
                                  },
                                  child: Text(
                                    "login",
                                    style: small_green_title,
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RecButton(
                              fun: () async {
                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .add({
                                  "name": "${username.text}",
                                  "email": "${emailController.text}",
                                  "password": "${passwordController.text}",
                                  "roleid": selectedtype == 0
                                      ? "user"
                                      : selectedtype == 1
                                          ? "admin"
                                          : "super"
                                }).then((_) {
                                  if (selectedtype == 0) {
                                    prefs!.setString("role", "${0}");
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) {
                                        return BottomAppBar();
                                      },
                                    ));
                                  } else if (selectedtype == 1) {
                                    prefs!.setString("role", "${1}");

                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) {
                                        return Adminbottomappbar();
                                      },
                                    ));
                                  } else {
                                    prefs!.setString("role", "${2}");

                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) {
                                        return Adminbottomappbar();
                                      },
                                    ));
                                  }
                                }).catchError((_) {
                                  print("an error occured");
                                });
                              },
                              label: Text(
                                'Sign Up',
                                style: small_black_title,
                              ),
                              width: 140,
                              height: 50,
                              color: maincolor)
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
