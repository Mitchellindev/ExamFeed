import 'package:exam_feed/core/constants/app_colors.dart';
import 'package:exam_feed/core/widgets/primary_button.dart';
import 'package:exam_feed/core/widgets/text_widget.dart';
import 'package:exam_feed/features/home/presentation/widgets/chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedSubjects extends StatelessWidget {
  const FeaturedSubjects({
    super.key,
    required this.subjectCover,
    required this.examBody,
    required this.subject,
    required this.rating,
    required this.timer,
    required this.question,
  });

  final String subjectCover;
  final String examBody;
  final String subject;
  final String rating;
  final String timer;
  final String question;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.w,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity.w,
            child: Container(
              height: 166.h,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  image: DecorationImage(
                      image: AssetImage(subjectCover), fit: BoxFit.cover)),
              child: Transform.translate(
                offset: const Offset(0, 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/images/waec.png',
                      width: 80.w,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: examBody,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
                TextWidget(
                  text: subject,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: AppColors.black,
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    ChipWidget(
                      avatar: 'assets/images/star.png',
                      label: rating,
                    ),
                    SizedBox(width: 10.h),
                    ChipWidget(
                      avatar: 'assets/images/timer.png',
                      label: timer,
                    ),
                    SizedBox(width: 10.h),
                    ChipWidget(
                      avatar: 'assets/images/question.png',
                      label: question,
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/bookmark.png'),
                    Flexible(
                      child: PrimaryButton(
                        label: 'Start',
                        size: Size(100.w, 0.h),
                        labelFontSize: 14.sp,
                        onPressed: () {},
                        isEnabled: true,
                        backgroundColor: AppColors.primary,
                        // width: 100.w,
                        verticalPadding: 10.h,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
