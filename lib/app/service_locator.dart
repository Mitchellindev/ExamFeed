import 'package:exam_feed/core/api/api_helper.dart';
import 'package:exam_feed/core/storage/cache_storage.dart';
import 'package:exam_feed/env/env.dart';
import 'package:exam_feed/features/auth/repository/auth_repository.dart';
import 'package:exam_feed/features/auth/repository/auth_repository_impl.dart';
import 'package:exam_feed/features/dashboard/repository/dashboard_repository.dart';
import 'package:exam_feed/features/dashboard/repository/dashboard_repository_impl.dart';
import 'package:get_it/get_it.dart';
// import 'package:twilio_flutter/twilio_flutter.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator({
  required AppEnvironment environment,
}) async {
  locator
    ..registerLazySingleton<AppEnvironment>(() => environment)
    ..registerLazySingleton<SharedPrefs>(SharedPrefs.new)
    ..registerLazySingleton<ApiHandler>(
      () => ApiHandler(baseUrl: Env().baseUrl),
    )
     ..registerLazySingleton<DashboardRepository>(
      () => DashboardRepositoryImpl(locator.get<ApiHandler>()),
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(locator.get<ApiHandler>()),
    );
  // ..registerLazySingleton<TimelineRepository>(
  //   () => TimelineRepositoryImpl(locator.get<ApiHandler>()),
  // )
  // ..registerLazySingleton<ProfileRepository>(
  //   () => ProfileRepositoryImpl(locator.get<ApiHandler>()),
  // )

  // ..registerLazySingleton<SearchRepository>(
  //   () => SearchRepositoryImpl(locator.get<ApiHandler>()),
  // );
}

extension GetItExtensions on GetIt {
  void setApiHandlerToken(String token) {
    // for (final element in ApiService.values) {
    get<ApiHandler>(
            // instanceName: element.name,
            )
        .addToken(token);
    // }
  }

  void clearApiHandlerToken() {
    // for (final element in ApiService.values) {
    get<ApiHandler>(
            // instanceName: element.name,
            )
        .clearToken();
    // }
  }
}
