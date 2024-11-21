import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:exam_feed/resources/resources.dart';

void main() {
  test('svg_icons assets test', () {
    expect(File(SvgIcons.circle).existsSync(), isTrue);
    expect(File(SvgIcons.arrowBack).existsSync(), isTrue);
    expect(File(SvgIcons.arrowRight).existsSync(), isTrue);
    expect(File(SvgIcons.back).existsSync(), isTrue);
    expect(File(SvgIcons.chart).existsSync(), isTrue);
    expect(File(SvgIcons.discover).existsSync(), isTrue);
    expect(File(SvgIcons.filledChart).existsSync(), isTrue);
    expect(File(SvgIcons.filledDiscover).existsSync(), isTrue);
    expect(File(SvgIcons.filledHome).existsSync(), isTrue);
    expect(File(SvgIcons.filledMessages).existsSync(), isTrue);
    expect(File(SvgIcons.filledProfileCircle).existsSync(), isTrue);
    expect(File(SvgIcons.googleIcon).existsSync(), isTrue);
    expect(File(SvgIcons.home).existsSync(), isTrue);
    expect(File(SvgIcons.messages).existsSync(), isTrue);
    expect(File(SvgIcons.profileCircle).existsSync(), isTrue);
  });
}
