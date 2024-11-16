import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ReadMore extends StatelessWidget {
  const ReadMore({
    required this.text,
    required this.moreStyle,
    required this.colorClickableText,
    required this.trimLines,
    required this.style,
    super.key,
    this.annotations,
    this.trimMode,
    this.isCollapsed,
  });
  final String text;
  final TextStyle moreStyle;
  final TextStyle style;
  final List<Annotation>? annotations;
  final Color colorClickableText;
  final TrimMode? trimMode;
  final int trimLines;
  final ValueNotifier<bool>? isCollapsed;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: trimLines,
      trimMode: trimMode ?? TrimMode.Line,
      colorClickableText: colorClickableText,
      annotations: annotations,
      moreStyle: moreStyle,
      style: style,
      isCollapsed: isCollapsed,
    );
  }
}
