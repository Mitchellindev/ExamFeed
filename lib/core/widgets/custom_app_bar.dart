import 'package:exam_feed/app/router.dart';
import 'package:exam_feed/core/widgets/animated_widgets.dart';
import 'package:exam_feed/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({super.key, super.title, super.actions, super.bottom})
      : super(
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: ShrinkableButton(
              onTap: () => rootNavigatorKey.currentContext!.pop(),
              child: CircleAvatar(
                backgroundColor: AppColors.neutral200,
                child: SvgPicture.asset('SvgIcons.back,'),
              ),
            ),
          ),
        );
}

class CustomSliverAppBar extends SliverAppBar {
  CustomSliverAppBar({
    super.key,
    super.title,
    super.actions,
    bool noLeading = false,
  }) : super(
          leading: noLeading
              ? null
              : Padding(
                  padding: const EdgeInsets.all(8),
                  child: ShrinkableButton(
                    onTap: () => rootNavigatorKey.currentContext!.pop(),
                    child: CircleAvatar(
                      backgroundColor: AppColors.neutral200,
                      child: SvgPicture.asset(' SvgIcons.back,'),
                    ),
                  ),
                ),
        );
}
