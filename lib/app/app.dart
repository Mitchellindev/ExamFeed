import 'package:exam_feed/app/provider_setup.dart';
import 'package:exam_feed/app/router.dart';
import 'package:exam_feed/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class ExamFeed extends StatelessWidget {
  const ExamFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: ToastificationWrapper(
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (_, child) => MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: const TextScaler.linear(0.8)),
            child: OverlaySupport.global(
              child: GlobalLoaderOverlay(
                  useDefaultLoading: false,
                  overlayWidgetBuilder: (_) {
                    //ignored progress for the moment
                    return const Center(
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                        ),
                      ),
                    );
                  },
                child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    fontFamily: 'Nunito',
                    floatingActionButtonTheme:
                        const FloatingActionButtonThemeData(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      elevation: 0,
                    ),
                    appBarTheme: AppBarTheme(
                      surfaceTintColor: Colors.white,
                      elevation: 0,
                      color: Colors.white,
                      titleTextStyle: TextStyle(
                        color: AppColors.neutral1000,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    scaffoldBackgroundColor: Colors.white,
                    textSelectionTheme: TextSelectionThemeData(
                      cursorColor: AppColors.primaryColor,
                      selectionColor: AppColors.primaryColor.withOpacity(0.3),
                      selectionHandleColor: AppColors.primaryColor,
                    ),
                    tabBarTheme: const TabBarTheme(
                      labelStyle: TextStyle(
                        fontSize: 14,
                        color: AppColors.neutral1000,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontSize: 14,
                        color: AppColors.neutral600,
                      ),
                      indicator: BoxDecoration(),
                      dividerColor: Colors.transparent,
                    ),
                    checkboxTheme: CheckboxThemeData(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      side: const BorderSide(
                        color: AppColors.primaryColor,
                        width: 0.8,
                      ),
                      fillColor: WidgetStateProperty.resolveWith(
                        (states) {
                          if (states.contains(WidgetState.selected)) {
                            return AppColors.primaryColor;
                          }
                          return AppColors.neutral10;
                        },
                      ),
                    ),
                    radioTheme: RadioThemeData(
                      fillColor: WidgetStateProperty.resolveWith(
                        (states) {
                          if (states.contains(WidgetState.selected)) {
                            return AppColors.primaryColor;
                          }
                          return AppColors.neutral10;
                        },
                      ),
                    ),
                    bottomSheetTheme: const BottomSheetThemeData(
                      dragHandleColor: AppColors.dragColor,
                      dragHandleSize: Size(60, 5),
                      showDragHandle: true,
                      backgroundColor: AppColors.skyWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  routerConfig: router,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
