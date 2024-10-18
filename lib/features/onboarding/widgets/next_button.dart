import 'package:exam_feed/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class NextButtonWidget extends StatelessWidget {
  const NextButtonWidget({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.onPressed,
    this.fontWeight = FontWeight.w300,
    this.width = double.infinity,
    required this.icon,
  });

  final String label;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final VoidCallback onPressed;
  final FontWeight? fontWeight;
  final double? width;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: fontWeight,
                color: textColor,
              ),
            ),
            Icon(
              icon,
              color: AppColors.white,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
