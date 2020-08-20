import 'package:flutter/material.dart' show required;
import 'package:flutter_time_tracker/models/task.dart';

class DayTasks {
  final DateTime date;
  final List<Task> tasks;
  final int totalSeconds;

  DayTasks({
    @required this.date,
    @required this.tasks,
    @required this.totalSeconds,
  });
}
