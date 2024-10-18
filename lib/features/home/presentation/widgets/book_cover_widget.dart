import 'package:exam_feed/core/constants/app_colors.dart';
import 'package:exam_feed/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextBookWidget extends StatelessWidget {
  const TextBookWidget({
    super.key,
    required this.bookCover,
    required this.bookTitle,
    required this.bookNumber,
  });

  final String bookCover;
  final String bookTitle;
  final String bookNumber;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(bookTitle),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 12.94.h,
                horizontal: 10.w,
              ),
              color: AppColors.lightBlue,
              child: TextWidget(
                text: bookNumber,
                color: AppColors.white,
                fontWeight: FontWeight.w700,
                fontSize: 12.25.sp,
              ),
            )
          ],
        ),
        Container(
          width: 94.w,
          height: 167.h,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(bookCover), fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }
}
