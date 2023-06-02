import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Bottombutton extends StatelessWidget {
  const Bottombutton({
    super.key, required this.text, required this.icon,
  });
final String  text;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Colors.grey.shade400,
        ),
        Text(
          text,
          style: GoogleFonts.redHatDisplay(textStyle:  TextStyle(color: Colors.grey.shade400,fontWeight: FontWeight.w300)),
        )
      ],
    );
  }
}