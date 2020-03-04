import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonTextStyles {
  TextStyle getNormalTextStyle({Color color = Colors.black}) =>
      TextStyle(fontSize: 16, color: color);

  TextStyle getMediumTextStyle({Color color = Colors.black}) =>
      TextStyle(fontSize: 20, color: color);

  TextStyle getLargeTextStyle({Color color = Colors.black}) =>
      TextStyle(fontSize: 24, color: color  );
}

CommonTextStyles commonTextStyles = CommonTextStyles();
