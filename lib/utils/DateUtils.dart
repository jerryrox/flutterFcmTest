import 'package:flutterFcmTest/models/common/DayType.dart';

class DateUtils {

  /// Returns the today's day of the week.
  static DayType getTodayType() {
    return DayType.values[DateTime.now().weekday];
  }
}