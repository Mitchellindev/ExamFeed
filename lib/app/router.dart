
import 'package:exam_feed/app/router_paths.dart';
import 'package:exam_feed/features/auth/screens/splashscreen.dart';
import 'package:exam_feed/resources/colors.dart';
import 'package:exam_feed/resources/resources.dart';
import 'package:extended_image/extended_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

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
    ),
    // GoRoute(
    //   path: AppPath.auth.goRoute,
    //   // builder: (context, state) => const LoginScreen(),
    //   routes: [
       
       
    //   ],
    // ),
    // StatefulShellRoute.indexedStack(
    //   builder: (context, state, navigationShell) =>
    //       ScaffoldWithNestedNavigation(
    //     navigationShell: navigationShell,
    //   ),
    //   branches: [
    //     StatefulShellBranch(
    //       routes: [
    //         // GoRoute(
    //         //   path: AppPath.timeline.goRoute,
    //         //   builder: (context, state) => const TimelineScreen(),
    //         //   routes: [ 
    //         //   ],
    //         // ),
    //       ],
    //     ),
    //     StatefulShellBranch(
    //       routes: [
    //         // GoRoute(
    //         //   path: AppPath.search.goRoute,
    //         //   builder: (context, state) => const SearchScreen(),
    //         //   routes: [
               
    //         //   ],
    //         // ),
    //       ],
    //     ),
    //     StatefulShellBranch(
    //       routes: [
            
    //       ],
    //     ),
    //     StatefulShellBranch(
    //       routes: [
           
    //       ],
    //     ),
    //     StatefulShellBranch(
    //       routes: [
    //         // GoRoute(
    //         //   path: AppPath.profile.goRoute,
    //         //   builder: (context, state) => const ProfileScreen(),
    //         //   routes: [
             
    //         //   ],
    //         // ),
    //       ],
    //     ),
    //   ],
    // ),
  ],
);

// class ScaffoldWithNestedNavigation extends StatelessWidget {
//   const ScaffoldWithNestedNavigation({
//     required this.navigationShell,
//     super.key,
//   });

//   final StatefulNavigationShell navigationShell;

//   void _goBranch(int index) => navigationShell.goBranch(
//         index,
//         initialLocation: index == navigationShell.currentIndex,
//       );

//   @override
//   Widget build(BuildContext context) {
//     return ScaffoldWithNavigationBar(
//       body: navigationShell,
//       selectedIndex: navigationShell.currentIndex,
//       onDestinationSelected: _goBranch,
//     );
//   }
// }

// class ScaffoldWithNavigationBar extends StatelessWidget {
//   const ScaffoldWithNavigationBar({
//     required this.body,
//     required this.selectedIndex,
//     required this.onDestinationSelected,
//     super.key,
//   });

//   final Widget body;
//   final int selectedIndex;
//   final ValueChanged<int> onDestinationSelected;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: rootScaffoldStateKey,
//       body: body,
//       drawer: const Drawer(),
//       bottomNavigationBar: BottomNavWidget(
//         currentIndex: selectedIndex,
//         onTap: onDestinationSelected,
//       ),
//     );
//   }
// }

// class BottomNavWidget extends StatelessWidget {
//   const BottomNavWidget({
//     required this.currentIndex,
//     required this.onTap,
//     super.key,
//   });

//   final int currentIndex;
//   final ValueChanged<int> onTap;

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       surfaceTintColor: AppColors.skyWhite,
//       elevation: 0,
//       color: AppColors.skyWhite,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: InkWell(
//               onTap: () {
//                 onTap(0);
//               },
//               splashColor: Colors.transparent,
//               highlightColor: Colors.transparent,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SvgPicture.asset(
//                     currentIndex == 0
//                         ? SvgIcons.homeActive
//                         : SvgIcons.homeInactive,
//                   ),
//                   Text(
//                     'Home',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: currentIndex == 0
//                           ? AppColors.primaryColor
//                           : AppColors.neutral800,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: InkWell(
//               onTap: () {
//                 onTap(1);
//               },
//               splashColor: Colors.transparent,
//               highlightColor: Colors.transparent,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SvgPicture.asset(
//                     currentIndex == 1
//                         ? SvgIcons.searchActive
//                         : SvgIcons.searchInactive,
//                   ),
//                   Text(
//                     'Search',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: currentIndex == 1
//                           ? AppColors.primaryColor
//                           : AppColors.neutral800,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: InkWell(
//               onTap: () {
//                 onTap(2);
//               },
//               splashColor: Colors.transparent,
//               highlightColor: Colors.transparent,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SvgPicture.asset(
//                     currentIndex == 2
//                         ? SvgIcons.globeActive
//                         : SvgIcons.globeInactive,
//                   ),
//                   Text(
//                     'Community',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: currentIndex == 2
//                           ? AppColors.primaryColor
//                           : AppColors.neutral800,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: InkWell(
//               onTap: () {
//                 onTap(3);
//               },
//               splashColor: Colors.transparent,
//               highlightColor: Colors.transparent,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SvgPicture.asset(
//                     currentIndex == 3
//                         ? SvgIcons.messageActive
//                         : SvgIcons.messageInactive,
//                   ),
//                   Text(
//                     'Messaging',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: currentIndex == 3
//                           ? AppColors.primaryColor
//                           : AppColors.neutral800,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: InkWell(
//               onTap: () {
//                 onTap(4);
//               },
//               splashColor: Colors.transparent,
//               highlightColor: Colors.transparent,
//               child: Container(
//                 width: 34,
//                 height: 34,
//                 decoration: BoxDecoration(
//                   color: currentIndex == 4
//                       ? AppColors.primaryColor
//                       : AppColors.neutral400,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Padding(
//                   padding: REdgeInsets.all(2),
//                   child: Container(),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
