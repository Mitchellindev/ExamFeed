import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:exam_feed/resources/resources.dart';

void main() {
  test('svg_icons assets test', () {
    expect(File(SvgIcons.circle).existsSync(), isTrue);
    expect(File(SvgIcons.component9).existsSync(), isTrue);
    expect(File(SvgIcons.archiveAddGray).existsSync(), isTrue);
    expect(File(SvgIcons.archiveAdd).existsSync(), isTrue);
    expect(File(SvgIcons.archiveTick).existsSync(), isTrue);
    expect(File(SvgIcons.arrowLeft).existsSync(), isTrue);
    expect(File(SvgIcons.arrowBack).existsSync(), isTrue);
    expect(File(SvgIcons.arrowRight).existsSync(), isTrue);
    expect(File(SvgIcons.back).existsSync(), isTrue);
    expect(File(SvgIcons.bookSaved).existsSync(), isTrue);
    expect(File(SvgIcons.chart).existsSync(), isTrue);
    expect(File(SvgIcons.directNotification).existsSync(), isTrue);
    expect(File(SvgIcons.discover).existsSync(), isTrue);
    expect(File(SvgIcons.dislike).existsSync(), isTrue);
    expect(File(SvgIcons.filledChart).existsSync(), isTrue);
    expect(File(SvgIcons.filledDiscover).existsSync(), isTrue);
    expect(File(SvgIcons.filledHome).existsSync(), isTrue);
    expect(File(SvgIcons.filledMessages).existsSync(), isTrue);
    expect(File(SvgIcons.filledProfileCircle).existsSync(), isTrue);
    expect(File(SvgIcons.googleIcon).existsSync(), isTrue);
    expect(File(SvgIcons.home).existsSync(), isTrue);
    expect(File(SvgIcons.iconParkOutlineTime).existsSync(), isTrue);
    expect(File(SvgIcons.key).existsSync(), isTrue);
    expect(File(SvgIcons.like).existsSync(), isTrue);
    expect(File(SvgIcons.logout).existsSync(), isTrue);
    expect(File(SvgIcons.menu).existsSync(), isTrue);
    expect(File(SvgIcons.messageText).existsSync(), isTrue);
    expect(File(SvgIcons.messages).existsSync(), isTrue);
    expect(File(SvgIcons.ouiArrowDown).existsSync(), isTrue);
    expect(File(SvgIcons.ouiArrowUp).existsSync(), isTrue);
    expect(File(SvgIcons.phQuestion).existsSync(), isTrue);
    expect(File(SvgIcons.profileCircle).existsSync(), isTrue);
    expect(File(SvgIcons.rowVertical).existsSync(), isTrue);
    expect(File(SvgIcons.sms).existsSync(), isTrue);
    expect(File(SvgIcons.solarShareOutline).existsSync(), isTrue);
    expect(File(SvgIcons.star).existsSync(), isTrue);
    expect(File(SvgIcons.timer).existsSync(), isTrue);
    expect(File(SvgIcons.userEdit).existsSync(), isTrue);
    expect(File(SvgIcons.waec2).existsSync(), isTrue);
  });
}
