import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  final double heigth;
  final double width;
  final EdgeInsets padding;
  final String? text = "";
  final Color color;
  final Color borderColor;

  const Dot({
    super.key,
    this.heigth = 10,
    this.width = 10,
    this.padding = const EdgeInsets.all(0),
    this.color = Colors.red,
    this.borderColor = Colors.white
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heigth,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: const BorderRadius.all(Radius.circular(100))
      ),
    );
  }
}
