enum DayType {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday
}

extension DayTypeExtension on DayType {

  String toValueString() {
    return this.toString().split(".").last;
  }
}