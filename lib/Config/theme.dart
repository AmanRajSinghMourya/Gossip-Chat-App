import 'package:flutter/material.dart';
import 'package:gossip/Config/colors.dart';

var darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  drawerTheme: DrawerThemeData(
    scrimColor: darkPrimaryColor,
  ),
  colorScheme: ColorScheme.dark(
    primary: darkPrimaryColor,
    //font color = onPrimaryColor
    onPrimary: darkOnPrimaryContainer,
    onSecondary: darkOnSecondaryContainer,
    background: darkBackgroundColor,
    onBackground: darkPrimaryColor,
    primaryContainer: darkPrimaryColor,
  ),
  // appBarTheme: AppBarTheme(backgroundColor: ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      color: darkOnPrimaryContainer,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w800,
    ),
    headlineMedium: TextStyle(
      fontSize: 26,
      color: darkOnSecondaryContainer,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      fontSize: 22,
      color: darkOnPrimaryContainer,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
    ),
    labelLarge: TextStyle(
      fontSize: 15,
      color: darkOnSecondaryContainer,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      color: darkOnSecondaryContainer,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      color: darkOnSecondaryContainer,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w300,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: darkBackgroundColor,
    filled: true,
  ),
);

var lightTheme = ThemeData(brightness: Brightness.light);
