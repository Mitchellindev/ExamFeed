import 'package:exam_feed/config/router/routes.dart';
import 'package:exam_feed/core/constants/app_colors.dart';
import 'package:exam_feed/core/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: double.infinity.w,
              height: 177.h,
              color: AppColors.primary,
            ),
            Transform.translate(
              offset: const Offset(0, -50),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              child:
                                  Image.asset('assets/images/profile_pics.png'),
                            ),
                            SizedBox(height: 8.h),
                            TextWidget(
                                text: 'Jake Adeyemi',
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w500),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    TextWidget(
                      text: 'PROFILE SETTING',
                      fontWeight: FontWeight.w300,
                      fontSize: 16.sp,
                      color: AppColors.thinTextGrey,
                    ),
                    ProfileActionWidget(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.changeNameAndGmail);
                      },
                      actionIcon: 'assets/images/user_edit.png',
                      actionlabel: 'Change name and gmail',
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: AppColors.textGrey,
                      ),
                    ),
                    ProfileActionWidget(
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.savedQuestionsNewsAndSubjects);
                      },
                      actionIcon: 'assets/images/book_saved.png',
                      actionlabel: 'Saved questions, news and exam subjects',
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: AppColors.textGrey,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    TextWidget(
                      text: 'NOTIFICATIONS',
                      fontWeight: FontWeight.w300,
                      fontSize: 16.sp,
                      color: AppColors.thinTextGrey,
                    ),
                    ProfileActionWidget(
                      onTap: () {},
                      actionIcon: 'assets/images/direct_notification.png',
                      actionlabel: 'All activities notifications',
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: AppColors.textGrey,
                      ),
                    ),
                    ProfileActionWidget(
                      onTap: () {},
                      actionIcon: 'assets/images/sms.png',
                      actionlabel: 'Email notifications',
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: AppColors.textGrey,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    TextWidget(
                      text: 'SECURITY',
                      fontWeight: FontWeight.w300,
                      fontSize: 16.sp,
                      color: AppColors.thinTextGrey,
                    ),
                    ProfileActionWidget(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.updatePassword);
                      },
                      actionIcon: 'assets/images/key.png',
                      actionlabel: 'Reset password',
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: AppColors.textGrey,
                      ),
                    ),
                    ProfileActionWidget(
                      onTap: () {},
                      actionIcon: 'assets/images/logout.png',
                      actionlabel: 'Log out',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileActionWidget extends StatelessWidget {
  const ProfileActionWidget({
    super.key,
    required this.onTap,
    required this.actionIcon,
    required this.actionlabel,
    this.trailing,
  });
  final VoidCallback onTap;
  final String actionIcon;
  final String actionlabel;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity.w,
        padding: EdgeInsets.only(bottom: 18.h, top: 16.h),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.thinTextGrey),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(actionIcon),
                SizedBox(width: 10.w),
                TextWidget(
                  maxLines: 2,
                  text: actionlabel,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w300,
                )
              ],
            ),
            SizedBox(
              child: trailing,
            )
          ],
        ),
      ),
    );
  }
}
