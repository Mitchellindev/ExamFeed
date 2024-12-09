import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/core/utils/spacer.dart';
import 'package:exam_feed/core/widgets/buttons.dart';
import 'package:exam_feed/core/widgets/custom_app_bar.dart';
import 'package:exam_feed/resources/colors.dart';
import 'package:exam_feed/resources/resources.dart';
import 'package:share_plus/share_plus.dart';

class StudyQuestion extends StatefulWidget {
  const StudyQuestion({
    super.key,
  });

  @override
  State<StudyQuestion> createState() => _StudyQuestionState();
}

class _StudyQuestionState extends State<StudyQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'General Mathematics Answers',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            YMargin(5),
            Text(
              'W.A.S.S.C.E 2020',
              style: TextStyle(
                color: AppColors.pureBlack,
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
            ),
            YMargin(28),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (_, index) {
                    return StudyMaterials();
                  },
                  separatorBuilder: (_, __) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Divider(
                          height: 1,
                        ),
                      ),
                  itemCount: 4),
            )
          ],
        ),
      ),
    );
  }
}

class StudyMaterials extends StatefulWidget {
  const StudyMaterials({super.key});

  @override
  State<StudyMaterials> createState() => _StudyMaterialsState();
}

class _StudyMaterialsState extends State<StudyMaterials> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1. ',
              style: TextStyle(
                  color: AppColors.pureBlack,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            Expanded(
              child: Text(
                'If {/displaystyle a=1} a=1 and {/displaystyle b=2} b=2, what is {/displaystyle a+b}a+b? ',
                style: TextStyle(
                    color: AppColors.pureBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
        YMargin(20),
        Center(child: Image.asset(Images.maths)),
        YMargin(50),
        Row(
          children: [
            Expanded(
              flex: 10,
              child: CustomElevatedButtonWithIcon(
                text: 'Display answers',
                iconAlignment: IconAlignment.end,
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                icon: isExpanded ? SvgIcons.ouiArrowUp : SvgIcons.ouiArrowDown,
              ),
            ),
            XMargin(36),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  SvgPicture.asset(SvgIcons.archiveAdd),
                  IconButton(
                    icon: SvgPicture.asset(SvgIcons.solarShareOutline),
                    onPressed: () async {
                      final box = context.findRenderObject() as RenderBox?;
                      await Share.share(
                        'https://play.google.com/store/apps/details?id=com.example.exam_feed',
                        sharePositionOrigin:
                            box!.localToGlobal(Offset.zero) & box.size,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        YMargin(10),
        Visibility(
          visible: isExpanded,
          child: Text(
            'To solve for a+b\nGiven a=1 and b=2, follow these steps:\nIdentify the values of a and b:\na=1\nb=2\nAdd the values of a and b\na+b =1+2\nPerform the addition:\n1+2=3\nAnswer   =   3',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: AppColors.pureBlack,
                fontSize: 18,
                fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}
