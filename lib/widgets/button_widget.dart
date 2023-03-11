import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key,
      required this.text,
      this.fontSize,
      this.color,
      this.fontWeight,
      required this.width,
      required this.height,
      required this.borderRadius,
      this.backgroundcolor,
      this.blurradius,
      this.boxshadowcolor
      })
      : super(key: key);

  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final double width;
  final double height;
  final double borderRadius;
  final Color? backgroundcolor;
  final double? blurradius;
  final Color? boxshadowcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: backgroundcolor,
          boxShadow:  [
            BoxShadow(
                blurRadius: blurradius ?? 0.0, color: boxshadowcolor ?? Colors.white, offset: const Offset(2, 2))
          ]),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              decoration: TextDecoration.none,
              fontWeight: fontWeight,
              color: color,
              fontSize: fontSize,
              fontFamily: 'Noto Sans Lao'),
        ),
      ),
    );
  }
}
