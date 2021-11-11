import 'package:flutter/material.dart';

const Color kBlackColor = Color(0xff575757);
const Color kGreenColor = Color(0xff8AC675);
const Color kOrangeColor = Color(0xffFF9500);
const Color kRedColor = Color(0xffFF3B30);

class MainTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.grey)),
      brightness: Brightness.light,
      primaryColor: Color.fromARGB(255, 255, 205, 77),
      primaryColorLight: Colors.black,
      primaryColorDark: Colors.white,
      canvasColor: Color(0xffF9F9F9),
      scaffoldBackgroundColor: Colors.white,
      // fontFamily: 'Georgia',
      iconTheme: IconThemeData(
        color: Colors.red,
      ),
      hintColor: Colors.grey,
      textTheme: const TextTheme(
        // headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        // headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
      brightness: Brightness.dark,
      primaryColor: Color(0xff363636),
      primaryColorLight: Colors.white,
      primaryColorDark: Colors.black,
      canvasColor: Colors.black,
      scaffoldBackgroundColor: Color(0xff363636),
      // fontFamily: 'Georgia',
      iconTheme: IconThemeData(
        color: Colors.grey,
      ),
      hintColor: Colors.white,
      textTheme: const TextTheme(
        // headline1: TextStyle(
        //   fontSize: 72.0,
        //   fontWeight: FontWeight.bold,
        // ),
        // headline6: TextStyle(
        //   fontSize: 36.0,
        //   fontStyle: FontStyle.italic,
        // ),
        bodyText2: TextStyle(
          fontSize: 14.0,
          color: Colors.white,
          fontFamily: 'Hind',
        ),
      ),
    );
  }
}
