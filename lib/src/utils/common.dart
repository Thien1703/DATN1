import 'package:flutter/material.dart';

class UtilCommon {
  static BoxDecoration defautBox({
    Color? bgColor,
    double withBd = 0,
    Color? bdColor,
    double radius = 12,
  }) {
    return BoxDecoration(
        border: Border.all(color: bdColor ?? Colors.white, width: withBd),
        color: bgColor ?? Colors.white,
        borderRadius: BorderRadius.circular(
          radius,
        ));
  }

  static Text textH1(
      {required String text, Color? color, FontWeight? fontWeight, double size = 20.0}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          color: color ?? Colors.black,
          fontWeight: fontWeight ?? FontWeight.bold),
    );
  }
  static Text textSubTitle3(
      {required String text, Color? color, FontWeight? fontWeight}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 13,
          color: color ?? Colors.black,
          fontWeight: fontWeight ?? FontWeight.w600),
    );
  }
}
