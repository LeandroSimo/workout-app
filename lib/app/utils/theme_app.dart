import 'package:flutter/material.dart';

class ThemeApp {
  final ThemeData theme = ThemeData();
  call() => theme.copyWith(
        appBarTheme: const AppBarTheme(color: Color.fromRGBO(29, 34, 37, 0.9)),
        canvasColor: Colors.transparent,
        colorScheme: theme.colorScheme.copyWith(
          primary: const Color.fromARGB(255, 243, 219, 4),
          secondary: const Color.fromARGB(255, 243, 219, 4),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline4: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          subtitle1: TextStyle(color: Colors.white),
          subtitle2: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(151, 152, 152, 1),
          ),
          bodyText1: TextStyle(
            color: Colors.white,
          ),
        ),
        // buttonTheme: ButtonThemeData(
        //   buttonColor: Color.fromARGB(255, 243, 219, 4),
        //   textTheme: ButtonTextTheme.primary,
        //   colorScheme: theme.colorScheme.copyWith(
        //     primary: Color.fromARGB(255, 243, 219, 4),
        //   ),
        // ),
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: Color.fromRGBO(48, 56, 62, 0.9),
          filled: true,
          border: InputBorder.none,
          labelStyle: TextStyle(
            color: Color.fromRGBO(151, 152, 152, 1),
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color.fromARGB(255, 243, 219, 4),
          selectionHandleColor: Color.fromARGB(255, 243, 219, 4),
        ),
        dialogBackgroundColor: const Color.fromRGBO(29, 24, 37, 1),
        cardColor: const Color.fromRGBO(60, 70, 72, 0.9),
        scaffoldBackgroundColor: const Color.fromRGBO(29, 34, 37, 0.9),
      );
}
