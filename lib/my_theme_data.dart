import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const Color primaryColor = Color(0xffE2BE7F);
  static const Color blackColor = Color(0xff202020);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    // cardColor: blackColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: blackColor,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: primaryColor,
      ),
      titleTextStyle: TextStyle(
        color: primaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showUnselectedLabels: false,
      backgroundColor: primaryColor,
      showSelectedLabels: true,
      selectedItemColor: Colors.white,
      unselectedItemColor: blackColor,
      type: BottomNavigationBarType.fixed,
    ),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.aBeeZee(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: primaryColor,
      ),
      titleMedium: GoogleFonts.aBeeZee(
        color: primaryColor,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: GoogleFonts.aBeeZee(
        color: primaryColor,
        fontSize: 32,
        fontWeight: FontWeight.w700,
      ),


      bodySmall: GoogleFonts.elMessiri(
        color: primaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: GoogleFonts.elMessiri(
        color: primaryColor,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: GoogleFonts.elMessiri(
        color: primaryColor,
        fontSize: 32,
        fontWeight: FontWeight.w700,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData();
}
