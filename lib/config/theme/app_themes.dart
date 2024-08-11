import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes{

  /// Main color pallete
  static const c021526 = Color(0xFF021526);
  static const c03346E = Color(0xFF03346E);
  static const c6EACDA = Color(0xFF6EACDA);
  static const cE2E2B6 = Color(0xFFE2E2B6);

  static const black252525 = Color(0xFF272727);

  /// Override defaultTheme
  static ThemeData defaultTheme(BuildContext context){

    var baseTheme = ThemeData(
      useMaterial3: false,
      brightness: Brightness.light,
      primaryColor: cE2E2B6,
      appBarTheme: const AppBarTheme(
        backgroundColor: c021526,
        foregroundColor: Colors.white,
        surfaceTintColor: c03346E,
        iconTheme: IconThemeData(color: cE2E2B6),
        elevation: 0.0,
        centerTitle: false,
        toolbarHeight: 60.0,

        // uncomment blok code ini jika ingin override system ui overlay
        // systemOverlayStyle: SystemUiOverlayStyle(
        //   statusBarColor: c6EACDA,
        //   statusBarBrightness: Brightness.dark,
        //   statusBarIconBrightness: Brightness.dark
        // )
      ),
      scaffoldBackgroundColor: Colors.white,
      // fontFamily: 'Roboto',
      tabBarTheme: const TabBarTheme(
        labelColor: cE2E2B6,
      ),
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.aBeeZeeTextTheme(baseTheme.textTheme)
    );
  }

}