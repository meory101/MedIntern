import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  Icon icon;
  Widget title;
  Widget? subtitle;
  Color color;
  CustomListTile(
      {super.key,
      required this.icon,
      required this.title,
      this.subtitle,
      required this.color});
  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7),
      height: 80,
      decoration: BoxDecoration(
              color: widget.color,

        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: widget.icon,
        title: Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: widget.title),
        subtitle: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: widget.subtitle ?? const Text('')),
      ),
    );
  }
}
