import 'package:flutter/material.dart';

import '../constants.dart';

class RekapText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const RekapText(
    this.text, {
    this.color,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? kSarmadiBlackColor,
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontFamily: 'Poppins',
      ),
    );
  }
}
