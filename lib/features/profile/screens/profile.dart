import 'package:exam_feed/app/router_paths.dart';
import 'package:exam_feed/app/service_locator.dart';
import 'package:exam_feed/core/storage/cache_storage.dart';
import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/core/utils/spacer.dart';
import 'package:exam_feed/features/auth/provider/auth_provider.dart';
import 'package:exam_feed/features/profile/screens/widgets.dart';
import 'package:exam_feed/resources/colors.dart';
import 'package:exam_feed/resources/resources.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthenticationProvider>();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: MediaQuery.of(context).size.height *
                      0.25, // Blue covers 30%
                  child: Container(
                    color: AppColors.primaryColor,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.7,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    color: AppColors.skyWhite,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YMargin(150),
                  Center(
                    child: SizedBox(
                      height: 120,
                      width: 120,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: ColoredBox(
                              color: AppColors.skyWhite,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: ExtendedImage.network(
                                    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                                    fit: BoxFit.cover,
                                  ).image,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: Image.asset(
                              Images.camera,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      auth.loginResponse.fullName ?? '',
                      style: TextStyle(
                          color: AppColors.pureBlack,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          YMargin(60),
                          Text(
                            'PROFILE SETTING',
                            style: TextStyle(
                                color: AppColors.neutral0,
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                          YMargin(18),
                          SettingsWidget(
                            leading: SvgIcons.userEdit,
                            title: 'Change name and gmail',
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.neutral0,
                            ),
                            onTap: () => context
                                .pushNamed(AppPath.profile.editProfile.path),
                          ),
                          Divider(
                            height: 1,
                          ),
                          YMargin(16),
                          SettingsWidget(
                            leading: SvgIcons.bookSaved,
                            title: 'Saved questions, news and exam subjects',
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.neutral0,
                            ),
                            onTap: () => context
                                .pushNamed(AppPath.profile.bookmarked.path),
                          ),
                          Divider(
                            height: 1,
                          ),
                          YMargin(40),
                          Text(
                            'NOTIFICATIONS',
                            style: TextStyle(
                                color: AppColors.neutral0,
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                          YMargin(18),
                          SettingsWidget(
                            leading: SvgIcons.directNotification,
                            title: 'All activities notifications',
                            trailing: CupertinoSwitch(
                              value:
                                  locator<SharedPrefs>().activityNotification,
                              onChanged: (val) {
                                locator<SharedPrefs>().activityNotification =
                                    val;
                              },
                            ),
                          ),
                          Divider(
                            height: 1,
                          ),
                          YMargin(16),
                          SettingsWidget(
                            leading: SvgIcons.sms,
                            title: 'Email notifications',
                            trailing: CupertinoSwitch(
                              value: locator<SharedPrefs>().emailNotification,
                              onChanged: (val) {
                                locator<SharedPrefs>().emailNotification = val;
                              },
                            ),
                          ),
                          YMargin(40),
                          Text(
                            'SECURITY',
                            style: TextStyle(
                                color: AppColors.neutral0,
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                          SettingsWidget(
                            leading: SvgIcons.key,
                            title: 'Reset password',
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.neutral0,
                            ),
                            onTap: () => context
                                .pushNamed(AppPath.profile.resetPassword.path),
                          ),
                          Divider(
                            height: 1,
                          ),
                          YMargin(16),
                          SettingsWidget(
                            leading: SvgIcons.logout,
                            title: 'Log out',
                            onTap: () =>
                                context.pushReplacementNamed(AppPath.auth.path),
                          ),
                          Divider(
                            height: 1,
                          ),
                          YMargin(16),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
