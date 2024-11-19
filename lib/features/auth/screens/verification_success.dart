import 'package:exam_feed/app/router_paths.dart';
import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/core/utils/spacer.dart';
import 'package:exam_feed/core/widgets/buttons.dart';
import 'package:exam_feed/resources/colors.dart';
import 'package:exam_feed/resources/resources.dart';

class VerificationSuccess extends StatefulWidget {
  const VerificationSuccess({super.key, required this.isReset});
  final bool isReset;

  @override
  State<VerificationSuccess> createState() => _VerificationSuccessState();
}

class _VerificationSuccessState extends State<VerificationSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Verification Successful!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: AppColors.primaryColor,
                ),
              ),
              YMargin(8),
              Text(
                'You will be redirected back to a page where\nyou can enter a new password.',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: AppColors.pureBlack,
                ),
              ),
              YMargin(39),
              SvgPicture.asset(SvgIcons.circle),
              YMargin(60),
              CustomElevatedButton(
                text: 'Continue',
                onPressed: () {
                  widget.isReset
                      ? context.pushReplacement(AppPath.auth.resetPassword.path)
                      : context.pushReplacement(AppPath.auth.login.path);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
