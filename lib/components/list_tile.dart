import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_intern/theme/colors.dart';

class CustomListTile extends StatefulWidget {
  Icon icon;
  Text title;
  Widget? subtitle;
  Color color;
  CustomListTile({required this.icon, required this.title, this.subtitle,required this.color});
  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: widget.color,
      child: ListTile(
        leading: widget.icon,
        title: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: widget.title
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: widget.subtitle ==null ? Text('') :widget.subtitle
        ),
      ),
    );
    ;
  }
}
