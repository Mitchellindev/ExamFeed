import 'package:exam_feed/app/router.dart';
import 'package:exam_feed/core/widgets/animated_widgets.dart';
import 'package:exam_feed/resources/colors.dart';
import 'package:exam_feed/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({super.key, super.title, super.actions, super.bottom})
      : super(
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: ShrinkableButton(
              onTap: () => rootNavigatorKey.currentContext!.pop(),
              child: CircleAvatar(
                backgroundColor: AppColors.skyWhite,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        );
}

class CustomBackButton extends AppBar {
  final String name;
  CustomBackButton({
    super.key,
    super.actions,
    super.bottom,
    required this.name,
  }) : super(
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: ShrinkableButton(
              onTap: () => rootNavigatorKey.currentContext!.pop(),
              child: Icon(
                Icons.arrow_back_ios,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          centerTitle: false,
          title: Text(name,
              style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
        );
}

class DashBoardAppBar extends AppBar {
  final String name;

  DashBoardAppBar(this.name, {super.key, super.title, super.bottom, super.actions})
      : super(
          leadingWidth: 150,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Text(name,
                style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w600)),
          ),
         
        );
}

class CustomSliverAppBar extends SliverAppBar {
  CustomSliverAppBar({
    super.key,
    super.title,
    super.actions,
  }) : super(
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: ShrinkableButton(
              onTap: () => rootNavigatorKey.currentContext!.pop(),
              child: CircleAvatar(
                backgroundColor: AppColors.skyWhite,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        );
}
