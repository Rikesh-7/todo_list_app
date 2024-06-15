import 'package:flutter/material.dart';

class AppStyles {
  static final ThemeData themeData = ThemeData(
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      bodyText1: TextStyle(fontSize: 16.0, color: Colors.black87), 
      bodyText2: TextStyle(fontSize: 14.0, color: Colors.grey),
      headline6: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black), 
      subtitle1: TextStyle(fontSize: 18.0, color: Colors.blue), 
      button: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.blue),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
    ),
    iconTheme: const IconThemeData(
      color: Colors.blueAccent,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      textTheme: ButtonTextTheme.primary, 
    ),
    scaffoldBackgroundColor: Colors.white, 
    appBarTheme: AppBarTheme(
      color: Colors.blue,  
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white), toolbarTextStyle: const TextTheme(
        titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),  
      ).bodyMedium, titleTextStyle: const TextTheme(
        titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white), 
      ).titleLarge,
    ),
  );
}
