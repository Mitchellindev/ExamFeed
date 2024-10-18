import 'package:exam_feed/config/router/app_router.dart';
import 'package:exam_feed/config/router/routes.dart';
import 'package:exam_feed/core/utils/app_constraints.dart';
import 'package:exam_feed/features/auth/bloc/auth_bloc.dart';
import 'package:exam_feed/features/auth/data/providers/auth_provider.dart';
import 'package:exam_feed/features/auth/data/repositories/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    AppConstraints().initialize(context);

    final appRouter = AppRouter();

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocProvider(
            create: (context) => AuthBloc(
                authRepo: AuthRepository(
                    // localDataSource: AuthUserLocalDataSourceImpl(),
                    provider: AuthProvider())),
            child: MaterialApp(
              theme: ThemeData(
                useMaterial3: true,
                fontFamily: 'Nunito',
              ),
              debugShowCheckedModeBanner: false,
              title: 'ExamFeed',
              initialRoute: Routes.splash,
              onGenerateRoute: appRouter.onGenerateRoute,
            ),
          );
        },
      ),
    );
  }
}
