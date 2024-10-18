import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.onPressed,
    this.fontWeight = FontWeight.w300,
    this.width = double.infinity,
  });

  final String label;
  final String icon;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final VoidCallback onPressed;
  final FontWeight? fontWeight;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              icon,
              width: 28.w,
              height: 28.h,
            ),
            SizedBox(width: 24.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: fontWeight,
                color: textColor,
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
