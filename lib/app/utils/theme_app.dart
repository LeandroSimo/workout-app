import 'package:flutter/material.dart';

class ThemeApp {
  final ThemeData theme = ThemeData();
  call() => theme.copyWith(
        appBarTheme: const AppBarTheme(color: Color.fromRGBO(29, 34, 37, 0.9)),
        canvasColor: Colors.transparent,
        colorScheme: theme.colorScheme.copyWith(
          secondary: const Color.fromARGB(255, 243, 219, 4),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          subtitle2: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(151, 152, 152, 1),
          ),
          bodyText1: TextStyle(
            color: Colors.white,
          ),
        ),
        cardColor: const Color.fromRGBO(60, 70, 72, 0.9),
        scaffoldBackgroundColor: const Color.fromRGBO(29, 34, 37, 0.9),
      );
}
