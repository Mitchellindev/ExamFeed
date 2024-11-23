import 'package:exam_feed/app/router_paths.dart';
import 'package:exam_feed/app/service_locator.dart';
import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/core/utils/spacer.dart';
import 'package:exam_feed/core/utils/toast_util.dart';
import 'package:exam_feed/core/utils/validators.dart';
import 'package:exam_feed/core/widgets/buttons.dart';
import 'package:exam_feed/core/widgets/textfields.dart';
import 'package:exam_feed/features/auth/provider/auth_provider.dart';
import 'package:exam_feed/features/dashboard/provider/dashboard_provider.dart';
import 'package:exam_feed/resources/colors.dart';
import 'package:exam_feed/resources/resources.dart';
import 'package:flutter/gestures.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    locator.setApiHandlerToken(
        '0xbS4TX1Wy3SwE2dNRHVyokJF5WwUNs3qOL6HFbMCra9c0c07f');
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<AuthenticationProvider>().login(
            email: _emailController.text,
            password: _passwordController.text,
            onSuccess: () {
              context.showSuccessMessage(message: 'Login successful');
              context.pushReplacement(AppPath.dashboard.path);
            },
            onError: (error) {
              context.showErrorMessage(message: error.message);
            },
          );
    }
  }

  void _onTest() {
    context.read<DashboardProvider>().orders();
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthenticationProvider>();
    final dash = context.watch<DashboardProvider>();
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome back!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: AppColors.primaryColor,
                  ),
                ),
                YMargin(8),
                Text(
                  'We\'re thrilled to have you back! Dive right in\nand pick up right where you left off.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, fontSize: 14),
                ),
                YMargin(27),
                PrimaryInputField(
                  controller: _emailController,
                  label: 'Email / Name',
                  context: context,
                  required: true,
                  validator: (val) => validateEmail(val),
                ),
                YMargin(16),
                PrimaryInputField(
                  controller: _passwordController,
                  label: 'Password',
                  context: context,
                  required: true,
                  validator: (val) => validatePassword(val),
                ),
                Row(children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Text(
                    'Remember me',
                    style: TextStyle(color: AppColors.neutral400),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      print(dash.pagingController.itemList!.length);
                      // context.push(AppPath.auth.forgetPassword.path);
                    },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ]),
                YMargin(48),
                CustomElevatedButton(
                  text: 'Log In',
                  onPressed: _onSubmit,
                  loading: auth.loginLoading,
                ),
                YMargin(16),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don`t have an account yet? ',
                        style: TextStyle(color: AppColors.neutral400),
                      ),
                      TextSpan(
                        text: 'Create an account',
                        style: TextStyle(color: AppColors.primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushReplacement(AppPath.auth.path);
                          },
                      ),
                    ],
                  ),
                ),
                YMargin(22),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: AppColors.neutral400,
                      ),
                    ),
                    XMargin(3),
                    Text(
                      'Or',
                      style:
                          TextStyle(color: AppColors.neutral400, fontSize: 16),
                    ),
                    XMargin(3),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: AppColors.neutral400,
                      ),
                    ),
                  ],
                ),
                YMargin(33),
                CustomElevatedButtonWithIcon(
                  text: 'Continue with Google',
                  onPressed: _onTest,
                  icon: SvgIcons.googleIcon,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
