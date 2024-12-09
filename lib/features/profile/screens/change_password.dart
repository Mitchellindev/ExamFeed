import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/core/utils/spacer.dart';
import 'package:exam_feed/core/widgets/buttons.dart';
import 'package:exam_feed/core/widgets/custom_app_bar.dart';
import 'package:exam_feed/core/widgets/textfields.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _previousPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _previousPasswordController.dispose();

    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      print('valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text('Reset password'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              YMargin(25),
              PrimaryInputField(
                context: context,
                label: 'Previous Password',
                required: true,
                controller: _previousPasswordController,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please enter your previous password';
                  }
                  return null;
                },
              ),
              YMargin(16),
              PrimaryInputField(
                context: context,
                label: 'New Password',
                required: true,
                controller: _passwordController,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please enter your new password';
                  }
                  return null;
                },
              ),
              YMargin(16),
              PrimaryInputField(
                context: context,
                label: 'Confirm New Password',
                required: true,
                controller: _confirmPasswordController,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please confirm your new password';
                  } else if (val != _passwordController.text) {
                    return 'Passwords do not match';
                  }

                  return null;
                },
              ),
              YMargin(100),
              CustomElevatedButton(
                text: 'Save',
                onPressed: _submit,
              )
            ],
          ),
        ),
      ),
    );
  }
}
