import 'package:flutter/material.dart';
import 'package:takequiz/config/themes/sub_theme_data_mixin.dart';
import 'package:takequiz/main.dart';

const Color mainTextColorLight = Color.fromARGB(255, 40, 40, 40);
const Color primaryLightColorLight = Color(0xFF3ac3cb);
const Color primaryColorLight = Color(0xFFf85187);
// const Color primaryColorLight = Color(0xFF3ac3cb);

class LightTheme with SubThemeData {
  buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
      primaryColor: primaryColorLight,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      iconTheme: getIconTheme(),
      textTheme: getTextTheme().apply(
        bodyColor: mainTextColorLight,
        displayColor: mainTextColorLight,
      ),
    );
  }
}
