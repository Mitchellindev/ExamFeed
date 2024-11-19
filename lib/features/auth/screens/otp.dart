import 'package:exam_feed/app/router_paths.dart';
import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/core/utils/spacer.dart';
import 'package:exam_feed/core/widgets/buttons.dart';
import 'package:exam_feed/core/widgets/custom_app_bar.dart';
import 'package:exam_feed/features/auth/provider/auth_provider.dart';
import 'package:exam_feed/resources/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.isReset});
  final bool isReset;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _pinController = TextEditingController();
  int _secondsRemaining = 60;
  Timer? _timer;

  @override
  void initState() {
    _pinController.addListener(() {});
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _timer?.cancel();
        });
      }
    });
  }

  void _resendOtp() {
    setState(() {
      _secondsRemaining = 60;

      _timer?.cancel();
      _startTimer();
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthenticationProvider>();
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 120, 24, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Enter Verification Code',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: AppColors.primaryColor,
                  ),
                ),
                YMargin(8),
                RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(children: [
                      TextSpan(
                        text: 'Enter verification code to that was sent to ',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: AppColors.pureBlack,
                        ),
                      ),
                      TextSpan(
                        text: 'designtesting@gmail.com',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ])),
                const YMargin(60),
                PinCodeTextField(
                  appContext: context,
                  autoDismissKeyboard: true,
                  pastedTextStyle: TextStyle(
                    color: AppColors.pureBlack,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 6,
                  obscureText: true,
                  enablePinAutofill: true,
                  blinkWhenObscuring: true,
                  mainAxisAlignment: MainAxisAlignment.start,
                  hintCharacter: '*',
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v!.length < 3) {
                      return "";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    activeColor: AppColors.pureBlack,
                    inactiveColor: AppColors.neutral200,
                    inactiveFillColor: AppColors.neutral200,
                    selectedFillColor: AppColors.pureBlack,
                    selectedColor: AppColors.pureBlack,
                    fieldOuterPadding: const EdgeInsets.all(6),
                    fieldHeight: 50.sp,
                    fieldWidth: 45.sp,
                    activeFillColor: AppColors.neutral200,
                  ),
                  cursorColor: Colors.black,
                  animationDuration: const Duration(milliseconds: 300),
                  autoFocus: true,
                  enableActiveFill: false,
                  controller: _pinController,
                  keyboardType: TextInputType.number,
                  onCompleted: (v) {
                    setState(() {});
                  },
                  onChanged: (value) {},
                ),
                YMargin(120),
                CustomElevatedButton(
                  text: 'Verify Now',
                  onPressed: _pinController.text.length == 6
                      ? () {
                          context.pushReplacementNamed(
                              AppPath.auth.verificationSuccess.path,
                              queryParameters: {
                                'isReset': widget.isReset.toString(),
                              });
                        }
                      : null,
                  loading: auth.loginLoading,
                ),
                YMargin(20),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Didn\'t receive a code? ',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: AppColors.neutral600,
                      ),
                    ),
                    TextSpan(
                      text: _secondsRemaining == 0
                          ? 'Resend code'
                          : '00:$_secondsRemaining',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: AppColors.pureBlack,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
