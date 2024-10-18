import 'package:exam_feed/core/constants/app_colors.dart';
import 'package:exam_feed/core/widgets/primary_button.dart';
import 'package:exam_feed/core/widgets/text_widget.dart';
import 'package:exam_feed/features/home/presentation/widgets/chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedSubjectScreen extends StatelessWidget {
  const FeaturedSubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: 'Featured Subjects',
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.primary,
        ),
        leadingWidth: 30.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 13.w),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: AppColors.primary,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.w),
        child: ListView(
          children: [
            Card(
              surfaceTintColor: AppColors.white,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    child: Image.asset(
                      'assets/images/123.png',
                      width: 130.w,
                      height: 140.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      width: double.infinity.w,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.w, right: 9.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                  text: 'W.A.S.S.C.E  2020',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primary,
                                ),
                                Image.asset(
                                  'assets/images/bookmark.png',
                                  width: 18.w,
                                  height: 18.h,
                                )
                              ],
                            ),
                            TextWidget(
                              text: 'General Mathematics Questions',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary,
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                ChipWidget(
                                  avatar: 'assets/images/star.png',
                                  width: 10.w,
                                  label: '3.5',
                                ),
                                SizedBox(width: 10.h),
                                const ChipWidget(
                                  avatar: 'assets/images/timer.png',
                                  label: '1hr 30mins',
                                ),
                                SizedBox(width: 10.h),
                                const ChipWidget(
                                  avatar: 'assets/images/question.png',
                                  label: '50 question',
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Transform.translate(
                                    offset: Offset(-30.w, 0),
                                    child: Image.asset(
                                      'assets/images/waec.png',
                                      width: 50.w,
                                      height: 50.h,
                                    ),
                                  ),
                                  PrimaryButton(
                                    label: 'Start',
                                    size: Size(69.w, 0.h),
                                    labelFontSize: 14.sp,
                                    onPressed: () {},
                                    isEnabled: true,
                                    backgroundColor: AppColors.primary,
                                    verticalPadding: 10.h,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
