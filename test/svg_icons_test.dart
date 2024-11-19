import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:exam_feed/resources/resources.dart';

void main() {
  test('svg_icons assets test', () {
    expect(File(SvgIcons.arrowRight).existsSync(), isTrue);
    expect(File(SvgIcons.googleIcon).existsSync(), isTrue);
  });
}
