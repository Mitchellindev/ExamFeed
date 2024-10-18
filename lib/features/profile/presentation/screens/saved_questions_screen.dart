import 'package:exam_feed/features/profile/presentation/widgets/saved_question_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedQuestionScreen extends StatelessWidget {
  const SavedQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: ListView(
          children: [
            SizedBox(height: 32.h),
            SavedQuestionWidget(
              examBody: 'W.A.S.S.C.E  2020',
              subject: 'Mathematics Question',
              question:
                  'A right-angled triangle has one leg measuring 5 cm and the hypotenuse measuring 13 cm. Find the length of the other leg.',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
