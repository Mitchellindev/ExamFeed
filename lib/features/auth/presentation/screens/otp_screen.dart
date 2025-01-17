import 'dart:async';

import 'package:exam_feed/core/constants/app_colors.dart';
import 'package:exam_feed/core/widgets/primary_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../../config/router/routes.dart';
import '../../../../core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otp = '';

  Timer? countdownTimer;
  Duration myDuration = const Duration(seconds: 30);

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();

    setState(() {
      myDuration = const Duration(seconds: 30);
      canResendCode = false;
    });
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
        canResendCode = true;
        stopTimer();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void initState() {
    super.initState();

    startTimer();

    super.initState();
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  bool canResendCode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    text:
                        "Enter verification code to that was sent to \ndesigntesting@gmail.com",
                    fontSize: 14.sp,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w300,
                    color: AppColors.black,
                  ),
                  SizedBox(height: 60.h),
                  SizedBox(
                    height: 50.h,
                    child: Center(
                      child: OTPTextField(
                        otpFieldStyle: OtpFieldStyle(
                          borderColor: AppColors.greyBackground,
                          focusBorderColor: AppColors.black,
                        ),
                        length: 4,
                        width: double.infinity,
                        fieldWidth: 86.w,
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                        textFieldAlignment: MainAxisAlignment.spaceEvenly,
                        fieldStyle: FieldStyle.box,
                        onChanged: (val) {
                          otp = val;
                          debugPrint(val);
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 130.h,
                  ),
                  PrimaryButton(
                    label: "Verify Now",
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.resetPassword);
                    },
                    isEnabled: otp.length == 4,
                    backgroundColor: AppColors.primary,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Didn`t get code yet? ',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w300,
                            color: AppColors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'Resend Code',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
