import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/resources/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
            Text(
              'Create your account today and take the first step towards mastering your exams.',
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
