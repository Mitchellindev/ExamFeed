import 'package:exam_feed/app/router_paths.dart';
import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/core/utils/spacer.dart';
import 'package:exam_feed/core/widgets/custom_app_bar.dart';
import 'package:exam_feed/features/feed/screens/widget.dart';
import 'package:exam_feed/resources/colors.dart';
import 'package:exam_feed/resources/resources.dart';
import 'package:extended_image/extended_image.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  int _currentPage = 0;
  void _changeTab(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashBoardAppBar(
        '',
        title: Text(
          'News Feed',
          style: const TextStyle(
            color: AppColors.primaryColor,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          children: [
            Text(
              'Headlines',
              style: const TextStyle(
                color: AppColors.pureBlack,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            YMargin(10),
            SizedBox(
                height: 192,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (_, index) => ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ExtendedImage.network(
                      'https://picsum.photos/200/300',
                      fit: BoxFit.cover,
                      height: 192,
                      width: 157,
                    ),
                  ),
                  separatorBuilder: (_, __) => const XMargin(10),
                )),
            YMargin(32),
            SizedBox(
              height: 38,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
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
                            ? 'All'
                            : index == 1
                                ? 'W.A.S.S.C.E'
                                : 'N.E.C.O',
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
            YMargin(24),
            Expanded(
              child: ListView.separated(
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
                separatorBuilder: (_, __) => Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: const Divider(
                    height: 2,
                  ),
                ),
                itemCount: 10,
                shrinkWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
