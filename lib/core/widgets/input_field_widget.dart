import 'package:exam_feed/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget({
    super.key,
    this.label = "",
    this.hintColor,
    this.initialValue,
    this.hintText,
    this.hintSize = 14,
    required this.onChanged,
    this.validator,
    this.textFieldkey,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixicon,
    // this.padding = const EdgeInsets.only(bottom: 10),
    this.onTap,
    this.maxLines = 1,
    this.fontWeight = FontWeight.w600,
    this.labelColor = AppColors.black,
    this.labelFontSize = 16,
    this.enabledBorderRadius = 10,
    this.verticalContentPadding = 0,
    this.controller,
    this.horizontalContentPadding = 20,
    this.labelPadding =
        const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.fillColor,
    this.floatingLabelBehavior,
    this.autovalidateMode,
  });
  final String? label;
  final String? hintText;
  final double hintSize;
  final void Function(String?) onChanged;
  final void Function()? onTap;

  final String? Function(String?)? validator;
  final GlobalKey<FormFieldState>? textFieldkey;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final Widget? prefixicon;
  final String? initialValue;
  // final EdgeInsetsGeometry padding;
  final int? maxLines;
  final double enabledBorderRadius;
  final double verticalContentPadding;
  final bool readOnly;
  final FontWeight fontWeight;
  final Color? hintColor;
  final double labelFontSize;
  final TextEditingController? controller;
  final Color labelColor;
  final double horizontalContentPadding;
  final EdgeInsets labelPadding;
  final Color? fillColor;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final AutovalidateMode? autovalidateMode;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextFormField(
          controller: controller,
          onTap: onTap,
          autovalidateMode: autovalidateMode,
          key: textFieldkey,
          initialValue: initialValue,
          onChanged: onChanged,
          readOnly: readOnly,
          maxLines: maxLines,
          validator: validator,
          obscureText: obscureText,
          style: const TextStyle(color: AppColors.black),
          keyboardType: keyboardType,
          decoration: InputDecoration(
            floatingLabelBehavior: floatingLabelBehavior,
            floatingLabelStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w300,
              color: AppColors.textGrey,
            ),
            labelText: label,
            labelStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w300,
              color: AppColors.textGrey,
            ),
            prefixIcon: prefixicon,
            filled: true,
            fillColor: fillColor ?? Theme.of(context).colorScheme.background,
            suffixIcon: suffixIcon,
            hintStyle: TextStyle(
                color: hintColor,
                fontSize: hintSize,
                fontWeight: FontWeight.w300,
                fontFamily: 'Neue Plak'),
            contentPadding: EdgeInsets.symmetric(
                horizontal: horizontalContentPadding,
                vertical: verticalContentPadding),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 255, 0, 0),
                width: 2.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(enabledBorderRadius),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 255, 0, 0),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(enabledBorderRadius),
              borderSide: const BorderSide(
                color: AppColors.black,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.textGrey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(enabledBorderRadius),
            ),
            hintText: hintText,
          ),
        ),
        const SizedBox(
          height: 16,
        )
      ]),
    );
  }
}
