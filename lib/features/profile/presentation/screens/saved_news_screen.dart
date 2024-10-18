import 'package:exam_feed/core/constants/app_colors.dart';
import 'package:exam_feed/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedNewsScreen extends StatelessWidget {
  const SavedNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: ListView(children: [
          SizedBox(height: 32.h),
          Card(
              surfaceTintColor: AppColors.white,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                width: double.infinity.w,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                  child: Row(
                    children: [
                      Flexible(
                        child: SizedBox(
                          width: double.infinity.w,
                          child: Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: TextWidget(
                                    text: 'The Guardian  .  2h',
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.sp,
                                    color: AppColors.black,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                TextWidget(
                                  maxLines: 10,
                                  text:
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                                SizedBox(height: 24.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/like.png',
                                          width: 18.w,
                                          height: 18.h,
                                        ),
                                        SizedBox(width: 4.w),
                                        TextWidget(
                                          text: '73',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w300,
                                          color: AppColors.black,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/dislike.png',
                                          width: 18.w,
                                          height: 18.h,
                                        ),
                                        SizedBox(width: 4.w),
                                        TextWidget(
                                          text: '15',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w300,
                                          color: AppColors.black,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/message_text.png',
                                          width: 18.w,
                                          height: 18.h,
                                        ),
                                        SizedBox(width: 4.w),
                                        TextWidget(
                                          text: '26',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w300,
                                          color: AppColors.black,
                                        )
                                      ],
                                    ),
                                    Image.asset(
                                      'assets/images/bookmark_filled.png',
                                      width: 18.w,
                                      height: 18.h,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/news_image.png',
                        width: 140.w,
                        height: 140.h,
                      ),
                    ],
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}
