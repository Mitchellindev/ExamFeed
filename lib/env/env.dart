

import 'package:exam_feed/app/service_locator.dart';
import 'package:exam_feed/env/development.dart';
import 'package:exam_feed/env/env_fields.dart';
import 'package:exam_feed/env/production.dart';
import 'package:exam_feed/env/staging.dart';

enum AppEnvironment { dev, staging, prod }

abstract interface class Env implements EnvFields {
  factory Env() => _instance;

  static final Env _instance = switch (locator<AppEnvironment>()) {
    AppEnvironment.dev => DevEnv(),
    AppEnvironment.staging => QaEnv(),
    AppEnvironment.prod => ProdEnv(),
  };
}
