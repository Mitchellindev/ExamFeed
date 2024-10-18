import 'package:exam_feed/core/constants/app_colors.dart';
import 'package:exam_feed/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreenTwo extends StatelessWidget {
  const OnboardingScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        // color: Colors.amber,
        child: Stack(
          children: [
            Container(
              height: 500.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/onboarding_image_two.png'),
                ),
              ),
            ),
            Positioned(
              top: 420,
              left: 13,
              right: 13,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.w),
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        // borderRadius: BorderRadius.circular(125),
                        // shape: BoxShape.circle,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 60.h),
                          TextWidget(
                            text: 'Explore Past',
                            fontSize: 27.sp,
                            fontWeight: FontWeight.w800,
                          ),
                          TextWidget(
                            text: 'Exam Questions',
                            fontSize: 27.sp,
                            fontWeight: FontWeight.w800,
                          ),
                          SizedBox(height: 20.h),
                          TextWidget(
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            text:
                                'Tailor your learning experience by selecting \nyour desired exam type, subject, and difficulty \nlevel.',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
