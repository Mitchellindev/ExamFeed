import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart';

final urlRegex = RegExp(
  r'(?:https?://)?(?:www\.)?([a-zA-Z0-9-]+\.[a-zA-Z]{2,})(?:/[^ ]*)?',
);

extension StringExtensions on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  bool get isUrl => urlRegex.hasMatch(this);

  List<String> splitStringByUrls() {
    final Iterable<Match> matches = urlRegex.allMatches(this);

    final result = <String>[];
    var lastIndex = 0;
    for (final match in matches) {
      result
        ..add(substring(lastIndex, match.start))
        ..add(match.group(0)!);
      lastIndex = match.end;
    }
    result.add(substring(lastIndex));

    return result;
  }
}

extension NumberExtensions on int {
  String toK() {
    final numberFormat = NumberFormat.compact();
    return numberFormat.format(this);
  }
}

extension DateExtensions on DateTime {
  String notificationDateFormat() {
    return DateFormat('EEE dd, yyyy • h:MM a').format(this);
  }
}

class MyCustomMessages implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'just now';
  @override
  String aboutAMinute(int minutes) => '${minutes}m ago';
  @override
  String minutes(int minutes) => '${minutes}m ago';
  @override
  String aboutAnHour(int minutes) => '1h ago';
  @override
  String hours(int hours) => '${hours}h ago';
  @override
  String aDay(int hours) => '1d ago';
  @override
  String days(int days) => '${days}d ago';
  @override
  String aboutAMonth(int days) => '${days}d ago';
  @override
  String months(int months) => '$months months ago';
  @override
  String aboutAYear(int year) => '${year}y ago';
  @override
  String years(int years) => '${years}y ago';
  @override
  String wordSeparator() => ' ';
}
