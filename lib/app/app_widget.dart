import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_workout/app/utils/theme_app.dart';

class AppWidget extends StatelessWidget {
  final ThemeApp themeApp = ThemeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Slidy',
      theme: themeApp(),
    ).modular();
  }
}
