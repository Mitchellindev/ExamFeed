import 'package:exam_feed/config/router/routes.dart';
import 'package:exam_feed/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:exam_feed/features/auth/presentation/screens/login_screen.dart';
import 'package:exam_feed/features/auth/presentation/screens/otp_screen.dart';
import 'package:exam_feed/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:exam_feed/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:exam_feed/features/home/presentation/screens/bottom_nav_screen.dart';
import 'package:exam_feed/features/profile/presentation/screens/change_name_and_gmail_screen.dart';
import 'package:exam_feed/features/home/presentation/screens/featured_subject_screen.dart';
import 'package:exam_feed/features/onboarding/screens/splash_screen.dart';
import 'package:exam_feed/features/profile/presentation/screens/saved.dart';
import 'package:exam_feed/features/profile/presentation/screens/update_password_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );
      case Routes.otp:
        return MaterialPageRoute(
          builder: (_) => const OtpScreen(),
        );
      case Routes.resetPassword:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordScreen(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const BottomNavScreen(),
        );
      case Routes.featuredSubjects:
        return MaterialPageRoute(
          builder: (_) => const FeaturedSubjectScreen(),
        );
      case Routes.changeNameAndGmail:
        return MaterialPageRoute(
          builder: (_) => const ChangeNameAndGmailScreen(),
        );
      case Routes.updatePassword:
        return MaterialPageRoute(
          builder: (_) => const UpdatePasswordScreen(),
        );
      case Routes.savedQuestionsNewsAndSubjects:
        return MaterialPageRoute(
          builder: (_) => const TabBarScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SizedBox(),
        );
    }
  }
}
