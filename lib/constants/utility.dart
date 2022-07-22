import 'package:flutter/material.dart';

class Utility {
  static Color primary = Utility.hexToColor("#ffffff");

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
