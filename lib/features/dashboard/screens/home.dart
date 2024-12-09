import 'package:exam_feed/app/router_paths.dart';
import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/core/utils/spacer.dart';
import 'package:exam_feed/core/utils/toast_util.dart';
import 'package:exam_feed/core/widgets/animated_widgets.dart';
import 'package:exam_feed/core/widgets/custom_app_bar.dart';
import 'package:exam_feed/core/widgets/sliver_app_bar_delegate.dart';
import 'package:exam_feed/core/widgets/textfields.dart';
import 'package:exam_feed/features/dashboard/provider/dashboard_provider.dart';
import 'package:exam_feed/features/dashboard/screens/widget.dart';
import 'package:exam_feed/resources/colors.dart';
import 'package:exam_feed/resources/resources.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    context.read<DashboardProvider>().examBody(
          onSuccess: () {},
          onError: (val) {},
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dash = context.watch<DashboardProvider>();
    return Scaffold(
      appBar: DashBoardAppBar(
        'ExamFeed',
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: ShrinkableButton(
              onTap: () {},
              child: SvgPicture.asset(
                SvgIcons.rowVertical,
              ),
            ),
          ),
        ],
      ),
      body: Skeletonizer(
        enabled: dash.examBodyModel == null,
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (_, __) => [
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                  maxHeight: 2,
                  minHeight: 2,
                  child: Divider(
                    height: 2,
                  )),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                maxHeight: 72,
                minHeight: 72,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 15),
                  child: PrimaryInputField(
                    context: context,
                    required: false,
                    prefixIcon: SvgIcons.component9,
                    hintText: 'Search Anything',
                  ),
                ),
              ),
            ),
          ],
          body: SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 15),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Trending Today',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            Spacer(),
                            Row(children: [
                              Text(
                                'See All',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: AppColors.primaryColor,
                              )
                            ])
                          ],
                        ),
                        YMargin(10),
                        SizedBox(
                          height: 151,
                          child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                return TrendingToday(
                                  image: 'https://picsum.photos/200/300',
                                  subject: 'Mathematics',
                                  index: '0${index + 1}',
                                );
                              },
                              separatorBuilder: (_, index) => XMargin(5),
                              itemCount: 5),
                        )
                      ],
                    ),
                    YMargin(10),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Featured subjects',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                context.showUnavailableMessage();
                                // context.pushNamed(
                                //     AppPath.dashboard.allSubject.path,
                                //     queryParameters: {
                                //       'title': 'Featured Subjects'
                                //     });
                              },
                              child: Row(children: [
                                Text(
                                  'See All',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 12,
                                  color: AppColors.primaryColor,
                                )
                              ]),
                            )
                          ],
                        ),
                        YMargin(10),
                        SizedBox(
                          height: 307,
                          child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                return FeaturedSubject(
                                  image: 'https://picsum.photos/200/300',
                                  title: 'W.A.S.S.C.E  2020',
                                  subject: 'General Mathematics Questions',
                                  rating: '3.5',
                                  time: '1hr 30mins',
                                  questions: '50 questions',
                                );
                              },
                              separatorBuilder: (_, index) => XMargin(5),
                              itemCount: 5),
                        )
                      ],
                    ),
                    YMargin(10),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Exam Bodies',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        YMargin(10),
                        SizedBox(
                          height: 159,
                          child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                final val =
                                    dash.examBodyModel?.examBody?[index];
                                return GestureDetector(
                                  onTap: () {
                                    context.loaderOverlay.show();
                                    dash.examBodyQuestions(
                                        id: val?.sId ?? '',
                                        onSuccess: () {
                                          context
                                            ..loaderOverlay.hide()
                                            ..pushNamed(
                                                AppPath
                                                    .dashboard.allSubject.path,
                                                queryParameters: {
                                                  'title': val?.name ?? ''
                                                });
                                        },
                                        onError: (val) {
                                          context
                                            ..loaderOverlay.hide()
                                            ..showErrorMessage(
                                              message: val.message,
                                            );
                                        });
                                  },
                                  child: ExamBodies(
                                    image: 'https://picsum.photos/200/300',
                                    title: val?.description ?? '',
                                    // subject: 'Mathematics',
                                    // index: '0${index + 1}',
                                  ),
                                );
                              },
                              separatorBuilder: (_, index) => XMargin(5),
                              itemCount:
                                  dash.examBodyModel?.examBody?.length ?? 0),
                        )
                      ],
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
