// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';

class TextFieldApp extends StatelessWidget {
  const TextFieldApp(
      {Key? key,
      required this.text,
      this.fontSize,
      this.color,
      this.fontWeight,
      required this.width,
      required this.height,
      required this.borderRadius,
      this.suffixicon,
      this.preffixicon,
      this.contentPadding,
      this.controller,
      this.fillcolor,
      this.filled,
      this.elevation,
      this.borderside,
      this.borderstyle
      })
      : super(key: key);

  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final double width;
  final double height;
  final double borderRadius;
  final Icon? suffixicon;
  final Icon? preffixicon;
  final double? contentPadding;
  final TextEditingController? controller;
  final Color? fillcolor;
  final bool? filled;
  final double? elevation;
  final double? borderside;
  final BorderStyle? borderstyle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Material(
        elevation: elevation ?? 0.0,
        shadowColor: Colors.grey,
        borderRadius: BorderRadius.circular(borderRadius),
        child: TextField(
          controller: controller,
          expands: true,
          minLines: null,
          maxLines: null,
          style: TextStyle(fontSize: fontSize, fontFamily: 'Noto Sans Lao'),
          decoration: InputDecoration(
              filled: filled,
              fillColor: fillcolor,
              border:  OutlineInputBorder(
                  borderSide: BorderSide(width: borderside ?? 0.0, style: borderstyle ?? BorderStyle.none),
                  // borderRadius: BorderRadius.all(Radius.circular(50.0))
              ),
              hintText: text,
              contentPadding: EdgeInsets.all(contentPadding ?? 0.0),
              suffixIcon: suffixicon,
              prefixIcon: preffixicon
          ),
        ),
      ),
    );
  }
}
