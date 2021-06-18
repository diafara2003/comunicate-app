import 'package:comunicate_colegios_app/helper/utilities.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static const _kPrimaryColor = Color(0xFF00BF6D);
  static const _kContentColorLightTheme = Color(0xFF1D1D35);
  static const _kContentColorDarkTheme = Color(0xFFF5FCF9);
  static const _kErrorColor = Color(0xFFF03738);

  static final darktheme = ThemeData.dark().copyWith(
      // scaffoldBackgroundColor: _kContentColorLightTheme,
      iconTheme: IconThemeData(color: _kContentColorDarkTheme),
      colorScheme: ColorScheme.light(
          primary: _kContentColorLightTheme,
          secondary: _kContentColorLightTheme.withOpacity(0.64),
          primaryVariant: _kPrimaryColor,
          error: _kErrorColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          // backgroundColor: _kContentColorLightTheme,
          selectedItemColor: Colors.white70,
          unselectedItemColor: _kContentColorDarkTheme.withOpacity(0.34),
          selectedIconTheme: IconThemeData(color: _kPrimaryColor)));

  static final lighttheme = ThemeData.light().copyWith(
      iconTheme: IconThemeData(color: Utilities.hexToColor('#0096fb')),
      colorScheme: ColorScheme.light(
          primary: Utilities.hexToColor('#0096fb'),
          secondary: Colors.white,
          primaryVariant: Utilities.hexToColor('#fafafa'),
          error: _kErrorColor));
}
