import 'package:flutter/material.dart';
import 'package:med_intern/components/recbutton.dart';
import 'package:med_intern/components/textform.dart';
import 'package:med_intern/pages/bottom_app_bar.dart';
import 'package:med_intern/pages/home_content.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
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
                    style: main_deepgreen_title,
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'UserName/email',
                      style: sub_deepgreen_title,
                    ),
                  ),
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
                              fun: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return HomeContent();
                                  },
                                ));
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
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
