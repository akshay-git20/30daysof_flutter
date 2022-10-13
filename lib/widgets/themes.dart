import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mythemes {
  static ThemeData get lightTheme => ThemeData(
      appBarTheme: AppBarTheme(
          color: Colors.deepPurple,
          elevation: 0.0,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 22),
          iconTheme: IconThemeData(color: Colors.black)),
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.lato().fontFamily);

  static ThemeData get darkTheme => ThemeData(brightness: Brightness.dark);
}
