import 'package:flutter/material.dart';
import 'package:med_intern/components/recbutton.dart';
import 'package:med_intern/components/textform.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class Resetpassword extends StatefulWidget {
  const Resetpassword({super.key});

  @override
  State<Resetpassword> createState() => _ResetpasswordState();
}

class _ResetpasswordState extends State<Resetpassword> {
  final TextEditingController emailController = TextEditingController();

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
                        "forget your password ?",
                        style: sub_deepgreen_title,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Enter your e-mail address and we'll send you a link to reset password",
                        style: med_deepgreen_title,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Textform(
                        width: double.infinity,
                        height: 55,
                        color: maincolor,
                        controller: emailController,
                        text: 'Email address',
                        obscure: false,
                        pre_icon: Icon(
                          Icons.mail,
                          color: subcolor,
                        ),
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RecButton(
                              label: Text(
                                'cancle',
                                style: small_black_title,
                              ),
                              width: 120,
                              height: 40,
                              color: Colors.white),
                          SizedBox(
                            width: 30,
                          ),
                          RecButton(
                              fun: () {
                                Navigator.of(context).pushNamed("resetcode");
                              },
                              label: Text(
                                'continue',
                                style: small_black_title,
                              ),
                              width: 120,
                              height: 40,
                              color: maincolor)
                        ],
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
