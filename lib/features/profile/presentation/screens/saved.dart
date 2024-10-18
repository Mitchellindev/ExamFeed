import 'package:exam_feed/core/constants/app_colors.dart';
import 'package:exam_feed/core/widgets/text_widget.dart';
import 'package:exam_feed/features/profile/presentation/screens/saved_news_screen.dart';
import 'package:exam_feed/features/profile/presentation/screens/saved_questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: TextWidget(
            text: 'Saved',
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
          ),
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
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(38.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 40.h,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white,
                ),
                child: TabBar(
                  labelPadding: const EdgeInsets.all(0),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.zero,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primary,
                    border: Border.all(color: AppColors.primary),
                  ),
                  unselectedLabelColor: AppColors.primary,
                  labelColor: AppColors.white,
                  tabs: [
                    _buildTab("Questions"),
                    _buildTab("News"),
                    _buildTab("Exam subject"),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: const TabBarView(children: [
          SavedQuestionScreen(),
          SavedNewsScreen(),
          SizedBox(),
        ]),
      ),
    );
  }

  Widget _buildTab(String text) {
    return Padding(
      padding: EdgeInsets.only(right: 8.w, left: 8.w),
      child: Container(
        width: double.infinity.w, // Set a consistent width for all tabs
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.primary),
        ),
        alignment: Alignment.center,
        child: Tab(
          text: text,
        ),
      ),
    );
  }
}
