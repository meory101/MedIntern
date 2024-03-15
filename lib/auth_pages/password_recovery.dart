import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/components/recbutton.dart';
import 'package:med_intern/components/textform.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class PasswordRec extends StatefulWidget {
  const PasswordRec({super.key});

  @override
  State<PasswordRec> createState() => _PasswordRecState();
}

class _PasswordRecState extends State<PasswordRec> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  margin: EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Reset Password ",
                        style: sub_deepgreen_bold,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Set the new password for your account to you can login and access",
                        style: small_deepgreen_title,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Password',
                          style: med_deepgreen_title,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Textform(
                          suf_icon: IconButton(
                            icon: Icon(
                              CupertinoIcons.lock_slash_fill,
                            ),
                            onPressed: () {},
                            color: subcolor,
                          ),
                          style: med_deepgreen_bold,
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 55,
                          color: maincolor,
                          controller: passwordController,
                          text: '',
                          obscure: true,
                          textInputType: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Confirm password',
                          style: med_deepgreen_title,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Textform(
                          suf_icon: IconButton(
                            icon: Icon(
                              CupertinoIcons.lock_slash_fill,
                            ),
                            onPressed: () {},
                            color: subcolor,
                          ),
                          style: med_deepgreen_bold,
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 55,
                          color: maincolor,
                          controller: cpasswordController,
                          text: '',
                          obscure: true,
                          textInputType: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: RecButton(
                            fun: () {},
                            label: Text(
                              'Reset Password',
                              style: small_black_title,
                            ),
                            width: 160,
                            height: 44,
                            color: maincolor),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
