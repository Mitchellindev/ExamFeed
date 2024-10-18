import 'package:exam_feed/core/constants/app_colors.dart';
import 'package:exam_feed/core/widgets/primary_button.dart';
import 'package:exam_feed/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedQuestionWidget extends StatelessWidget {
  const SavedQuestionWidget({
    super.key,
    required this.examBody,
    required this.subject,
    required this.question,
    required this.onPressed,
  });
  final String examBody;
  final String subject;
  final String question;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
        surfaceTintColor: AppColors.white,
        elevation: 1.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          width: double.infinity.w,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Row(
              children: [
                Image.asset('assets/images/triangle.png'),
                Flexible(
                  child: SizedBox(
                    width: double.infinity.w,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(
                                text: examBody,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary,
                              ),
                              Image.asset(
                                'assets/images/bookmark_filled.png',
                                width: 18.w,
                                height: 18.h,
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          TextWidget(
                            text: subject,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                          SizedBox(height: 16.h),
                          TextWidget(
                            maxLines: 10,
                            text: question,
                            fontWeight: FontWeight.w300,
                            fontSize: 14.sp,
                            color: AppColors.black,
                          ),
                          SizedBox(height: 16.h),
                          PrimaryButton(
                            label: 'Display answer',
                            labelFontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            verticalPadding: 9.h,
                            size: Size(160.w, 37.h),
                            onPressed: onPressed,
                            isEnabled: true,
                            backgroundColor: AppColors.primary,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
