import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/Admin_pages/Admin_bottom_appbar.dart';
import 'package:med_intern/components/recbutton.dart';
import 'package:med_intern/components/textform.dart';
import 'package:med_intern/auth_pages/register%20(2).dart';
import 'package:med_intern/main.dart';
import 'package:med_intern/supervisor_pages/supervisor_bottom_appbar.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';
import 'package:med_intern/user_pages/bottom_app_bar.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var user;
  GlobalKey<FormState> fkey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: fkey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                height: MediaQuery.of(context).size.height / 5,
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
                      height: 10,
                    ),
                    Center(
                        child: Text(
                      "log in",
                      style: med_deepgreen_bold,
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'email',
                        style: small_deepgreen_title,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Textform(
                        val: (p0) {
                          if (p0 != null && p0.isNotEmpty) {
                            if (!p0.CheckEmail()) {
                              return "enter valid email";
                            }
                          } else {
                            return 'rquired';
                          }
                        },
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
                        val: (p0) {
                          if (p0 != null && p0.isNotEmpty) {
                            print(p0.length);
                            if (p0.IsPassword()) {
                              print('less');
                              return "min 6";
                            }
                          } else {
                            return 'rquired';
                          }
                        },
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
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Forget password? ",
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed("resetpassword");
                                    },
                                    child: Text(
                                      "Reset here",
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
                                  if (fkey.currentState!.validate()) {
                                    print('validate');
                                    print(emailController.text);
                                    print(passwordController.text);
                                    user = await FirebaseFirestore.instance
                                        .collection('users')
                                        .where('email',
                                            isEqualTo: "${emailController.text}"
                                                .replaceAll(" ", ""))
                                        .where('password',
                                            isEqualTo:
                                                "${passwordController.text}")
                                        .where("status", isEqualTo: "1")
                                        .get();
                                    print("${user.docs[0].data()['name']}");
                                    if (user != null && user.docs.isNotEmpty) {
                                      if (user.docs[0].data()['roleid'] ==
                                          "user") {
                                        prefs!.setString('role', "user");
                                        prefs!.setString('name',
                                            "${user.docs[0].data()['name']}");
                                        print('dddddddddddddd');
                                        print(prefs!.getString("name"));
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(MaterialPageRoute(
                                          builder: (context) {
                                            return CustomBottomAppBar();
                                          },
                                        ), (route) => false,);
                                      } else if (user.docs[0]
                                              .data()['roleid'] ==
                                          "admin") {
                                        prefs!.setString('role', "admin");
                                        prefs!.setString('name',
                                            "${user.docs[0].data()['name']}");
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(MaterialPageRoute(
                                          builder: (context) {
                                            return Adminbottomappbar();
                                          },
                                        ) ,(route) => false,);
                                      } else if (user.docs[0]
                                              .data()['roleid'] ==
                                          "supervisor") {
                                        prefs!.setString('role', "super");
                                        prefs!.setString('name',
                                            "${user.docs[0].data()['name']}");

                                        Navigator.of(context)
                                            .pushAndRemoveUntil(MaterialPageRoute(
                                          builder: (context) {
                                            return SupervisorBottomAppBar();
                                          },
                                        ),(route) => false,);
                                      }
                                    }
                                  }
                                },
                                label: Text(
                                  'log in',
                                  style: small_black_title,
                                ),
                                width: 140,
                                height: 50,
                                color: maincolor)
                          ]),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don\'t have an Account? ",
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) {
                                  return Register();
                                },
                              ));
                            },
                            child: Text(
                              "signUp",
                              style: small_green_title,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
