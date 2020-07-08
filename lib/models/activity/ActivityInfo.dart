import 'package:flutterFcmTest/models/common/DayType.dart';

class ActivityInfo {

  final String name;
  final List<DayType> days;

  ActivityInfo({
    this.name,
    this.days
  });

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