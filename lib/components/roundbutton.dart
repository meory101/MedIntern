import 'package:flutter/material.dart';

class RoundButton extends StatefulWidget {
  final Widget label;
  final double width;
  final double height;
  final Color color;
 final void Function()? fun;

  RoundButton(
      {required this.label,
      required this.width,
      required this.height,
      this.fun,
      required this.color});
  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.fun,
      child: Container(
        height: widget.height,
        width: widget.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 7)
          ],
          color: widget.color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [widget.label],
        ),
      ),
    );
  }
}
