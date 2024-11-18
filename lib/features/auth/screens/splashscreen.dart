import 'package:exam_feed/app/router_paths.dart';
import 'package:exam_feed/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _loading = false;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2));

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(),
        child: Center(
          child: Image.asset(
            Images.logo,
          ).animate(
            onComplete: (controller) {
              context.pushReplacement(AppPath.splash.onboardingScreen.path);
            },
          ).slide(
            duration: Duration(milliseconds: 1000),
          ),
        ),
      ),
    );
  }
}
