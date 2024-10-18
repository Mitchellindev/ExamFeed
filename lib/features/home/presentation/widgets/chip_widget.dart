import 'package:exam_feed/core/constants/app_colors.dart';
import 'package:exam_feed/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget({
    super.key,
    required this.avatar,
    required this.label,
    this.labelSize = 10,
    this.width = 10,
  });

  final String avatar;
  final String label;
  final double labelSize;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3.w, horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Image.asset(
            avatar,
            width: width,
          ),
          SizedBox(width: 2.w),
          TextWidget(
            text: label,
            fontSize: labelSize,
            fontWeight: FontWeight.w300,
          )
        ],
      ),
    );
  }
}
