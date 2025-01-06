import 'package:exam_feed/app/router.dart';
import 'package:exam_feed/app/router_paths.dart';
import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/core/utils/spacer.dart';
import 'package:exam_feed/core/utils/toast_util.dart';
import 'package:exam_feed/core/widgets/animated_widgets.dart';
import 'package:exam_feed/core/widgets/sliver_app_bar_delegate.dart';
import 'package:exam_feed/features/dashboard/provider/dashboard_provider.dart';
import 'package:exam_feed/features/dashboard/screens/widget.dart';
import 'package:exam_feed/resources/colors.dart';
import 'package:exam_feed/resources/resources.dart';
import 'package:extended_image/extended_image.dart';
import 'package:loader_overlay/loader_overlay.dart';

class Subjects extends StatefulWidget {
  const Subjects({super.key, required this.subjectId});
  final String subjectId;

  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  final _scrollController = ScrollController();

  void _practiceQuestion() {
    context.loaderOverlay.show();
    context.read<DashboardProvider>().getQuestions(
        subjectId: context
                .read<DashboardProvider>()
                .examBodyQuestionsModel
                ?.subjects
                ?.firstWhere((e) => e.id == widget.subjectId)
                .sId ??
            '',
        year: '1978',
        examBody:
            context.read<DashboardProvider>().examBodyQuestionsModel?.sId ?? '',
        onSuccess: () {
          context
            ..loaderOverlay.hide()
            ..pushNamed(AppPath.dashboard.practiceQuestion.path,
                queryParameters: {
                  'title': context
                          .read<DashboardProvider>()
                          .examBodyQuestionsModel
                          ?.subjects
                          ?.firstWhere((e) => e.id == widget.subjectId)
                          .title ??
                      '',
                });
        },
        onError: (error) {
          context
            ..loaderOverlay.hide()
            ..showErrorMessage(message: error.message);
        });
  }

 void _studyQuestion() {
    context.loaderOverlay.show();
    context.read<DashboardProvider>().getQuestions(
        subjectId: context
                .read<DashboardProvider>()
                .examBodyQuestionsModel
                ?.subjects
                ?.firstWhere((e) => e.id == widget.subjectId)
                .sId ??
            '',
        year: '1978',
        examBody:
            context.read<DashboardProvider>().examBodyQuestionsModel?.sId ?? '',
        onSuccess: () {
          context
            ..loaderOverlay.hide()
            ..pushNamed(AppPath.dashboard.studyQuestion.path,
                queryParameters: {
                  'title': context
                          .read<DashboardProvider>()
                          .examBodyQuestionsModel
                          ?.subjects
                          ?.firstWhere((e) => e.id == widget.subjectId)
                          .title ??
                      '',
                });
        },
        onError: (error) {
          context
            ..loaderOverlay.hide()
            ..showErrorMessage(message: error.message);
        });
  }
  @override
  Widget build(BuildContext context) {
    final dash = context.watch<DashboardProvider>();
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (_, __) => [
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegate(
              maxHeight: 400,
              minHeight: 400,
              child: Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExtendedImage.network(
                                height: 400,
                                width: double.infinity,
                                'https://picsum.photos/200/300')
                            .image,
                        fit: BoxFit.cover)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 68),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShrinkableButton(
                        onTap: () => rootNavigatorKey.currentContext!.pop(),
                        child: CircleAvatar(
                          backgroundColor: AppColors.skyWhite,
                          child: SvgPicture.asset(SvgIcons.arrowLeft),
                        ),
                      ),
                      ShrinkableButton(
                        onTap: () {},
                        child: CircleAvatar(
                          backgroundColor: AppColors.skyWhite,
                          child: SvgPicture.asset(SvgIcons.menu),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                YMargin(20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        dash.examBodyQuestionsModel?.subjects
                                ?.firstWhere((e) => e.id == widget.subjectId)
                                .title ??
                            '',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SvgPicture.asset(SvgIcons.archiveAdd),
                  ],
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
                YMargin(9),
                Row(
                  children: [
                    tags(
                      SvgIcons.star,
                      '4.5',
                    ),
                    XMargin(10),
                    tags(
                      SvgIcons.timer,
                      '3h 30m',
                    ),
                    XMargin(10),
                    tags(
                      SvgIcons.phQuestion,
                      '5 Questions',
                    ),
                  ],
                ),
                YMargin(25),
                Text(
                  'Description',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                YMargin(5),
                Text(
                  dash.examBodyQuestionsModel?.subjects
                          ?.firstWhere((e) => e.id == widget.subjectId)
                          .description ??
                      '',
                  style: TextStyle(
                    color: AppColors.pureBlack,
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                ),
                YMargin(25),
                GestureDetector(
                  onTap: _practiceQuestion,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Practice past questions',
                          style: TextStyle(
                            color: AppColors.skyWhite,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                        YMargin(7),
                        Text(
                          'Attempt all questions, get scored and have access to corrections',
                          style: TextStyle(
                            color: AppColors.skyWhite,
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                YMargin(16),
                GestureDetector(
                  onTap: _studyQuestion,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 1,
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Study past questions',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                        YMargin(7),
                        Text(
                          'Attempt all questions, get scored and have access to corrections',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
