import 'package:exam_feed/config/router/routes.dart';
import 'package:exam_feed/core/constants/app_colors.dart';
import 'package:exam_feed/core/validator/validator.dart';
import 'package:exam_feed/core/widgets/icon_bottom.dart';
import 'package:exam_feed/core/widgets/input_field_widget.dart';
import 'package:exam_feed/core/widgets/loading_widget.dart';
import 'package:exam_feed/core/widgets/primary_button.dart';
import 'package:exam_feed/core/widgets/snackbar.dart';
import 'package:exam_feed/core/widgets/text_widget.dart';
import 'package:exam_feed/features/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late GlobalKey<FormFieldState> nameKey;
  late GlobalKey<FormFieldState> emailKey;
  late GlobalKey<FormFieldState> passwordKey;
  late GlobalKey<FormFieldState> confirmPasswordKey;

  bool obscureText = true;
  String? fullName = '';
  String? email = '';
  String? password = '';
  String? confirmPassword = '';
  bool formIsValid = false;

  @override
  void initState() {
    nameKey = GlobalKey<FormFieldState>();
    emailKey = GlobalKey<FormFieldState>();
    passwordKey = GlobalKey<FormFieldState>();
    confirmPasswordKey = GlobalKey<FormFieldState>();

    super.initState();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextWidget(
                    text: "Create an account",
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                  SizedBox(height: 8.h),
                  TextWidget(
                    text:
                        'Create your account today and take the first step towards mastering your exams.',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    textAlign: TextAlign.center,
                    color: AppColors.black,
                  ),
                  SizedBox(height: 24.h),
                  InputFieldWidget(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    label: "Name",
                    enabledBorderRadius: 10,
                    fontWeight: FontWeight.w300,
                    key: nameKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      return Validator.validateText(val, "Name");
                    },
                    onChanged: (val) {
                      setState(() {
                        fullName = val;
                      });
                    },
                  ),
                  InputFieldWidget(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    label: "Email",
                    enabledBorderRadius: 10,
                    fontWeight: FontWeight.w300,
                    key: emailKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      return Validator.validateEmail(val);
                    },
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  InputFieldWidget(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    label: "Password",
                    obscureText: !obscureText,
                    key: passwordKey,
                    enabledBorderRadius: 10,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      final passwordIsValid = Validator.validatePassword(val);
                      return passwordIsValid;
                    },
                    onChanged: (val) {
                      setState(() {
                        password = val;
                        passwordKey.currentState?.validate();
                      });
                    },
                  ),
                  InputFieldWidget(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    label: "Confirm password",
                    obscureText: !obscureText,
                    key: confirmPasswordKey,
                    enabledBorderRadius: 10,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      final confirmPasswordIsValid =
                          Validator.validatePassword(val);
                      return confirmPasswordIsValid;
                    },
                    onChanged: (val) {
                      setState(() {
                        confirmPassword = val;
                        confirmPasswordKey.currentState?.validate();
                      });
                    },
                  ),
                  SizedBox(height: 40.h),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthStateError) {
                        InfoSnackBar.showErrorSnackBar(
                            context, state.authError.errorMessage);
                      }
                      if (state is AuthStateIsRegistered) {
                        Navigator.pushNamed(context, Routes.home);
                      }
                    },
                    builder: (context, state) {
                      return state is AuthStateIsLoading
                          ? const LoadingWidget()
                          : PrimaryButton(
                              label: "Create an account",
                              onPressed: () {
                                context.read<AuthBloc>().add(
                                      AuthEventSignup(
                                        fullName: fullName ?? '',
                                        email: email ?? '',
                                        password: password ?? '',
                                        confirmPassword: confirmPassword ?? '',
                                      ),
                                    );
                              },
                              isEnabled: true,
                              labelColor: AppColors.white,
                              labelFontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              backgroundColor: AppColors.primary,
                            );
                    },
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.login);
                        },
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "Already have an account? ",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.textGrey,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              TextSpan(
                                text: 'Log In',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 22.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 160.w, child: const Divider()),
                      TextWidget(
                        text: "Or",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300,
                      ),
                      SizedBox(width: 150.w, child: const Divider()),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  IconButtonWidget(
                    label: 'Continue with Google',
                    icon: 'assets/images/google_logo.png',
                    backgroundColor: AppColors.greyButton,
                    borderColor: AppColors.greyBackground,
                    textColor: AppColors.white,
                    fontWeight: FontWeight.w400,
                    onPressed: () {},
                  ),
                  SizedBox(height: 20.h),
                  IconButtonWidget(
                    label: 'Continue with Apple',
                    icon: 'assets/images/apple_logo.png',
                    backgroundColor: AppColors.white,
                    borderColor: AppColors.black,
                    textColor: AppColors.black,
                    fontWeight: FontWeight.w300,
                    onPressed: () {},
                  ),
                  SizedBox(height: 20.h),
                  IconButtonWidget(
                    label: 'Continue with Facebook',
                    icon: 'assets/images/facebook_logo.png',
                    backgroundColor: AppColors.white,
                    borderColor: AppColors.black,
                    textColor: AppColors.black,
                    fontWeight: FontWeight.w300,
                    onPressed: () {},
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
