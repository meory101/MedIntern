import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
 final Icon? icon;
 final Widget title;
 final Widget? subtitle;
 final Color color;
  CustomListTile(
      {super.key,
      this.icon,
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
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
          
          leading: widget.icon != null ? widget.icon : null,
          title:widget.title,
          subtitle: 
             widget.subtitle ?? null
        
      ),
    );
  }
}
