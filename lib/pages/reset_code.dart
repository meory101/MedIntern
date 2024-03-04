import 'package:flutter/material.dart';
import 'package:med_intern/components/recbutton.dart';
import 'package:med_intern/components/textform.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class ResetCode extends StatefulWidget {
  const ResetCode({super.key});

  @override
  State<ResetCode> createState() => _ResetCodeState();
}

class _ResetCodeState extends State<ResetCode> {
  final TextEditingController f_digit_controller = TextEditingController();
  final TextEditingController s_digit_controller = TextEditingController();
  final TextEditingController t_digit_controller = TextEditingController();
  final TextEditingController fo_digit_controller = TextEditingController();

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
                        "Enter 4 Digits code ",
                        style: sub_deepgreen_title,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Enter 4 Digits code that you recieved on your email",
                        style: small_black_title,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Textform(
                            width: 65,
                            height: 65,
                            color: maincolor,
                            controller: f_digit_controller,
                            text: '',
                            obscure: false,
                            textInputType: TextInputType.number,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Textform(
                            width: 65,
                            height: 65,
                            color: maincolor,
                            controller: s_digit_controller,
                            text: '',
                            obscure: false,
                            textInputType: TextInputType.number,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Textform(
                            width: 65,
                            height: 65,
                            color: maincolor,
                            controller: t_digit_controller,
                            text: '',
                            obscure: false,
                            textInputType: TextInputType.number,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Textform(
                            width: 65,
                            height: 65,
                            color: maincolor,
                            controller: fo_digit_controller,
                            text: '',
                            obscure: false,
                            textInputType: TextInputType.number,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: RecButton(
                            fun: () {
                              Navigator.of(context).pushNamed("PasswordRec");
                            },
                            label: Text(
                              'continue',
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
