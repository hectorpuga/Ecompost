import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.pink;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      iconTheme: const IconThemeData(
        size: 35,
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: Color.fromARGB(255, 90, 78, 60)),
        bodyText2: TextStyle(color: Color.fromARGB(255, 90, 78, 60)),
        headline6: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        headline1: TextStyle(
          color: Color.fromARGB(255, 90, 78, 60),
          fontFamily: 'Poppins-Regular',
          fontWeight: FontWeight.bold,
          fontSize: 32.0,
        ),
      ),
      dividerTheme:
          const DividerThemeData(color: Colors.black, endIndent: 0, indent: 0),

      // Tema para Card
      cardTheme: const CardTheme(color: Color(0xffC4D428)),
      scaffoldBackgroundColor: const Color(0xffE9EBBF),
      // Color primario
      primaryColor: Colors.indigo,
      // AppBar Theme
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),

      // FloatingActionButtons
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary, elevation: 5),
      //TextFormInput

      inputDecorationTheme: const InputDecorationTheme(
          prefixIconColor: Color.fromARGB(255, 56, 56, 56),
          hintStyle: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16.0,
              color: Color.fromRGBO(90, 78, 60, 100))),
      // ElevatedButtons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 56, 56, 56),
            backgroundColor: const Color.fromARGB(241, 241, 241, 241),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            elevation: 10.0,
            minimumSize: const Size(240, 59),
            textStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16.0,
            )),
      ),

      //TextButton
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 90, 78, 60),
              textStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14.0,
              ))));
}
