
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/auth_pages/login.dart';
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
              height: MediaQuery.of(context).size.height / 8,
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
                    style: med_deepgreen_bold,
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'UserName',
                      style: small_deepgreen_title,
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
                        style: small_deepgreen_title,
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
                      style: small_deepgreen_title,
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
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                                "Already have Account? ",
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushReplacementNamed("login");
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
                                  "email": "${emailController.text}".replaceAll(" ", ""),
                                  "password": "${passwordController.text}".replaceAll(" ", ""),
                                  "status": "0",
                                  "roleid": selectedtype == 0 ? "user" : "supervisor"
                                }).then((_) {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.warning,
                                    animType: AnimType.rightSlide,
                                    desc: 'Please wait until admin accepts you',
                                  )..show();

                                  if (selectedtype == 0) {
                                    print('kk');
                                    prefs!.setString("role", "user");
                                  } else if (selectedtype == 1) {
                                    prefs!.setString("role", "super");
                                  }
                                  Future.delayed(Duration(milliseconds: 1000));
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return LogIn();
                                    },
                                  ));
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
