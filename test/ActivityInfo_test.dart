import 'package:flutterFcmTest/models/activity/ActivityInfo.dart';
import 'package:flutterFcmTest/models/common/DayType.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Construction of activity from map", () {
    ActivityInfo info = ActivityInfo.fromMap({
      "name": "lol",
      "days": ["Monday", "Wednesday"]
    });
    expect(info.name, equals("lol"));
    expect(info.days.length, equals(2));
    expect(info.days[0], equals(DayType.Monday));
    expect(info.days[1], equals(DayType.Wednesday));
  });

  test("ActivityInfo to map", () {
    ActivityInfo info = ActivityInfo(name: "test", days: [DayType.Tuesday, DayType.Sunday]);
    
    Map<String, dynamic> map = info.toMap();
    expect(map["name"], equals("test"));

    final days = map["days"];
    expect(days is List<String>, isTrue);
    expect(days.length, equals(2));
    expect(days[0], equals("Tuesday"));
    expect(days[1], equals("Sunday"));
  });
}