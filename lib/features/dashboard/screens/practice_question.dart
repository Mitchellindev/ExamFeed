import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:exam_feed/app/router.dart';
import 'package:exam_feed/app/router_paths.dart';
import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/core/utils/spacer.dart';
import 'package:exam_feed/core/widgets/animated_widgets.dart';
import 'package:exam_feed/core/widgets/buttons.dart';
import 'package:exam_feed/core/widgets/sliver_app_bar_delegate.dart';
import 'package:exam_feed/features/dashboard/provider/dashboard_provider.dart';
import 'package:exam_feed/resources/colors.dart';
import 'package:exam_feed/resources/resources.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PracticeQuestion extends StatefulWidget {
  const PracticeQuestion({super.key, required this.title});

  final String title;

  @override
  State<PracticeQuestion> createState() => _PracticeQuestionState();
}

class _PracticeQuestionState extends State<PracticeQuestion>
    with TickerProviderStateMixin {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  int _currentIndex = -1;
  int _currentPage = 0;
  Timer? _timer;
  Duration _duration = Duration(hours: 2);
  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    _testCounter();

    super.initState();
  }

  void _testCounter() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _duration = Duration(seconds: _duration.inSeconds - 1);
      });
    });
    if (_duration.inSeconds == 0) {
      _nextQuestion();
    }
  }

  void _nextQuestion() {
    if (_pageController.page ==
        int.parse(
                '${context.read<DashboardProvider>().questionsModel?.data?.length ?? 0}') -
            1) {
      context.pushReplacementNamed(AppPath.dashboard.examSummary.path);
    }
    setState(() {
      _timer?.cancel();
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
      _currentIndex = -1;
      _duration = Duration(hours: 2);
      _testCounter();
    });
  }

  void _previousQuestion() {
    setState(() {
      _timer?.cancel();
      _pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
      _currentIndex = -1;
      _duration = Duration(hours: 2);
      _testCounter();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dash = context.watch<DashboardProvider>();
    return Scaffold(
      backgroundColor: AppColors.primary80,
      body: SafeArea(
        child: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (_, __) => [
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                maxHeight: 20,
                minHeight: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    children: [
                      ShrinkableButton(
                        onTap: () => rootNavigatorKey.currentContext!.pop(),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      XMargin(30),
                      Text(widget.title,
                          style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
              ),
            ),
            // SliverPersistentHeader(
            //   pinned: true,
            //   delegate: SliverAppBarDelegate(
            //       maxHeight: 2,
            //       minHeight: 2,
            //       child: Padding(
            //         padding: const EdgeInsets.only(top: 20),
            //         child: Divider(
            //           height: 1,
            //         ),
            //       )),
            // ),
          ],
          body: Skeletonizer(
            enabled: dash.questionsModel == null,
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.skyWhite,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(children: [
                Row(
                  children: [
                    SvgPicture.asset(SvgIcons.iconParkOutlineTime),
                    XMargin(5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time Left',
                          style: TextStyle(
                              color: AppColors.pureBlack,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          '${_duration.inHours}:${_duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${_duration.inSeconds.remainder(60).toString().padLeft(2, '0')}',
                          style: TextStyle(
                              color: AppColors.pureBlack,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
                YMargin(10),
                SizedBox(
                  width: 70,
                  height: 70,
                  child: DashedCircularProgressBar.aspectRatio(
                    aspectRatio: 2, // width ÷ height
                    valueNotifier: _valueNotifier,
                    progress: ((_currentPage + 1) /
                            num.parse(
                                '${dash.questionsModel?.data?.length ?? 0}')) *
                        100,
                    maxProgress: 100,
                    corners: StrokeCap.butt,
                    foregroundColor: AppColors.primaryColor,
                    backgroundColor: AppColors.primary80,
                    foregroundStrokeWidth: 8,
                    backgroundStrokeWidth: 8,
                    animation: true,
                    child: Center(
                      child: Text(
                        '${_currentPage + 1}/${dash.questionsModel?.data?.length ?? 0}',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                YMargin(43),
                Expanded(
                    child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (value) {
                    setState(() {
                      _currentPage = value;
                    });
                  },
                  children: List.generate(
                      dash.questionsModel?.data?.length ?? 0, (index) {
                    final question = dash.questionsModel?.data?[index];
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            question?.question ?? '',
                            style: TextStyle(
                                color: AppColors.pureBlack,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          YMargin(20),
                          Image.asset(Images.maths),
                          Column(
                            children: List.generate(5, (count) {
                              final option = count == 0
                                  ? question?.optionA
                                  : count == 1
                                      ? question?.optionB
                                      : count == 2
                                          ? question?.optionC
                                          : count == 3
                                              ? question?.optionD
                                              : question?.optionE;
                              return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      _currentIndex = count;
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 60,
                                      width: double.infinity,
                                      padding: EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(
                                        color: AppColors.skyWhite,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: AppColors.pureBlack
                                              .withOpacity(0.2),
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(children: [
                                        Icon(
                                          _currentIndex == count
                                              ? Icons.radio_button_checked
                                              : Icons.radio_button_unchecked,
                                        ),
                                        XMargin(10),
                                        Expanded(
                                          child: Text(
                                            option ?? '',
                                            style: TextStyle(
                                                color: AppColors.pureBlack,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      ]),
                                    ),
                                  ));
                            }),
                          ),
                        ],
                      ),
                    );
                  }),
                )),
                YMargin(20),
                Row(children: [
                  if (_currentPage != 0)
                    Expanded(
                      flex: 3,
                      child: TextButton(
                          onPressed: _previousQuestion,
                          child: Text(
                            'Previous',
                            style: TextStyle(
                              color: AppColors.pureBlack,
                              fontSize: 16,
                            ),
                          )),
                    ),
                  Expanded(
                    flex: 10,
                    child: CustomOnboardingElevatedButtonWithIcon(
                      text: _currentPage ==
                              (int.parse(
                                      '${dash.questionsModel?.data?.length ?? 0}') -
                                  1)
                          ? 'Submit'
                          : 'Next',
                      iconAlignment: IconAlignment.end,
                      onPressed: _currentIndex != -1 ? _nextQuestion : null,
                      icon: SvgIcons.arrowRight,
                    ),
                  )
                ])
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
