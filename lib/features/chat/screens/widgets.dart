import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/core/utils/spacer.dart';
import 'package:exam_feed/resources/colors.dart';
import 'package:extended_image/extended_image.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget(
      {super.key,
      required this.avarter,
      required this.name,
      required this.message,
      required this.count,
      required this.time,
      required this.onTap});
  final String avarter, name, message, time;
  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: ExtendedImage.network(
          avarter,
          fit: BoxFit.cover,
        ).image,
      ),
      title: Text(
        name,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryColor,
        ),
      ),
      subtitle: Text(
        message,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: AppColors.pureBlack,
        ),
      ),
      trailing: Column(
        children: [
          Text(
            time,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: AppColors.primaryColor,
            ),
          ),
          YMargin(15),
          Badge.count(
            count: count,
            backgroundColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
