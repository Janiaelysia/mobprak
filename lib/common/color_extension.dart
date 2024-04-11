//youtube

import 'package:flutter/material.dart';

class TColor {
  // static Color get primaryColor1 => const Color(0xff92A3FD);
  // static Color get primaryColor2 => const Color(0xff9DCEFF);

  static Color get primaryColor1 => Color.fromARGB(255, 237, 86, 59);
  static Color get primaryColor2 => Color.fromARGB(255, 255, 138, 43);

  // static Color get secondaryColor1 => const Color(0xffC58BF2);
  // static Color get secondaryColor2 => const Color(0xffEEA4CE);

  static Color get secondaryColor1 => Color.fromARGB(255, 210, 1, 1);
  static Color get secondaryColor2 => Color.fromARGB(255, 224, 73, 56);

  static List<Color> get primaryG => [primaryColor2, primaryColor1];
  static List<Color> get secondaryG => [secondaryColor2, secondaryColor1];

  static Color get black => const Color(0xff1D1617);
  static Color get gray => const Color(0xff786F72);
  static Color get white => Colors.white;
  static Color get lightGray => const Color(0xffF7F8F8);
}
