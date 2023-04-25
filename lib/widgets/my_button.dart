import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    this.text = "test",
    this.color,
    this.onTap,
    this.width = double.infinity,
    this.textStyle,
    this.height,
    this.borderColor = Colors.transparent,
  });
  final String text;
  final Color? color;
  final Color borderColor;
  final double width;
  final double? height;
  final Function()? onTap;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 2),
          color: color,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Center(
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
