import 'dart:async';

import 'package:exam_feed/app/app.dart';
import 'package:exam_feed/app/bootstrap.dart';
import 'package:exam_feed/env/env.dart';



void main() async {
  // await setupLocator(environment: AppEnvironment.dev);
 unawaited(
    bootstrap(
      () => const ExamFeed(),
       environment: AppEnvironment.staging,
     
    ),
  );
}
