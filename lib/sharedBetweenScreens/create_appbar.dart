import 'package:flutter/material.dart';
class CreateAppBar extends StatelessWidget implements PreferredSizeWidget{

  final String title;
  final String text;
  final double appBarHeight;

   CreateAppBar({super.key,
    required this.title,
    required this.text,
    required this .appBarHeight
  });

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Image.asset(
          'assets/images/moon.png',
          width: double.infinity,
          height: appBarHeight,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: appBarHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.3),
              ],
            ),
          ),
        ),
        appBarText(
          text: title,
          pos: Alignment.topCenter,
          padding: const EdgeInsets.only(top: 30),
        ),
        appBarText(
          text:text,
          pos: Alignment.bottomLeft,
          padding: const EdgeInsets.only(left: 20, bottom: 8),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
Widget appBarText({
  required String text,
  required Alignment pos,
  required EdgeInsetsGeometry padding, // Default padding to top 20
}){return Align(
    alignment: pos,
    child: Padding(
      padding: padding, // Use the dynamic padding
      child: Text(
        text, // Use the 'text' parameter here
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );}