import 'package:flutter/material.dart' show Colors, Color;

class ColorStyleModel {
  Color textColor;
  Color bgColor;

  ColorStyleModel(this.textColor, this.bgColor);

  static ColorStyleModel getColorsByIndex(int index) {
    switch (index) {
      // in progress
      case 1:
        return ColorStyleModel(Colors.black, Colors.white);
      case 2:
        return ColorStyleModel(Colors.black, Colors.yellow);
      case 3:
        return ColorStyleModel(Colors.white, Colors.green);
      case 4:
        return ColorStyleModel(Colors.white, Colors.red);
      default:
        return ColorStyleModel(Colors.black, Colors.white);
    }
  }
}
