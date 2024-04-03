import 'package:flutter/material.dart';
import 'package:med_intern/theme/colors.dart';

class Textform2 extends StatelessWidget {
  const Textform2({
    super.key,
    required this.controller,
     this.validator
  });
  final TextEditingController controller;
final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
      
        validator:validator ?? validator ,
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
