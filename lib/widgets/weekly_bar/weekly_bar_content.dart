import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/providers/weekly_provider.dart';
import 'package:flutter_time_tracker/widgets/weekly_bar/week_bar_list.dart';
import 'package:provider/provider.dart';

class WeeklyBarContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeeklyProvider>(context);
    final weeklyList = provider.weeklyList;
    return PageView.builder(
      onPageChanged: provider.onWeekChanged,
      itemCount: weeklyList.length,
      itemBuilder: (_, index) => WeekBarList(
        from: weeklyList[index],
      ),
    );
  }
}
