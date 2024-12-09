import 'dart:ffi';

import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/resources/colors.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget(
      {super.key, required this.leading, required this.title, this.trailing, this.onTap});
  final String leading, title;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.all(0),
      leading: SvgPicture.asset(leading),
      title: Text(
        title,
        style: TextStyle(
            color: AppColors.pureBlack,
            fontSize: 18,
            fontWeight: FontWeight.w300),
      ),
      trailing: trailing,
    );
  }
}
