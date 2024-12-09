import 'package:exam_feed/app/router_paths.dart';
import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/features/analytics/screens/analytics.dart';
import 'package:exam_feed/features/auth/screens/forget_password.dart';
import 'package:exam_feed/features/auth/screens/login.dart';
import 'package:exam_feed/features/auth/screens/onboarding.dart';
import 'package:exam_feed/features/auth/screens/otp.dart';
import 'package:exam_feed/features/auth/screens/reset_password.dart';
import 'package:exam_feed/features/auth/screens/signup.dart';
import 'package:exam_feed/features/auth/screens/splashscreen.dart';
import 'package:exam_feed/features/auth/screens/verification_success.dart';
import 'package:exam_feed/features/chat/screens/chat.dart';
import 'package:exam_feed/features/chat/screens/messages.dart';
import 'package:exam_feed/features/dashboard/screens/allsubjects.dart';
import 'package:exam_feed/features/dashboard/screens/exam_summary.dart';
import 'package:exam_feed/features/dashboard/screens/home.dart';
import 'package:exam_feed/features/dashboard/screens/practice_question.dart';
import 'package:exam_feed/features/dashboard/screens/study_question.dart';
import 'package:exam_feed/features/dashboard/screens/subject.dart';
import 'package:exam_feed/features/dashboard/screens/year_selection.dart';
import 'package:exam_feed/features/feed/screens/feed.dart';
import 'package:exam_feed/features/feed/screens/open_feed.dart';
import 'package:exam_feed/features/profile/screens/bookmarked.dart';
import 'package:exam_feed/features/profile/screens/change_password.dart';
import 'package:exam_feed/features/profile/screens/edit_profile.dart';
import 'package:exam_feed/features/profile/screens/profile.dart';
import 'package:exam_feed/resources/colors.dart';
import 'package:exam_feed/resources/resources.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final rootScaffoldStateKey = GlobalKey<ScaffoldState>();

