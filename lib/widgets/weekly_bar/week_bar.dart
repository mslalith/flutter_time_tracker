import 'package:flutter/material.dart';

class WeekBar extends StatelessWidget {
  final DateTime date;

  const WeekBar({
    Key key,
    @required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: date.day.isEven ? Colors.red : Colors.blue,
      child: Text('WeekBar'),
    );
  }
}