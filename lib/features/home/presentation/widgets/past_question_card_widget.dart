import 'package:exam_feed/core/constants/app_colors.dart';
import 'package:exam_feed/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PastQuestionCardWidget extends StatelessWidget {
  const PastQuestionCardWidget({
    super.key,
    required this.label,
  });
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity.w,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              image: DecorationImage(
                  image: AssetImage('assets/images/student.png'),
                  fit: BoxFit.cover)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/waec.png',
                width: 50.w,
                height: 50.h,
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColors.primary,
              border: Border.all(),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
            child: TextWidget(
              text: label,
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
              maxLines: 2,
            ),
          ),
        )
      ],
    );
  }
}
