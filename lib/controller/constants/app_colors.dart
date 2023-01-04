import 'package:flutter/material.dart';

import '../../view/widgets/create_material_color.dart';

class CustomTheme {
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color splashColors = Color(0xffFBE9FF);
  static const Color red = Colors.red;

  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xff1e4162),
    primarySwatch: createMaterialColor(const Color(0xff1e4162)),
  );

// static const String fontFamily = "Noto_Sans";
// static const String fontFamilybold = "NotoSans-Bold";
// static const String fontfamilyitalic = "NotoSans-Italic";
// static const String fontfamilyitalicbold = "NotoSans-BoldItalic";

}
