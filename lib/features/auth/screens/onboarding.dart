import 'package:exam_feed/app/service_locator.dart';
import 'package:exam_feed/core/storage/cache_storage.dart';
import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/core/utils/spacer.dart';
import 'package:exam_feed/core/widgets/buttons.dart';
import 'package:exam_feed/resources/colors.dart';
import 'package:exam_feed/resources/resources.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  void initState() {
    _controller.addListener(() {});
    locator.get<SharedPrefs>().firstTime = false;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              onboarding[_currentIndex].image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 315,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.fromLTRB(20, 80, 20, 80),
              decoration: const BoxDecoration(
                color: AppColors.skyWhite,
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: PageView.builder(
                        itemCount: onboarding.length,
                        physics: const AlwaysScrollableScrollPhysics(),
                        controller: _controller,
                        onPageChanged: (val) {
                          setState(() {
                            _currentIndex = val;
                          });
                        },
                        itemBuilder: (ctx, index) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                onboarding[_currentIndex].title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 27),
                              ),
                              const YMargin(10),
                              Text(
                                onboarding[_currentIndex].sub,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              ),
                            ],
                          );
                        }),
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    axisDirection: Axis.horizontal,
                    effect: const WormEffect(
                        spacing: 4,
                        radius: 6.0,
                        dotWidth: 7,
                        dotHeight: 7,
                        paintStyle: PaintingStyle.stroke,
                        strokeWidth: 1.5,
                        dotColor: AppColors.grey,
                        activeDotColor: AppColors.primaryColor),
                  ),
                  const YMargin(73),
                  _currentIndex != 2
                      ? Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: TextButton(
                                    onPressed: () {}, child: Text('Skip'))),
                            Expanded(
                              flex: 3,
                              child: CustomOnboardingElevatedButtonWithIcon(
                                icon: SvgIcons.arrowRight,
                                iconAlignment: IconAlignment.end,
                                text: 'Next',
                                onPressed: () {
                                  if (_currentIndex != 2) {
                                    _controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 150),
                                        curve: Curves.linear);
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                      : CustomElevatedButton(
                          text: 'Get Started',
                          onPressed: () {},
                        )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingWidgets {
  final String title;
  final String sub;
  final String image;

  OnboardingWidgets({
    required this.title,
    required this.image,
    required this.sub,
  });
}

List<OnboardingWidgets> onboarding = [
  OnboardingWidgets(
    image: 'assets/images/onboard.png',
    title: 'Explore Past\nExam Questions',
    sub:
        'Browse through our extensive collection of past exam questions covering a wide range of subjects and exams.',
  ),
  OnboardingWidgets(
    image: 'assets/images/onboard_1.png',
    title: 'Customize Your\nLearning Journey',
    sub:
        'Tailor your learning experience by selecting your desired exam type, subject, and difficulty level.',
  ),
  OnboardingWidgets(
    image: 'assets/images/onboard_2.png',
    title: 'Exam Excellence\nBegins Here',
    sub:
        'With dedicated practice and our comprehensive resources, you\'ll be well-prepared to excel in your exams.',
  ),
];
