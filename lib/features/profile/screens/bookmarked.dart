import 'package:exam_feed/app/router_paths.dart';
import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/core/utils/spacer.dart';
import 'package:exam_feed/core/widgets/custom_app_bar.dart';
import 'package:exam_feed/features/dashboard/screens/widget.dart';
import 'package:exam_feed/features/feed/screens/widget.dart';
import 'package:exam_feed/resources/colors.dart';
import 'package:exam_feed/resources/resources.dart';

class Bookmarked extends StatefulWidget {
  const Bookmarked({super.key});

  @override
  State<Bookmarked> createState() => _BookmarkedState();
}

class _BookmarkedState extends State<Bookmarked> with TickerProviderStateMixin {
  TabController? _tabController;
  int _currentPage = 0;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

    super.initState();
  }

  void _changeTab(int index) {
    setState(() {
      _tabController?.animateTo(index);
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text('Saved'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: 38,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () => _changeTab(index),
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          color: _currentPage == index
                              ? AppColors.primaryColor
                              : AppColors.skyWhite,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.primaryColor,
                            width: 0.5,
                          )),
                      child: Text(
                        index == 0
                            ? 'Questions'
                            : index == 1
                                ? 'News'
                                : 'Exam Subjects',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: _currentPage == index
                              ? AppColors.skyWhite
                              : AppColors.primaryColor,
                        ),
                      )),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 20),
                      itemBuilder: (_, index) => GestureDetector(
                            onTap: () {
                              context.push(AppPath.dashboard.subject.path);
                            },
                            child: QuestionWidget(
                              image: 'https://picsum.photos/200/300',
                              title: 'W.A.S.S.C.E  2020',
                              subject: 'General Mathematics Questions',
                              summary:
                                  'A right-angled triangle has one leg measuring 5 cm and the hypotenuse measuring 13 cm. Find the length of the other leg.',
                              isBookmarked: true,
                            ),
                          ),
                      separatorBuilder: (_, __) => const YMargin(10),
                      itemCount: 10),
                  ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 20),
                      itemBuilder: (_, index) => FeedsWidget(
                            title: 'The Vanguard  ',
                            image: Images.vanguard,
                            time: '2h',
                            desc:
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ',
                            likes: '32',
                            dislikes: '32',
                            comments: '32',
                            isBookmarked: false,
                            onTap: () {
                              context.pushNamed(AppPath.feed.openFeed.path);
                            },
                          ),
                      separatorBuilder: (_, __) => const YMargin(10),
                      itemCount: 10),
                  ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 20),
                      itemBuilder: (_, index) => SubjectWidget(
                            image: 'https://picsum.photos/200/300',
                            title: 'W.A.S.S.C.E  2020',
                            subject: 'General Mathematics Questions',
                            rating: '3.5',
                            time: '1hr 30mins',
                            questions: '50 questions',
                            isBookmarked: true,
                            onTap: () {
                              // context.pushNamed(AppPath.dashboard.subject.path,
                              //     queryParameters: {
                              //       'subjectId': val?.id ?? '',
                              //     });
                            },
                          ),
                      separatorBuilder: (_, __) => const YMargin(10),
                      itemCount: 10),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
