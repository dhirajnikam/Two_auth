import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextTitle extends StatelessWidget {
  String title;
  Color colors = Colors.black;
   TextAlign textAlign = TextAlign.left;
  TextTitle({
    Key? key,
    required this.title,
    required this.colors,
    required this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: GoogleFonts.sansitaSwashed(
            color: colors, fontSize: 40, fontWeight: FontWeight.bold),  textAlign: textAlign,);
  }
}

class TextDescp extends StatelessWidget {
  String title;
  Color colors = Colors.black;
  TextAlign textAlign = TextAlign.left;
  TextDescp({
    Key? key,
    required this.title,
    required this.colors,
    required this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.sansitaSwashed(
          color: colors, fontSize: 25, fontWeight: FontWeight.bold),
      textAlign: textAlign,
    );
  }
}
