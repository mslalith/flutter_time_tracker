import 'package:flutter/material.dart' show ChangeNotifier;
import 'package:flutter_time_tracker/models/day_tasks.dart';
import 'package:flutter_time_tracker/models/task.dart';
import 'package:flutter_time_tracker/models/weekly_tasks.dart';
import 'package:flutter_time_tracker/extensions.dart';

class WeeklyProvider extends ChangeNotifier {
  List<DateTime> _weeklyList = <DateTime>[
    DateTime(2020, 4, 8),
    DateTime(2020, 4, 15),
  ];
  List<DateTime> get weeklyList => _weeklyList;
  List<WeeklyTasks> _weeklyTasksList = [];

  void initWeeklyTasksList() {
    for (final date in _weeklyList)
      _weeklyTasksList.add(WeeklyTasks.weeklyTasks(date));

    _currentWeek = 0;
    _currentWeeklyTasks = _weeklyTasksList[_currentWeek];
    setSelectedDay(DateTime(2020, 4, 9), notify: false);
    _runningTask = _selectedDayTasks[1];
    _dateHeaderText = '${from.monthShort} ${from.day} — ${to.day}';
  }

  int get maxWeekSeconds => const Duration(minutes: 30).inSeconds;

  int _currentWeek = 0;
  int get currentWeek => _currentWeek;

  String _dateHeaderText = '';
  String get dateHeaderText => _dateHeaderText;

  WeeklyTasks _currentWeeklyTasks;
  WeeklyTasks get currentWeeklyTasks => _currentWeeklyTasks;

  DateTime get from => _weeklyList[_currentWeek];
  DateTime get to => _weeklyList[_currentWeek].nextWeek();

  List<DayTasks> _dayTasks = [];
  List<DayTasks> get dayTasks => _dayTasks;
  set dayTasks(List<DayTasks> tasks) {
    if (tasks != null) _dayTasks = tasks;
  }

  Task _runningTask;
  Task get runningTask => _runningTask;
  void setRunningTask(Task task) {
    if (_runningTask.id == task.id) return;

    _runningTask = task;
    notifyListeners();
  }

  List<Task> _selectedDayTasks = [];
  List<Task> get selectedDayTasks => _selectedDayTasks;

  DateTime _selectedDay;
  DateTime get selectedDay => _selectedDay;
  void setSelectedDay(DateTime date, {bool notify = true}) {
    if (_selectedDay != null && _selectedDay.isAtSameMomentAs(date)) return;

    _selectedDay = date;
    _selectedDayTasks = currentWeeklyTasks.dayTasks
        .firstWhere((task) => task.date.isAtSameMomentAs(_selectedDay))
        .tasks;

    if (notify) notifyListeners();
  }

  void onWeekChanged(int index) {
    if (index == _currentWeek) return;
    _currentWeek = index;
    _currentWeeklyTasks = _weeklyTasksList[_currentWeek];
    _dateHeaderText = '${from.monthShort} ${from.day} — ${to.day}';
    notifyListeners();
  }

  void notify() => notifyListeners();
}
