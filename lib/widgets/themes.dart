import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mythemes {
  static ThemeData get lightTheme => ThemeData(
      appBarTheme: AppBarTheme(
          color: Mythemes.darkBluishColor,
          elevation: 0.0,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 22),
          iconTheme: IconThemeData(color: Colors.black)),
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily);

  static Color creamcolor = Color(0xfff5f5f5);
  static Color darkBluishColor = Color(0xff403b58);

  static ThemeData get darkTheme => ThemeData(brightness: Brightness.dark);
}
