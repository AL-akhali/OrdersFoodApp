import 'package:flutter/material.dart';
import 'package:full_ecommerce/core/constant/color.dart';

ThemeData themeEnglish = ThemeData(
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: ColorApp.thirdColor),
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: ColorApp.primaryColor),
        centerTitle: true,
        titleTextStyle: TextStyle(color: ColorApp.primaryColor, fontSize: 28)),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      bodyLarge: TextStyle(height: 2, color: ColorApp.grey),
    ));
ThemeData themeArabic = ThemeData(
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: ColorApp.thirdColor),
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: ColorApp.primaryColor),
        centerTitle: true,
        titleTextStyle: TextStyle(color: ColorApp.primaryColor, fontSize: 28)),
    fontFamily: "Cairo",
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      bodyLarge: TextStyle(height: 2, color: ColorApp.grey),
    ));
