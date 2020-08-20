import 'package:flutter/material.dart' show required;
import 'package:flutter_time_tracker/extensions.dart';
import 'package:flutter_time_tracker/models/day_tasks.dart';
import 'package:flutter_time_tracker/models/task.dart';

class WeeklyTasks {
  final List<DayTasks> dayTasks;
  final int maxSeconds;

  const WeeklyTasks({
    @required this.dayTasks,
    @required this.maxSeconds,
  });

  static WeeklyTasks weeklyTasks(DateTime from) {
    final tasks = <DayTasks>[];
    final maxSeconds = 0;
    final localTasks = Task.weeklyData(from, from.nextWeek());
    for (int i = 0; i < 7; i++) {
      final date = from.add(Duration(days: i));
      final todayTasks = localTasks
          .where(
            (task) => task.date.isAtSameMomentAs(date)
          )
          .toList();

      todayTasks.forEach((task) async {
      });

      final dayTask = DayTasks(
        date: date,
        tasks: todayTasks,
        totalSeconds: 0,
      );
      tasks.add(dayTask);
    }
    return WeeklyTasks(
      dayTasks: tasks,
      maxSeconds: maxSeconds,
    );
  }
}
