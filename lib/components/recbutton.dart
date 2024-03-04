import 'package:flutter/material.dart';

class RecButton extends StatefulWidget {
  final Widget label;
  final double width;
  final double height;
  final Color color;
  void Function()? fun;

  RecButton(
      {required this.label,
      required this.width,
      required this.height,
      this.fun, required this.color});
  @override
  State<RecButton> createState() => _RecButtonState();
}

class _RecButtonState extends State<RecButton> {
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
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [widget.label],
        ),
      ),
    );
  }
}
