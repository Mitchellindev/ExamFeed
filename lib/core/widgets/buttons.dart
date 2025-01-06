import 'package:exam_feed/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.text,
    this.onPressed,
    this.loading = false,
    this.width,
    this.height,
    super.key,
  });

  final String text;
  final void Function()? onPressed;
  final bool loading;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    const loadingWidget = CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.white),
      strokeWidth: 2,
    );
    const textStyle = TextStyle(fontSize: 16, color: Colors.white);
    final textWidget = Text(text, style: textStyle);
    return ElevatedButton(
      onPressed: loading ? null : onPressed,
      

      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? double.infinity, height ?? 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        disabledBackgroundColor: AppColors.neutral400,
      ),
      child: loading ? loadingWidget : textWidget,
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    required this.text,
    this.onPressed,
    this.loading = false,
    super.key,
    this.fontSize,
    this.buttonStyle,
    this.customTextStyle,
    this.height,
  });

  final String text;
  final double? fontSize;
  final double? height;
  final TextStyle? customTextStyle;
  final void Function()? onPressed;
  final bool loading;
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) {
    const loadingWidget = CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
      strokeWidth: 2,
    );
    final textStyle = customTextStyle ??
        TextStyle(fontSize: fontSize ?? 16, color: AppColors.primaryColor);
    final textWidget = Text(text, style: textStyle);
    return OutlinedButton(
      onPressed: loading ? null : onPressed,
      style: buttonStyle ??
          OutlinedButton.styleFrom(
            minimumSize: Size(double.infinity, height ?? 56),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            side: const BorderSide(color: AppColors.primaryColor),
          ),
      child: loading ? loadingWidget : textWidget,
    );
  }
}

class CustomOutlinedButtonWithIcon extends StatelessWidget {
  const CustomOutlinedButtonWithIcon({
    required this.text,
    required this.icon,
    this.onPressed,
    this.loading = false,
    this.iconAlignment = IconAlignment.start,
    super.key,
    this.customTextStyle,
    this.buttonStyle,
    this.height,
    this.borderColor,
    this.iconColor,
  });

  final String text;
  final String icon;
  final TextStyle? customTextStyle;
  final ButtonStyle? buttonStyle;
  final void Function()? onPressed;
  final bool loading;
  final IconAlignment iconAlignment;
  final double? height;
  final Color? borderColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    const loadingWidget = CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.white),
      strokeWidth: 2,
    );
    const textStyle = TextStyle(
      fontSize: 16,
      color: AppColors.neutral1000,
    );

    final textWidget = Text(text, style: customTextStyle ?? textStyle);
    return OutlinedButton.icon(
      onPressed: loading ? null : onPressed,
      // ignore: deprecated_member_use
      icon: loading ? null : SvgPicture.asset(icon, color: iconColor),
      label: loading ? loadingWidget : textWidget,
      iconAlignment: iconAlignment,

      style: buttonStyle ??
          OutlinedButton.styleFrom(
            minimumSize: Size(double.infinity, height ?? 56),
            backgroundColor: AppColors.primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 0,
            side: BorderSide(
              color: borderColor ?? AppColors.primaryColor,
            ),
          ),
    );
  }
}

class CustomElevatedButtonWithIcon extends StatelessWidget {
  const CustomElevatedButtonWithIcon({
    required this.text,
    required this.icon,
    this.onPressed,
    this.loading = false,
    this.iconAlignment = IconAlignment.start,
    super.key,
    this.customTextStyle,
    this.buttonStyle,
    this.height,
    this.borderColor,
    this.iconColor,
  });

  final String text;
  final String icon;
  final TextStyle? customTextStyle;
  final ButtonStyle? buttonStyle;
  final void Function()? onPressed;
  final bool loading;
  final IconAlignment iconAlignment;
  final double? height;
  final Color? borderColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    const loadingWidget = CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.white),
      strokeWidth: 2,
    );
    const textStyle = TextStyle(
      fontSize: 16,
      color: AppColors.skyWhite,
    );

    final textWidget = Text(text, style: customTextStyle ?? textStyle);
    return ElevatedButton.icon(
      onPressed: loading ? null : onPressed,
      // ignore: deprecated_member_use
      icon: loading ? null : SvgPicture.asset(icon, color: iconColor),
      label: loading ? loadingWidget : textWidget,
      iconAlignment: iconAlignment,

      style: buttonStyle ??
          ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            minimumSize: Size(double.infinity, height ?? 56),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 0,
            side: BorderSide(
              color: borderColor ?? AppColors.neutral400,
            ),
          ),
    );
  }
}

class CustomOnboardingElevatedButtonWithIcon extends StatelessWidget {
  const CustomOnboardingElevatedButtonWithIcon({
    required this.text,
    required this.icon,
    this.onPressed,
    this.loading = false,
    this.iconAlignment = IconAlignment.start,
    super.key,
    this.customTextStyle,
    this.buttonStyle,
    this.height,
    this.borderColor,
    this.iconColor,
  });

  final String text;
  final String icon;
  final TextStyle? customTextStyle;
  final ButtonStyle? buttonStyle;
  final void Function()? onPressed;
  final bool loading;
  final IconAlignment iconAlignment;
  final double? height;
  final Color? borderColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    const loadingWidget = CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.white),
      strokeWidth: 2,
    );
    const textStyle = TextStyle(
      fontSize: 16,
      color: AppColors.skyWhite,
    );

    final textWidget = Text(text, style: customTextStyle ?? textStyle);
    return ElevatedButton(
      onPressed: loading ? null : onPressed,
      // ignore: deprecated_member_use

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          loading ? loadingWidget : textWidget,
          if (!loading) SvgPicture.asset(icon, color: iconColor),
        ],
      ),
      style: buttonStyle ??
          ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            minimumSize: Size(double.infinity, height ?? 56),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 0,
            side: BorderSide(
              color: borderColor ?? AppColors.neutral400,
            ),
          ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.text,
    super.key,
    this.onPressed,
    this.loading = false,
  });

  final String text;
  final void Function()? onPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    const loadingWidget = CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.white),
      strokeWidth: 2,
    );
    const textStyle = TextStyle(fontSize: 16, color: AppColors.primaryColor);
    final textWidget = Text(text, style: textStyle);
    return TextButton(
      onPressed: loading ? null : onPressed,
      style: TextButton.styleFrom(
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.white,
        elevation: 0,
        disabledBackgroundColor: AppColors.neutral400,
      ),
      child: loading ? loadingWidget : textWidget,
    );
  }
}