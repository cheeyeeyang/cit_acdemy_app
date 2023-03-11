import 'package:flutter/material.dart';
class CustomWidget extends StatelessWidget {
  const CustomWidget({
    Key? key,
    required this.text,
    this.fontSize,
    this.color,
    this.textAlign,
    this.fontWeight,
  }) : super(key: key);

  final String text;
  final TextAlign? textAlign;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
      return Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontFamily: "Noto Sans Lao",
          fontWeight: fontWeight,
          decoration: TextDecoration.none
        ),
      );
  }
}
