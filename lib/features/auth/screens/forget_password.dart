import 'package:exam_feed/app/router_paths.dart';
import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/core/utils/spacer.dart';
import 'package:exam_feed/core/utils/validators.dart';
import 'package:exam_feed/core/widgets/buttons.dart';
import 'package:exam_feed/core/widgets/textfields.dart';
import 'package:exam_feed/resources/colors.dart';

class ForgatPassword extends StatefulWidget {
  const ForgatPassword({super.key});

  @override
  State<ForgatPassword> createState() => _ForgatPasswordState();
}

class _ForgatPasswordState extends State<ForgatPassword> {
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
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
                'Forgotten Password?',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: AppColors.primaryColor,
                ),
              ),
              YMargin(8),
              Text(
                'Enter your gmail account to get a code for\nresetting your password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: AppColors.pureBlack,
                ),
              ),
              YMargin(55),
              PrimaryInputField(
                controller: _emailController,
                label: 'Email / Name',
                context: context,
                required: true,
                validator: (val) => validateEmail(val),
              ),
              YMargin(91),
              CustomElevatedButton(
                text: 'Get Code',
                onPressed: () {
                  context.pushReplacementNamed(AppPath.auth.otp.path,
                      queryParameters: {
                        'isReset': 'true',
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
