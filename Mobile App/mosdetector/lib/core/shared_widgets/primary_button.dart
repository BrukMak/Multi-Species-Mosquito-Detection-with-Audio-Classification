// elevated button with color and action
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Function onPressed;
  final double height;
  final double width;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final Color textColor;
  final double borderRadius;

  const PrimaryButton(
      {super.key,
      required this.text,
      required this.backgroundColor,
      required this.onPressed,
      required this.height,
      required this.width,
      required this.fontFamily,
      required this.fontSize,
      required this.fontWeight,
      required this.textColor,
      required this.borderRadius
      });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: InkWell(
        onTap: () => onPressed(),
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          child: Text(
            text,
            style:  TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontFamily: fontFamily
            ),
          ),
        ),
      ),
    );
  }
}
