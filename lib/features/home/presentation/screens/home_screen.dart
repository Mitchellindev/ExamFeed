import 'package:exam_feed/config/router/routes.dart';
import 'package:exam_feed/core/constants/app_colors.dart';
import 'package:exam_feed/core/widgets/text_widget.dart';
import 'package:exam_feed/features/home/presentation/widgets/book_cover_widget.dart';
import 'package:exam_feed/features/home/presentation/widgets/featured_subject_widget.dart';
import 'package:exam_feed/features/home/presentation/widgets/past_question_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextWidget(
          text: 'ExamFeed',
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              size: 24,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SearchBar(
                    // shape: MaterialStatePropertyAll(),
                    hintText: 'Search Anything',
                    // hintStyle: TextStyle(),
                    leading: Icon(
                      Icons.search,
                      color: AppColors.greyButton,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  TextWidget(
                    text: 'Trending Today',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    // scrollDirection: Axis.horizontal,
                    children: [
                      const TextBookWidget(
                        bookTitle: 'assets/images/maths_text.png',
                        bookCover: 'assets/images/maths_cover.png',
                        bookNumber: '01',
                      ),
                      SizedBox(width: 5.w),
                      const TextBookWidget(
                        bookTitle: 'assets/images/history_text.png',
                        bookCover: 'assets/images/history_cover.png',
                        bookNumber: '02',
                      ),
                      SizedBox(width: 5.w),
                      const TextBookWidget(
                        bookTitle: 'assets/images/chemistry_text.png',
                        bookCover: 'assets/images/chemistry_cover.png',
                        bookNumber: '03',
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: 'Featured subjects',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.featuredSubjects);
                        },
                        child: Row(
                          children: [
                            TextWidget(
                              text: 'See all',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(width: 3.w),
                            const Icon(
                              Icons.keyboard_arrow_right_sharp,
                              size: 13,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.w),
            SizedBox(
              height: 345.h,
              child: Padding(
                padding: const EdgeInsets.only(left: 13.0),
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  const FeaturedSubjects(
                    subjectCover: 'assets/images/123.png',
                    examBody: 'W.A.S.S.C.E  2020',
                    subject: 'General Mathematics Questions',
                    rating: '3.5',
                    question: '50 questions',
                    timer: '1hr 30mins',
                  ),
                  SizedBox(width: 10.w),
                  const FeaturedSubjects(
                    subjectCover: 'assets/images/biosintetica.jpg',
                    examBody: 'W.A.S.S.C.E  2020',
                    subject: 'General Mathematics Questions',
                    rating: '3.5',
                    question: '50 questions',
                    timer: '1hr 30mins',
                  ),
                  SizedBox(width: 10.w),
                ]),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: 'Exam Bodies',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary,
                  ),
                  SizedBox(height: 10.h),
                  GridView.count(
                      childAspectRatio: 1.3,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      crossAxisSpacing: 18.w,
                      children: const [
                        PastQuestionCardWidget(
                          label: 'View all available WAEC Past questions here',
                        ),
                        PastQuestionCardWidget(
                          label: 'View all available WAEC Past questions here',
                        ),
                        PastQuestionCardWidget(
                          label: 'View all available WAEC Past questions here',
                        ),
                        PastQuestionCardWidget(
                          label: 'View all available WAEC Past questions here',
                        ),
                      ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
