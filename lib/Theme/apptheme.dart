
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Constants/constants.dart';

class AppTheme {
  static ThemeData getTheme() {
    Color primaryColor = Constants.primaryColor;
    Color secondaryColor = Constants.secondaryColor;
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      // buttonColor: primaryColor,
      indicatorColor: Colors.white,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      // accentColor: secondaryColor,
      canvasColor: Colors.white,
      backgroundColor: Colors.grey[850],
      scaffoldBackgroundColor: Colors.black,
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      // cursorColor: primaryColor,
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      // accentTextTheme: _buildTextTheme(base.accentTextTheme),
      platform: TargetPlatform.iOS,
    );
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      titleLarge: TextStyle(
        color: base.titleLarge?.color,
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        // fontFamily: 'Archivo',
      ),
      titleMedium: TextStyle(
        color: base.titleMedium?.color,
        fontSize: 4.sp,
        // fontFamily: 'Archivo',
      ),
      titleSmall: TextStyle(
        color: base.titleSmall?.color,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        // fontFamily: 'Archivo',
      ),
      bodyMedium: TextStyle(
        color: base.bodyMedium?.color,
        fontSize: 12.sp,
        // fontFamily: 'Archivo',
      ),
      bodyLarge: TextStyle(
        color: base.bodyLarge?.color,
        fontSize: 10.sp,
        // fontFamily: 'Archivo',
      ),
      labelLarge: TextStyle(
          color: base.labelLarge?.color,
          fontSize: 10.sp,
          // fontFamily: 'Archivo',
          fontWeight: FontWeight.w600),
      bodySmall: TextStyle(
        color: base.bodySmall?.color,
        fontSize: 8.sp,
        // fontFamily: 'Archivo',
      ),
      headlineMedium: TextStyle(
        color: base.headlineMedium?.color,
        fontSize: 13.sp,
        // fontFamily: 'Archivo',
      ),
      displaySmall: TextStyle(
        color: base.displaySmall?.color,
        fontSize: 18.sp,
        // fontFamily: 'Archivo',
      ),
      displayMedium: TextStyle(
        color: base.displayMedium?.color,
        fontSize: 20.sp,
        // fontFamily: 'Archivo',
      ),
      displayLarge: TextStyle(
        color: base.displayLarge?.color,
        fontSize: 24.sp,
        // fontFamily: 'Archivo',
      ),
      headlineSmall: TextStyle(
        color: base.headlineSmall?.color,
        fontSize: 12.sp,
        // fontFamily: 'Archivo',
      ),
      labelSmall: TextStyle(
        color: base.labelSmall?.color,
        fontSize: 6.sp,
        // fontFamily: 'Archivo',
      ),
    );
  }
}