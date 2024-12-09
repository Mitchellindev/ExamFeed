import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/core/utils/spacer.dart';
import 'package:exam_feed/resources/colors.dart';
import 'package:exam_feed/resources/resources.dart';
import 'package:extended_image/extended_image.dart';

class FeedsWidget extends StatelessWidget {
  const FeedsWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.time,
      required this.desc,
      required this.likes,
      required this.dislikes,
      required this.comments,
      required this.isBookmarked,
      required this.onTap});
  final String image, title, time, desc, likes, dislikes, comments;
  final bool isBookmarked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 164,
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  Row(
                    children: [
                      ExtendedImage.asset(image),
                      XMargin(5),
                      Text(
                        title,
                        style: const TextStyle(
                          color: AppColors.pureBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '\u2022 $time',
                        style: const TextStyle(
                          color: AppColors.pureBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  YMargin(8),
                  Text(
                    desc,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.pureBlack,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  YMargin(25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(SvgIcons.like),
                          XMargin(4),
                          Text(
                           likes,
                            style: const TextStyle(
                              color: AppColors.pureBlack,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      XMargin(5),
                      Row(
                        children: [
                          SvgPicture.asset(SvgIcons.dislike),
                          XMargin(4),
                          Text(
                            dislikes,
                            style: const TextStyle(
                              color: AppColors.pureBlack,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      XMargin(5),
                      Row(
                        children: [
                          SvgPicture.asset(SvgIcons.messageText),
                          XMargin(4),
                          Text(
                           comments,
                            style: const TextStyle(
                              color: AppColors.pureBlack,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset( isBookmarked ? SvgIcons.archiveTick:  SvgIcons.archiveAddGray),
                    ],
                  )
                ],
              ),
            ),
            XMargin(31),
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ExtendedImage.network(
                  'https://picsum.photos/200/300',
                  fit: BoxFit.cover,
                  height: 139,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
