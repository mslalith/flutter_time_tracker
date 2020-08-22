import 'dart:math' show max;

import 'package:flutter/material.dart' show required;
import 'package:flutter_time_tracker/extensions.dart';
import 'package:flutter_time_tracker/models/day_tasks.dart';
import 'package:flutter_time_tracker/models/task.dart';

class WeeklyTasks {
  final List<DayTasks> dayTasks;
  final int maxSeconds;
  final int totalWeekSeconds;

  const WeeklyTasks({
    @required this.dayTasks,
    @required this.maxSeconds,
    @required this.totalWeekSeconds,
  });

  static WeeklyTasks weeklyTasks(DateTime from) {
    int maxSeconds = 0;
    int weekSeconds = 0;
    final tasks = <DayTasks>[];
    final localTasks = Task.weeklyData(from, from.nextWeek());

    for (int i = 0; i < 7; i++) {
      final date = from.add(Duration(days: i));
      int totalSeconds = 0;
      List<Task> todayTasks =
          localTasks.where((task) => task.date.isEqualTo(date)).toList();
      totalSeconds = todayTasks.fold(
        totalSeconds,
        (previous, task) => previous + task.audioDuration,
      );
      weekSeconds += totalSeconds;
      maxSeconds = max(totalSeconds, maxSeconds);

      final dayTask = DayTasks(
        date: date,
        tasks: todayTasks,
        totalSeconds: totalSeconds,
      );

      tasks.add(dayTask);
    }

    return WeeklyTasks(
      dayTasks: tasks,
      maxSeconds: maxSeconds,
      totalWeekSeconds: weekSeconds,
    );
  }
}
