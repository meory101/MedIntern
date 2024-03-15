import 'package:flutter/material.dart';
import 'package:med_intern/theme/colors.dart';

class Textform2 extends StatelessWidget {
  const Textform2({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        cursorColor: light_box_color,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: light_box_color),
          ),
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: light_box_color),
          ),
        ),
      ),
    );
  }
}
