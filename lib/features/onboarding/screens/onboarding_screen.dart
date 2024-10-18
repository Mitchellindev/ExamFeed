import 'package:exam_feed/config/router/routes.dart';
import 'package:exam_feed/core/constants/app_colors.dart';
import 'package:exam_feed/features/onboarding/screens/onboarding_screen_one.dart';
import 'package:exam_feed/features/onboarding/screens/onboarding_screen_three.dart';
import 'package:exam_feed/features/onboarding/screens/onboarding_screen_two.dart';
import 'package:exam_feed/features/onboarding/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //pageview
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            controller: _controller,
            scrollDirection: Axis.horizontal,
            children: const [
              OnboardingScreenone(),
              OnboardingScreenTwo(),
              OnboardingScreenThree(),
            ],
          ),

          //dot indicators
          Container(
            alignment: const Alignment(0, 0.6),
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 20),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  onDotClicked: (index) {
                    _controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  effect: WormEffect(
                    activeDotColor: AppColors.primary,
                    dotHeight: 10.h,
                    dotWidth: 10.w,
                    spacing: 6,
                    dotColor: AppColors.greyBackground,
                  ),
                ),
              ],
            ),
          ),
          //next button
          Container(
            alignment: const Alignment(0, 0.95),
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.login);
                  },
                  child: const Text(
                    'skip',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(width: 34.w),
                Flexible(
                  child: NextButtonWidget(
                    width: double.infinity,
                    label: 'Next',
                    fontWeight: FontWeight.w700,
                    backgroundColor: AppColors.primary,
                    borderColor: AppColors.primary,
                    textColor: AppColors.white,
                    onPressed: () {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                    icon: Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
