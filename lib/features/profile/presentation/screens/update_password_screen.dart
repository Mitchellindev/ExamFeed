import 'package:exam_feed/config/router/routes.dart';
import 'package:exam_feed/core/constants/app_colors.dart';
import 'package:exam_feed/core/validator/validator.dart';
import 'package:exam_feed/core/widgets/input_field_widget.dart';
import 'package:exam_feed/core/widgets/primary_button.dart';
import 'package:exam_feed/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});
  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  late GlobalKey<FormFieldState> previousPasswordKey;
  late GlobalKey<FormFieldState> newPasswordKey;
  late GlobalKey<FormFieldState> confirmPasswordKey;

  bool obscureText = true;
  String? previousPassword = '';
  String? newPassword = '';
  String? confirmPassword = '';

  @override
  void initState() {
    previousPasswordKey = GlobalKey<FormFieldState>();
    newPasswordKey = GlobalKey<FormFieldState>();
    confirmPasswordKey = GlobalKey<FormFieldState>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: AppColors.primary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TextWidget(
          text: 'Update password',
          fontSize: 18.sp,
          fontWeight: FontWeight.w300,
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SafeArea(
            child: ListView(
          children: [
            SizedBox(height: 47.h),
            InputFieldWidget(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              label: "Previous password",
              obscureText: obscureText,
              key: previousPasswordKey,
              enabledBorderRadius: 10,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (val) {
                final previousPasswordIsValid = Validator.validatePassword(val);
                return previousPasswordIsValid;
              },
              onChanged: (val) {
                setState(() {
                  previousPassword = val;
                  previousPasswordKey.currentState?.validate();
                });
              },
            ),
            InputFieldWidget(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              label: "New password",
              obscureText: obscureText,
              key: newPasswordKey,
              enabledBorderRadius: 10,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (val) {
                final passwordIsValid = Validator.validatePassword(val);
                return passwordIsValid;
              },
              onChanged: (val) {
                setState(() {
                  newPassword = val;
                  newPasswordKey.currentState?.validate();
                });
              },
            ),
            InputFieldWidget(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              label: "Confirm new password",
              obscureText: obscureText,
              key: confirmPasswordKey,
              enabledBorderRadius: 10,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (val) {
                final confirmPasswordIsValid = Validator.validatePassword(val);
                return confirmPasswordIsValid;
              },
              onChanged: (val) {
                setState(() {
                  confirmPassword = val;
                  confirmPasswordKey.currentState?.validate();
                });
              },
            ),
            const SizedBox(
              height: 32,
            ),
            PrimaryButton(
                label: "Save",
                onPressed: () {
                  Navigator.pushNamed(context, Routes.login);
                },
                labelColor: AppColors.white,
                labelFontSize: 16.sp,
                fontWeight: FontWeight.w500,
                isEnabled: true,
                backgroundColor: AppColors.primary),
          ],
        )),
      ),
    );
  }
}
