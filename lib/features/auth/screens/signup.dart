import 'package:exam_feed/app/router_paths.dart';
import 'package:exam_feed/app/service_locator.dart';
import 'package:exam_feed/core/storage/cache_storage.dart';
import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/core/utils/spacer.dart';
import 'package:exam_feed/core/utils/toast_util.dart';
import 'package:exam_feed/core/utils/validators.dart';
import 'package:exam_feed/core/widgets/buttons.dart';
import 'package:exam_feed/core/widgets/textfields.dart';
import 'package:exam_feed/features/auth/provider/auth_provider.dart';
import 'package:exam_feed/resources/colors.dart';
import 'package:exam_feed/resources/resources.dart';
import 'package:flutter/gestures.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void initState() {
   
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<AuthenticationProvider>().signUp(
            email: _emailController.text,
            password: _passwordController.text,
            confirmPassword: _confirmPasswordController.text,
            firstName: _nameController.text,
            onSuccess: () {
            
              context.showSuccessMessage(message: 'Signup successful');
              context.pushReplacement(AppPath.auth.login.path);
            },
            onError: (error) {
              context.showErrorMessage(message: error.message);
            },
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthenticationProvider>();

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
                  'Create an account',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: AppColors.primaryColor,
                  ),
                ),
                YMargin(8),
                Text(
                  'Create your account today and take the first\nstep towards mastering your exams.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, fontSize: 14),
                ),
                YMargin(27),
                PrimaryInputField(
                  controller: _nameController,
                  label: 'Full Name',
                  context: context,
                  required: true,
                  validator: (val) => validateName(val),
                ),
                YMargin(16),
                PrimaryInputField(
                  controller: _emailController,
                  label: 'Email',
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
                YMargin(16),
                PrimaryInputField(
                  controller: _confirmPasswordController,
                  label: 'Confirm Password',
                  context: context,
                  required: true,
                  validator: (val) =>
                      validateConfirmPassword(_passwordController.text, val),
                ),
                YMargin(48),
                CustomElevatedButton(
                  text: 'Create an account',
                  onPressed: _onSubmit,
                  loading: auth.signUpLoading,
                ),
                YMargin(16),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(color: AppColors.neutral400),
                      ),
                      TextSpan(
                        text: 'Log In',
                        style: TextStyle(color: AppColors.primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushReplacement(AppPath.auth.login.path);
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
                  onPressed: () {},
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
