import 'package:exam_feed/app/router_paths.dart';
import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/core/utils/spacer.dart';
import 'package:exam_feed/core/utils/toast_util.dart';
import 'package:exam_feed/core/widgets/buttons.dart';
import 'package:exam_feed/resources/colors.dart';
import 'package:exam_feed/resources/resources.dart';
import 'package:extended_image/extended_image.dart';

class TrendingToday extends StatelessWidget {
  const TrendingToday(
      {super.key,
      required this.image,
      required this.subject,
      required this.index});
  final String image, subject, index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 151,
      width: 123,
      decoration: BoxDecoration(
        color: AppColors.transparent,
        image: DecorationImage(
            image: ExtendedImage.network(
              image,
              height: 151,
              width: 123,
              fit: BoxFit.cover,
            ).image,
            fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            // height: 70,
            width: 31,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: RotatedBox(
              quarterTurns: 3,
              child: Center(
                child: Text(
                  subject,
                  style: TextStyle(
                    color: AppColors.skyWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 31,
              decoration: const BoxDecoration(
                color: AppColors.blue,
              ),
              child: Center(
                child: Text(
                  index,
                  style: TextStyle(
                    color: AppColors.skyWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeaturedSubject extends StatelessWidget {
  const FeaturedSubject(
      {super.key,
      required this.image,
      required this.title,
      required this.subject,
      required this.rating,
      required this.time,
      required this.questions});
  final String image, title, subject, rating, time, questions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 307,
      width: 307,
      decoration: BoxDecoration(
        color: AppColors.skyWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.pureBlack.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Expanded(
                flex: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: ExtendedImage.network(
                    width: 307,
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      YMargin(5),
                      Text(
                        title,
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        subject,
                        style: TextStyle(
                          color: AppColors.pureBlack,
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                        ),
                      ),
                      YMargin(8),
                      Row(
                        children: [
                          tags(
                            SvgIcons.star,
                            rating,
                          ),
                          XMargin(10),
                          tags(
                            SvgIcons.timer,
                            time,
                          ),
                          XMargin(10),
                          tags(
                            SvgIcons.phQuestion,
                            questions,
                          ),
                        ],
                      ),
                      YMargin(8),
                      Row(
                        children: [
                          SvgPicture.asset(SvgIcons.archiveAdd),
                          Spacer(),
                          CustomElevatedButton(
                            text: 'Start',
                            loading: false,
                            onPressed: () {
                              context.showUnavailableMessage();
                              // context.pushNamed(
                              //   AppPath.dashboard.subject.path,
                              // );
                            },
                            width: 100,
                            height: 31,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            child: Image.asset(Images.waec2),
          ),
        ],
      ),
    );
  }
}

class ExamBodies extends StatelessWidget {
  const ExamBodies({super.key, required this.image, required this.title});
  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 159,
      width: 181,
      decoration: BoxDecoration(
        color: AppColors.skyWhite,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.pureBlack.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: ExtendedImage.network(
                    width: 307,
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: AppColors.skyWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 16,
            top: 15,
            child: Image.asset(
              Images.waec2,
              height: 33.43,
              width: 37.51,
            ),
          ),
        ],
      ),
    );
  }
}

class SubjectWidget extends StatelessWidget {
  const SubjectWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.subject,
      required this.rating,
      required this.time,
      required this.questions,
      required this.isBookmarked,
      required this.onTap});
  final String image, title, subject, rating, time, questions;
  final bool isBookmarked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 146,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.skyWhite,
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(
        //   color: AppColors.pureBlack.withOpacity(0.2),
        //   width: 1,
        // ),
        boxShadow: [
          BoxShadow(
            color: AppColors.pureBlack.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  child: ExtendedImage.network(
                    height: 146,
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      YMargin(5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SvgPicture.asset(isBookmarked
                              ? SvgIcons.archiveTick
                              : SvgIcons.archiveAdd),
                        ],
                      ),
                      Text(
                        subject,
                        style: TextStyle(
                          color: AppColors.pureBlack,
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                        ),
                      ),
                      YMargin(8),
                      Row(
                        children: [
                          tags(
                            SvgIcons.star,
                            rating,
                          ),
                          XMargin(10),
                          tags(
                            SvgIcons.timer,
                            time,
                          ),
                          XMargin(10),
                          tags(
                            SvgIcons.phQuestion,
                            questions,
                          ),
                        ],
                      ),
                      YMargin(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomElevatedButton(
                            text: 'Start',
                            loading: false,
                            onPressed: onTap,
                            width: 100,
                            height: 31,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 83,
            bottom: 2,
            child: Image.asset(
              Images.waec2,
              width: 50,
              height: 45,
            ),
          ),
        ],
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.subject,
      required this.isBookmarked,
      required this.summary});
  final String image, title, subject, summary;
  final bool isBookmarked;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 226,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.skyWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.pureBlack.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: ExtendedImage.network(
                height: 226,
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  YMargin(5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SvgPicture.asset(isBookmarked
                          ? SvgIcons.archiveTick
                          : SvgIcons.archiveAdd),
                    ],
                  ),
                  Text(
                    subject,
                    style: TextStyle(
                      color: AppColors.pureBlack,
                      fontWeight: FontWeight.w300,
                      fontSize: 13,
                    ),
                  ),
                  YMargin(8),
                  Text(
                    summary,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style: TextStyle(
                      color: AppColors.pureBlack,
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                    ),
                  ),
                  YMargin(8),
                  CustomElevatedButton(
                    text: 'Display answer',
                    loading: false,
                    onPressed: () {
                      context.pushNamed(AppPath.dashboard.studyQuestion.path);
                    },
                    width: 168,
                    height: 37,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

tags(String image, String title) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      border: Border.all(
        color: AppColors.pureBlack,
        width: 0.5,
      ),
    ),
    child: Row(
      children: [
        SvgPicture.asset(image),
        XMargin(3),
        Text(
          title,
          style: TextStyle(
            color: AppColors.pureBlack,
            fontWeight: FontWeight.normal,
            fontSize: 7,
          ),
        ),
      ],
    ),
  );
}
