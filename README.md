dart pub global activate spider
spider build --watch

dart pub global activate flutterfire_cli
flutterfire configure

flutter build apk  --target=lib/app/main.dev.dart --flavor=development 