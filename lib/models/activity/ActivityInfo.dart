import 'package:flutterFcmTest/models/common/DayType.dart';

class ActivityInfo {

  final String name;
  final List<DayType> days;

  ActivityInfo({
    this.name,
    this.days
  });

  ActivityInfo.fromMap(Map<dynamic, dynamic> data) :
    name = data["name"],
    // This is a dirty way of parsing enum array due to Dart's limitation on enums.
    days = List<String>.from(data["days"])
      .map((dayString) => DayType.values.firstWhere((day) => day.toValueString() == dayString)
    ).toList();

  bool containsDay(DayType day) => days.contains(day);

  Map<String, dynamic> toMap() => {
    "name": this.name,
    "days": this.days.map((day) => day.toValueString()).toList()
  };

  String getDaysString() {
    String str = "";
    for(int i=0; i<days.length; i++) {
      if(i > 0)
        str += ", ";
      str += days[i].toValueString();
    }
    return str;
  }
}