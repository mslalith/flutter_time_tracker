import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/models/weekly_tasks.dart';
import 'package:flutter_time_tracker/providers/weekly_provider.dart';
import 'package:flutter_time_tracker/themes/app_theme.dart';
import 'package:flutter_time_tracker/widgets/weekly_bar/week_bar.dart';
import 'package:provider/provider.dart';

class WeekBarList extends StatelessWidget {
  const WeekBarList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Row(
        children: [
          for (int i = 0; i < 7; i++)
            Expanded(
              child: Selector<WeeklyProvider, WeeklyTasks>(
                selector: (_, provider) => provider.currentWeeklyTasks,
                builder: (_, weeklyTasks, child) {
                  return WeekBar(
                    dayTasks: weeklyTasks.dayTasks[i],
                    maxSeconds: weeklyTasks.maxSeconds,
                    onBarPressed: context.read<WeeklyProvider>().setSelectedDay,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
