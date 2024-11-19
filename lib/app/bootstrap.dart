import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:exam_feed/app/service_locator.dart';
import 'package:exam_feed/core/storage/cache_storage.dart';
import 'package:exam_feed/env/env.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final notificationPlugin = FlutterLocalNotificationsPlugin();
const initializationSettings = InitializationSettings(
  android: AndroidInitializationSettings('@mipmap/ic_launcher'),
  iOS: DarwinInitializationSettings(
    requestProvisionalPermission: true,
    requestCriticalPermission: true,
  ),
);
void onMessage(RemoteMessage message) {
  final id = (message.notification?.title?.length ?? 0) *
      (message.notification?.body?.length ?? 0);
  notificationPlugin.show(
    id,
    '${message.notification?.title}',
    '${message.notification?.body}',
    NotificationDetails(
      android: AndroidNotificationDetails(
        '${message.notification?.android?.channelId}',
        'ExamFeed',
      ),
      iOS: const DarwinNotificationDetails(
        interruptionLevel: InterruptionLevel.critical,
        presentAlert: true,
        presentSound: true,
        presentBadge: true,
        presentBanner: true,
      ),
    ),
  );
  log(message.toString(), name: 'onMessage');
}

Future<void> onBackgroundMessage(RemoteMessage message) async {
  final id = (message.notification?.title?.length ?? 0) *
      (message.notification?.body?.length ?? 0);
  await notificationPlugin.show(
    id,
    '${message.notification?.title}',
    '${message.notification?.body}',
    NotificationDetails(
      android: AndroidNotificationDetails(
        '${message.notification?.android?.channelId}',
        'ExamFeed',
      ),
      iOS: const DarwinNotificationDetails(
        interruptionLevel: InterruptionLevel.critical,
        presentAlert: true,
        presentSound: true,
        presentBadge: true,
        presentBanner: true,
      ),
    ),
  );

  log(message.toString(), name: 'onBackgroundMessage');
}

Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
    {
  required AppEnvironment environment,
}
) async {
  try {
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = (details) {
      log(
        details.exceptionAsString(),
        stackTrace: details.stack,
        name: details.exception.runtimeType.toString(),
      );
    };

    await notificationPlugin.initialize(initializationSettings);
    await Firebase.initializeApp();
    await setupLocator(environment: environment);
    await locator.get<SharedPrefs>().init();

    await FirebaseMessaging.instance.requestPermission(provisional: true);
    FirebaseMessaging.onMessage.listen(onMessage);
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
    await FirebaseCrashlytics.instance
        .setCrashlyticsCollectionEnabled(!kDebugMode);

    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);

      return true;
    };
    // setLocaleMessages('en', MyCustomMessages());
    runApp(await builder());
  } catch (e, s) {
    log(e.toString(), name: 'bootstrap');
    // await FirebaseCrashlytics.instance.recordError(e, s, fatal: true);
  }
}
