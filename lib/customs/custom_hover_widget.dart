import 'package:flutter/material.dart';

class OnHoverWidget extends StatefulWidget {
  const OnHoverWidget({super.key, required this.child});
  final Widget child;
  @override
  State<OnHoverWidget> createState() => _OnHoverWidgetState();
}

class _OnHoverWidgetState extends State<OnHoverWidget> {
  bool isEntered = false;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hover = Matrix4.identity()..scale(1.05);
    final transform = isEntered ? hover : Matrix4.identity();

    return MouseRegion(
        onEnter: (event) => setState(() {
              isEntered = true;
            }),
        onExit: (event) => setState(() {
              isEntered = false;
            }),
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            transform: transform,
            child: widget.child));
  }
}