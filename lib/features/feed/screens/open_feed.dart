import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/core/utils/spacer.dart';
import 'package:exam_feed/core/widgets/custom_app_bar.dart';
import 'package:exam_feed/resources/colors.dart';
import 'package:exam_feed/resources/resources.dart';
import 'package:extended_image/extended_image.dart';
import 'package:share_plus/share_plus.dart';

class OpenFeed extends StatefulWidget {
  const OpenFeed({super.key});

  @override
  State<OpenFeed> createState() => _OpenFeedState();
}

class _OpenFeedState extends State<OpenFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text(''),
        actions: [
          IconButton(
            icon: SvgPicture.asset(SvgIcons.archiveAdd),
            onPressed: () async {},
          ),
          IconButton(
            icon: SvgPicture.asset(SvgIcons.solarShareOutline),
            onPressed: () async {
              final box = context.findRenderObject() as RenderBox?;
              await Share.share(
                'https://play.google.com/store/apps/details?id=com.example.exam_feed',
                sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'EDUCATION',
                style: const TextStyle(
                  color: AppColors.pureBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              YMargin(12),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ',
                style: const TextStyle(
                  color: AppColors.pureBlack,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              YMargin(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Published by The Vanguard',
                    style: const TextStyle(
                      color: AppColors.pureBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    'May 25th, 2020.',
                    style: const TextStyle(
                      color: AppColors.pureBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              YMargin(16),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ExtendedImage.network(
                  'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  width: MediaQuery.of(context).size.width,
                  height: 246,
                ),
              ),
              YMargin(16),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                style: TextStyle(
                    color: AppColors.pureBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
              YMargin(59),
              Row(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(SvgIcons.like),
                      XMargin(4),
                      Text(
                        '23',
                        style: const TextStyle(
                          color: AppColors.pureBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  XMargin(32),
                  Row(
                    children: [
                      SvgPicture.asset(SvgIcons.dislike),
                      XMargin(4),
                      Text(
                        '23',
                        style: const TextStyle(
                          color: AppColors.pureBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  XMargin(32),
                  Row(
                    children: [
                      SvgPicture.asset(SvgIcons.messageText),
                      XMargin(4),
                      Text(
                        '23',
                        style: const TextStyle(
                          color: AppColors.pureBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
