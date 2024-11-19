import 'package:exam_feed/app/router_paths.dart';
import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/core/utils/spacer.dart';
import 'package:exam_feed/core/utils/validators.dart';
import 'package:exam_feed/core/widgets/buttons.dart';
import 'package:exam_feed/core/widgets/textfields.dart';
import 'package:exam_feed/resources/colors.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              YMargin(114),
              Text(
                'Reset password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: AppColors.pureBlack,
                ),
              ),
              YMargin(14),
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
              YMargin(84),
              CustomElevatedButton(
                text: 'Save',
                onPressed: () {
                  context.pushReplacement(
                    AppPath.auth.login.path,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
