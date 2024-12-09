import 'package:exam_feed/app/router_paths.dart';
import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/core/utils/spacer.dart';
import 'package:exam_feed/core/widgets/buttons.dart';
import 'package:exam_feed/core/widgets/custom_app_bar.dart';
import 'package:exam_feed/resources/colors.dart';
import 'package:exam_feed/resources/resources.dart';
import 'package:share_plus/share_plus.dart';

class ExamSummary extends StatefulWidget {
  const ExamSummary({super.key});

  @override
  State<ExamSummary> createState() => _ExamSummaryState();
}

class _ExamSummaryState extends State<ExamSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text('Exam Summary'),
        actions: [
          IconButton(
            icon: SvgPicture.asset(SvgIcons.solarShareOutline),
            onPressed: () async {
              final box = context.findRenderObject() as RenderBox?;
              await Share.share(
                'https://play.google.com/store/apps/details?id=com.example.exam_feed',
                sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Images.goldenTrophy,
              ),
              YMargin(8),
              Text(
                'Congratulations!',
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              YMargin(8),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'You scored',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: ' 5 ',
                      style: TextStyle(
                        color: AppColors.primaryLight,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: 'points',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              YMargin(24),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.accentRed,
                          width: 0.5,
                        )),
                    child: Row(
                      children: [
                        Text(
                          'Incorrect Answers:  ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          '09',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.accentRed,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.primaryLight,
                          width: 0.5,
                        )),
                    child: Row(
                      children: [
                        Text(
                          'Correct Answers:  ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          '41',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.primaryLight,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              YMargin(100),
              CustomElevatedButton(
                text: 'View saved questions',
                onPressed: () {},
              ),
              YMargin(16),
              CustomOutlinedButton(
                text: 'View corrections',
                onPressed: () {
                  context.pushNamed(
                    AppPath.dashboard.studyQuestion.path,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
