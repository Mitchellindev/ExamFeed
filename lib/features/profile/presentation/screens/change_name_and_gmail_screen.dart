import 'package:exam_feed/core/constants/app_colors.dart';
import 'package:exam_feed/core/validator/validator.dart';
import 'package:exam_feed/core/widgets/input_field_widget.dart';
import 'package:exam_feed/core/widgets/primary_button.dart';
import 'package:exam_feed/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeNameAndGmailScreen extends StatefulWidget {
  const ChangeNameAndGmailScreen({super.key});

  @override
  State<ChangeNameAndGmailScreen> createState() =>
      _ChangeNameAndGmailScreenState();
}

class _ChangeNameAndGmailScreenState extends State<ChangeNameAndGmailScreen> {
  late GlobalKey<FormFieldState> nameKey;
  late GlobalKey<FormFieldState> emailKey;

  String? fullName = '';
  String? email = '';
  @override
  void initState() {
    nameKey = GlobalKey<FormFieldState>();
    emailKey = GlobalKey<FormFieldState>();

    super.initState();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: AppColors.primary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TextWidget(
          text: 'Change name and gmail',
          fontSize: 18.sp,
          fontWeight: FontWeight.w300,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            CircleAvatar(
              radius: 50,
              child: Image.asset('assets/images/profile_pics.png'),
            ),
            SizedBox(height: 45.h),
            Form(
              key: formKey,
              child: Column(
                children: [
                  InputFieldWidget(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
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
                    floatingLabelBehavior: FloatingLabelBehavior.always,
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
                  PrimaryButton(
                    label: "Save",
                    onPressed: () {},
                    isEnabled: true,
                    labelColor: AppColors.white,
                    labelFontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    backgroundColor: AppColors.primary,
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
