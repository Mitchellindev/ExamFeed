import 'package:exam_feed/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.text,
      this.fontSize = 14,
      this.fontWeight = FontWeight.normal,
      this.color = AppColors.primary,
      this.textAlign,
      this.overflow,
      this.onTap,
      this.onLongPress,
      this.textDecoration,
      this.letterSpacing,
      this.fontStyle,
      this.maxLines = 1});
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final TextDecoration? textDecoration;
  final FontStyle? fontStyle;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Text(
        maxLines: maxLines,
        text,
        textAlign: textAlign,
        overflow: overflow,
        style: TextStyle(
            color: color,
            decoration: textDecoration,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: "satoshi",
            fontStyle: fontStyle,
            letterSpacing: letterSpacing),
      ),
    );
  }
}
