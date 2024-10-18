import 'package:exam_feed/config/router/routes.dart';
import 'package:exam_feed/core/constants/app_colors.dart';
import 'package:exam_feed/core/validator/validator.dart';
import 'package:exam_feed/core/widgets/input_field_widget.dart';
import 'package:exam_feed/core/widgets/primary_button.dart';
import 'package:exam_feed/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late GlobalKey<FormFieldState> emailKey;
  bool? emailIsValid = false;
  @override
  void initState() {
    emailKey = GlobalKey<FormFieldState>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SafeArea(
            child: ListView(
          children: [
            SizedBox(height: 30.h),
            const TextWidget(
              text: "Forgotten Password?",
              textAlign: TextAlign.center,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
            SizedBox(height: 7.h),
            const TextWidget(
              text:
                  "Enter your gmail account to get a code for resetting your password",
              textAlign: TextAlign.center,
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: AppColors.black,
            ),
            SizedBox(height: 55.h),
            InputFieldWidget(
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              label: 'Email',
              enabledBorderRadius: 10,
              fontWeight: FontWeight.w300,
              validator: (p0) {
                final emailState =
                    Validator.validateEmail(emailKey.currentState?.value);
                return emailState;
              },
              onChanged: (val) {
                setState(() {
                  emailIsValid = emailKey.currentState!.validate();
                });
              },
              textFieldkey: emailKey,
            ),
            const SizedBox(
              height: 32,
            ),
            PrimaryButton(
              label: "Get Code",
              onPressed: () {
                Navigator.pushNamed(context, Routes.otp);
              },
              labelColor: AppColors.white,
              labelFontSize: 16.sp,
              fontWeight: FontWeight.w500,
              isEnabled: emailIsValid!,
              backgroundColor:
                  emailIsValid! ? AppColors.primary : AppColors.greyButton,
            ),
          ],
        )),
      ),
    );
  }
}
