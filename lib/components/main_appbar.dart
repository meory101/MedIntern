import 'package:flutter/material.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';

class MainAppBar extends StatefulWidget {
  final String title;
  final Color? color;
  final bool? showimage;
  MainAppBar({required this.title, this.color, this.showimage});
  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.color == null ? maincolor : widget.color,
      elevation: 0,
      automaticallyImplyLeading: false,

      // leading:
      // onTap: () {
      // Scaffold.of(context).openDrawer();
      // ;
      // },
      // child: Container(
      //   width: 50,
      //   height: 50,
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: widget.color != null
      //           ? AssetImage('assets/images/menu.png')
      //           : AssetImage('assets/images/wmenu.png'),
      //     ),
      //   ),
      // ),
      // ),
      title: Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 2,
              child: Text(
                '${widget.title}',
                style: sub_white_title,
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: widget.showimage == null
            //       ? CircleAvatar(
            //           radius: 40,
            //           backgroundImage: AssetImage(
            //             'assets/images/logo1.jpg',
            //           ),
            //         )
                  /* Container(
                      width: 20,
                      height: 80,
                      margin: EdgeInsets.only(top: 10, right: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/logo1.jpg',
                            ),
                            fit: BoxFit.cover),
                      ),
                    )*/
                  // : Text(''),
            // )
          ],
        ),
      ),
      iconTheme: IconThemeData(color: Colors.white, size: 50),
    );
  }
}
