import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/models/weekly_tasks.dart';
import 'package:flutter_time_tracker/providers/weekly_provider.dart';
import 'package:flutter_time_tracker/themes/app_theme.dart';
import 'package:flutter_time_tracker/widgets/common/slide_text.dart';
import 'package:provider/provider.dart';

class ProfileTime extends StatelessWidget {
  const ProfileTime({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<WeeklyProvider, WeeklyTasks>(
      selector: (_, provider) => provider.currentWeeklyTasks,
      builder: (_, weeklyTasks, child) {
        if (weeklyTasks == null) return Container();

        final minutes = weeklyTasks.totalWeekSeconds ~/ 60;
        final seconds =
            (weeklyTasks.totalWeekSeconds % 60).toString().padLeft(2, '0');
        final time = '$minutes:$seconds';
        return SlideText<String>(
          data: time,
          builder: (String time) {
            return Text(
              time,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: AppTheme.darkTextColor,
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.bold,
                  ),
            );
          },
        );
      },
    );
  }
}
