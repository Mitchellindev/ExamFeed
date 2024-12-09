import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:exam_feed/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.logo).existsSync(), isTrue);
    expect(File(Images.camera).existsSync(), isTrue);
    expect(File(Images.goldenTrophy).existsSync(), isTrue);
    expect(File(Images.maths).existsSync(), isTrue);
    expect(File(Images.onboard).existsSync(), isTrue);
    expect(File(Images.onboard1).existsSync(), isTrue);
    expect(File(Images.onboard2).existsSync(), isTrue);
    expect(File(Images.vanguard).existsSync(), isTrue);
    expect(File(Images.waec2).existsSync(), isTrue);
  });
}
