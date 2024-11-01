import 'dart:async';
import 'package:exam_feed/core/constants/app_colors.dart';
import 'package:exam_feed/core/widgets/loading_widget.dart';
import 'package:exam_feed/core/widgets/primary_button.dart';
import 'package:exam_feed/core/widgets/snackbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../../../../config/router/routes.dart';
import '../../../../core/widgets/text_widget.dart';
import '../../bloc/auth_bloc.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otp = '';
  Timer? countdownTimer;
  Duration myDuration = const Duration(seconds: 30);
  bool canResendCode = false;

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    countdownTimer?.cancel();
  }

  void resetTimer() {
    stopTimer();
    setState(() {
      myDuration = const Duration(seconds: 30);
      canResendCode = false;
    });
  }

  void setCountDown() {
    setState(() {
      final seconds = myDuration.inSeconds - 1;
      if (seconds < 0) {
        stopTimer();
        canResendCode = true;
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          children: [
            SizedBox(height: 120.h),
            TextWidget(
              text: "Enter Verification Code",
              fontSize: 24.sp,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
            SizedBox(height: 8.h),
            TextWidget(
              text: "Enter the code sent to your email.",
              fontSize: 14.sp,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w300,
              color: AppColors.black,
            ),
            SizedBox(height: 60.h),
            OTPTextField(
              otpFieldStyle: OtpFieldStyle(
                borderColor: AppColors.greyBackground,
                focusBorderColor: AppColors.black,
              ),
              length: 6,
              width: double.infinity,
              fieldWidth: 50.w,
              style: TextStyle(fontSize: 24.sp, color: AppColors.black),
              textFieldAlignment: MainAxisAlignment.spaceEvenly,
              fieldStyle: FieldStyle.box,
              onChanged: (val) => setState(() => otp = val),
            ),
            SizedBox(height: 30.h),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthStateError) {
                  InfoSnackBar.showErrorSnackBar(
                      context, state.authError.errorMessage);
                } else if (state is AuthStateOtpVerified) {
                  Navigator.pushNamed(context, Routes.resetPassword);
                }
              },
              builder: (context, state) {
                return state is AuthStateIsLoading
                    ? const LoadingWidget()
                    : PrimaryButton(
                        label: "Verify Now",
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context).add(
                            AuthEventVerifyOtp(token: otp),
                          );
                        },
                        isEnabled: otp.length == 6,
                        backgroundColor: AppColors.primary,
                      );
              },
            ),
            SizedBox(height: 20.h),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Didn`t get code yet? ',
                    style: TextStyle(fontSize: 14.sp, color: AppColors.black),
                  ),
                  TextSpan(
                    text: canResendCode ? 'Resend Code' : '',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        if (canResendCode) {
                          resetTimer();
                          BlocProvider.of<AuthBloc>(context)
                              .add(AuthEventForgetPassword("user@example.com"));
                        }
                      },
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}
