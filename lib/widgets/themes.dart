import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mythemes {
  static ThemeData get lightTheme => ThemeData(
      appBarTheme: AppBarTheme(color: Colors.black, elevation: 0.0),
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.lato().fontFamily);

  static ThemeData get darkTheme => ThemeData(brightness: Brightness.dark);
}
