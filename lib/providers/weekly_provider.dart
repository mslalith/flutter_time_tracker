import 'package:flutter/material.dart' show ChangeNotifier;

class WeeklyProvider extends ChangeNotifier {
  List<DateTime> _weeklyList = <DateTime>[
    DateTime(2020, 4, 8),
    DateTime(2020, 4, 15),
  ];
  List<DateTime> get weeklyList => _weeklyList;

  int _currentWeek = 1;
  int get currentWeek => _currentWeek;

  DateTime get from => _weeklyList[_currentWeek];
  // as the `to` day is inclusive, we add only 6 days
  DateTime get to => _weeklyList[_currentWeek].add(const Duration(days: 6));

  void onWeekChanged(int index) {
    if (index == _currentWeek) return;
    _currentWeek = index;
    notifyListeners();
  }
}