final router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  navigatorKey: rootNavigatorKey,
  // initialLocation: AppPath.timeline.goRoute,
  observers: [
    FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
  ],
  routes: [
    GoRoute(
        path: AppPath.splash.goRoute,
        name: AppPath.splash.path,
        builder: (context, state) => SplashScreen(),
        routes: [
          GoRoute(
            path: AppPath.splash.onboardingScreen.goRoute,
            name: AppPath.splash.onboardingScreen.path,
            builder: (context, state) => Onboarding(),
          ),
          // GoRoute(
          //   path: AppPath.splash.onboardingScreen.goRoute,
          //   name: AppPath.splash.onboardingScreen.path,
          //   builder: (context, state) => Onboarding(),
          // ),
        ]),
    GoRoute(
      path: AppPath.auth.goRoute,
      name: AppPath.auth.path,
      builder: (context, state) => const SignUpScreen(),
      routes: [
        GoRoute(
          path: AppPath.auth.login.goRoute,
          name: AppPath.auth.login.path,
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          path: AppPath.auth.otp.goRoute,
          name: AppPath.auth.otp.path,
          builder: (context, state) => OtpScreen(
            isReset: state.uri.queryParameters['isReset'] == 'false',
          ),
        ),
        GoRoute(
          path: AppPath.auth.verificationSuccess.goRoute,
          name: AppPath.auth.verificationSuccess.path,
          builder: (context, state) => VerificationSuccess(
            isReset: state.uri.queryParameters['isReset'] == 'false',
          ),
        ),
        GoRoute(
          path: AppPath.auth.forgetPassword.goRoute,
          name: AppPath.auth.forgetPassword.path,
          builder: (context, state) => ForgatPassword(),
        ),
        GoRoute(
          path: AppPath.auth.resetPassword.goRoute,
          name: AppPath.auth.resetPassword.path,
          builder: (context, state) => ResetPassword(),
        ),
      ],
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          ScaffoldWithNestedNavigation(
        navigationShell: navigationShell,
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppPath.dashboard.goRoute,
              name: AppPath.dashboard.path,
              builder: (context, state) => const HomeScreen(),
              routes: [
                GoRoute(
                  path: AppPath.dashboard.allSubject.goRoute,
                  name: AppPath.dashboard.allSubject.path,
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) => AllSubjects(
                    title: state.uri.queryParameters['title'] ?? '',
                  ),
                ),
                GoRoute(
                  path: AppPath.dashboard.subject.goRoute,
                  name: AppPath.dashboard.subject.path,
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) => Subjects(
                    subjectId: state.uri.queryParameters['subjectId'] ?? '',
                  ),
                ),
                GoRoute(
                  path: AppPath.dashboard.practiceQuestion.goRoute,
                  name: AppPath.dashboard.practiceQuestion.path,
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) => PracticeQuestion(
                    title: state.uri.queryParameters['title'] ?? '',
                  ),
                ),
                GoRoute(
                  path: AppPath.dashboard.studyQuestion.goRoute,
                  name: AppPath.dashboard.studyQuestion.path,
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) => StudyQuestion(
                      // title: state.uri.queryParameters['title'] ?? '',
                      ),
                ),
                GoRoute(
                  path: AppPath.dashboard.yearSelection.goRoute,
                  name: AppPath.dashboard.yearSelection.path,
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) => YearSelection(
                      // title: state.uri.queryParameters['title'] ?? '',
                      ),
                ),

                
                GoRoute(
                  path: AppPath.dashboard.examSummary.goRoute,
                  name: AppPath.dashboard.examSummary.path,
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) => ExamSummary(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppPath.messaging.goRoute,
              builder: (context, state) => const ChatScreen(),
              routes: [
                GoRoute(
                  path: AppPath.messaging.messages.goRoute,
                  name: AppPath.messaging.messages.path,
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) => Messages(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppPath.discover.goRoute,
              name: AppPath.discover.goRoute,
              builder: (context, state) => const AnalyticsScreen(),
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppPath.feed.goRoute,
              name: AppPath.feed.goRoute,
              builder: (context, state) => const FeedScreen(),
              routes: [
                GoRoute(
                  path: AppPath.feed.openFeed.goRoute,
                  name: AppPath.feed.openFeed.path,
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) => OpenFeed(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppPath.profile.goRoute,
              name: AppPath.profile.goRoute,
              builder: (context, state) => const ProfileScreen(),
              routes: [
                GoRoute(
                  path: AppPath.profile.editProfile.goRoute,
                  name: AppPath.profile.editProfile.path,
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) => EditProfile(),
                ),
                GoRoute(
                  path: AppPath.profile.resetPassword.goRoute,
                  name: AppPath.profile.resetPassword.path,
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) => ChangePassword(),
                ),
                GoRoute(
                  path: AppPath.profile.bookmarked.goRoute,
                  name: AppPath.profile.bookmarked.path,
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (context, state) => Bookmarked(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) => navigationShell.goBranch(
        index,
        initialLocation: index == navigationShell.currentIndex,
      );

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavigationBar(
      body: navigationShell,
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: _goBranch,
    );
  }
}

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
    super.key,
  });

  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        key: rootScaffoldStateKey,
        body: body,
        drawer: const Drawer(),
        bottomNavigationBar: BottomNavWidget(
          currentIndex: selectedIndex,
          onTap: onDestinationSelected,
        ),
      ),
    );
  }
}

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      surfaceTintColor: AppColors.skyWhite,
      elevation: 0,
      color: AppColors.skyWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                onTap(0);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: SvgPicture.asset(
                currentIndex == 0 ? SvgIcons.filledHome : SvgIcons.home,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                onTap(1);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: SvgPicture.asset(
                currentIndex == 1 ? SvgIcons.filledMessages : SvgIcons.messages,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                onTap(2);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: SvgPicture.asset(
                currentIndex == 2 ? SvgIcons.filledChart : SvgIcons.chart,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                onTap(3);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: SvgPicture.asset(
                currentIndex == 3 ? SvgIcons.filledDiscover : SvgIcons.discover,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                onTap(4);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: SvgPicture.asset(
                currentIndex == 4
                    ? SvgIcons.filledProfileCircle
                    : SvgIcons.profileCircle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
