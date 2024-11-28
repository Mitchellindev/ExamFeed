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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late GlobalKey<FormFieldState> emailKey;
  late GlobalKey<FormFieldState> passwordKey;
  bool obscureText = true;
  String? email = '';
  String? password = '';

  @override
  void initState() {
    emailKey = GlobalKey<FormFieldState>();
    passwordKey = GlobalKey<FormFieldState>();

    super.initState();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextWidget(
                  text: "Welcome back!",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
                SizedBox(height: 8.h),
                TextWidget(
                  text:
                      'We\'re thrilled to have you back! Dive right in and pick up right where you left off.',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.center,
                  color: AppColors.black,
                ),
                SizedBox(height: 24.h),
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
                      setState(() {
                        email = val;
                      });
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextWidget(
                        text: 'Remember me',
                        color: AppColors.primary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.forgotPassword);
                        },
                        child: TextWidget(
                          text: 'Forgot password?',
                          color: AppColors.primary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 70.h),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthStateError) {
                      InfoSnackBar.showErrorSnackBar(
                          context, state.authError.errorMessage);
                    }
                    if (state is AuthStateIsLoggedIn) {
                      Navigator.popAndPushNamed(context, Routes.home);
                    }
                    if (state is AuthStateEmailNotVerified) {
                      InfoSnackBar.showErrorSnackBar(context, state.message);
                    }
                  },
                  builder: (context, state) {
                    return state is AuthStateIsLoading
                        ? const LoadingWidget()
                        : PrimaryButton(
                            label: "Sign In",
                            onPressed: () {
                              context.read<AuthBloc>().add(
                                    AuthEventLogin(
                                        email: email ?? '',
                                        password: password ?? ''),
                                  );
                            },
                            isEnabled: true,
                            labelColor: AppColors.white,
                            labelFontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            backgroundColor: AppColors.primary);
                  },
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.signUp);
                      },
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Don`t have an account yet? ",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.textGrey,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            TextSpan(
                              text: 'Create an account',
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
                SizedBox(height: 26.h),
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

                // BlocConsumer<AuthBloc, AuthState>(
                //   listener: (context, state) {
                //     if (state is AuthStateError) {
                //       InfoSnackBar.showErrorSnackBar(
                //           context, state.error.errorMessage);
                //     }
                //     if (state is AuthStateIsLoggedIn) {
                //       Navigator.of(context).popAndPushNamed(
                //         Routes.todoList,
                //         arguments: state.user,
                //       );
                //     }
                //   },
                //   builder: (context, state) {
                //     return state is AuthStateIsLoading
                //         ? const LoadingWidget()
                //         : PrimaryButton(
                //             label: "Sign In",
                //             onPressed: () {
                //               final user =
                //                   UserData(email: email, password: password);
                //               final bool formIsValid =
                //                   formKey.currentState?.validate() ?? false;
                //               if (formIsValid) {
                //                 context
                //                     .read<AuthBloc>()
                //                     .add(AuthEventLoginUser(userData: user));
                //               }
                //             },
                //             isEnabled: true);
                //   },
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
