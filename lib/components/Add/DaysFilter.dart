import 'package:flutter/material.dart';
import 'package:flutterFcmTest/components/RoundToggle.dart';
import 'package:flutterFcmTest/models/common/DayType.dart';

class DaysFilter extends StatefulWidget {

  final Function(List<DayType>) onChanged;

  DaysFilter({
    Key key,
    this.onChanged
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DaysFilterState();
}

class _DaysFilterState extends State<DaysFilter> {

  List<DayType> selectedDay = List<DayType>();


  Function(List<DayType>) get onChanged => widget.onChanged;


  void invokeChange() => onChanged?.call(selectedDay);

  void onDayButton(DayType dayType) {
    setState(() {
      if(selectedDay.contains(dayType)) {
        selectedDay.remove(dayType);
      }
      else {
        selectedDay.add(dayType);
      }
    });
  }
  
  Widget getDayToggle(DayType dayType) {
    return RoundToggle(
      isToggled: selectedDay.contains(dayType),
      label: dayType.toInitialString(),
      onPressed: () => onDayButton(dayType),
    );
  }



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.0,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: DayType.values.map((day) => getDayToggle(day)).toList(),
        ),
      ),
    );
  }
}