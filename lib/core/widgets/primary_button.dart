import 'package:flutter/material.dart';

import 'text_widget.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    this.labelFontSize = 18,
    required this.onPressed,
    required this.isEnabled,
    this.labelColor = Colors.white,
    this.icon = const TextWidget(text: ""),
    this.fontWeight = FontWeight.w600,
    this.isOutlined = false,
    required this.backgroundColor,
    this.verticalPadding = 15.0,
    this.size = const Size(double.infinity, 50),
  });
  final String label;
  final VoidCallback onPressed;
  final bool isEnabled;
  final Widget icon;
  final bool isOutlined;
  final Color labelColor;
  final FontWeight fontWeight;
  final double labelFontSize;
  final Color backgroundColor;
  final double verticalPadding;
  final Size? size;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: icon,
      label: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        child: TextWidget(
          text: label,
          color: labelColor,
          fontSize: labelFontSize,
          fontWeight: fontWeight,
        ),
      ),
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: size,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(
              width: 1,
              color: Colors.transparent,
            )),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
