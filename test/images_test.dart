import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:exam_feed/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.logo).existsSync(), isTrue);
    expect(File(Images.onboard).existsSync(), isTrue);
    expect(File(Images.onboard1).existsSync(), isTrue);
    expect(File(Images.onboard2).existsSync(), isTrue);
  });
}
