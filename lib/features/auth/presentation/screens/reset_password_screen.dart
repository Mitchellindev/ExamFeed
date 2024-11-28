import 'package:exam_feed/config/router/routes.dart';
import 'package:exam_feed/core/constants/app_colors.dart';
import 'package:exam_feed/core/validator/validator.dart';
import 'package:exam_feed/core/widgets/input_field_widget.dart';
import 'package:exam_feed/core/widgets/loading_widget.dart';
import 'package:exam_feed/core/widgets/primary_button.dart';
import 'package:exam_feed/core/widgets/snackbar.dart';
import 'package:exam_feed/core/widgets/text_widget.dart';
import 'package:exam_feed/features/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});
  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late GlobalKey<FormFieldState> newPasswordKey;
  late GlobalKey<FormFieldState> confirmPasswordKey;

  bool obscureText = true;
  String? newPassword = '';
  String? confirmPassword = '';

  @override
  void initState() {
    newPasswordKey = GlobalKey<FormFieldState>();
    confirmPasswordKey = GlobalKey<FormFieldState>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final String token = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SafeArea(
            child: ListView(
          children: [
            SizedBox(height: 84.h),
            TextWidget(
              text: "Reset password",
              textAlign: TextAlign.center,
              fontSize: 18.sp,
              fontWeight: FontWeight.w300,
              color: AppColors.primary,
            ),
            SizedBox(height: 37.h),
            InputFieldWidget(
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              label: "New password",
              obscureText: !obscureText,
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
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              label: "Confirm new password",
              obscureText: !obscureText,
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
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthStateError) {
                  InfoSnackBar.showErrorSnackBar(
                      context, state.authError.errorMessage);
                } else if (state is AuthStatePasswordResetSuccess) {
                  Navigator.pushNamed(context, Routes.login);
                }
              },
              builder: (context, state) {
                return state is AuthStateIsLoading
                    ? const LoadingWidget()
                    : PrimaryButton(
                        label: "Save",
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context).add(
                            AuthEventResetPassword(
                              password: confirmPassword ?? '',
                              token: ModalRoute.of(context)!.settings.arguments
                                  as String,
                            ),
                          );
                        },
                        labelColor: AppColors.white,
                        labelFontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        isEnabled: true,
                        backgroundColor: AppColors.primary);
              },
            ),
          ],
        )),
      ),
    );
  }
}