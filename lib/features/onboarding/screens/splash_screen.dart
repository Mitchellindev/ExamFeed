import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:exam_feed/core/constants/app_colors.dart';
import 'package:exam_feed/features/onboarding/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: AppColors.white,
      splash: Image.asset('assets/images/app_logo.png'),
      nextScreen: const OnboardingScreen(),
      duration: 2000,
    );
  }
}
