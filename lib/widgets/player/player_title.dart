import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/models/task.dart';
import 'package:flutter_time_tracker/providers/weekly_provider.dart';
import 'package:flutter_time_tracker/themes/app_theme.dart';
import 'package:flutter_time_tracker/widgets/common/slide_text.dart';
import 'package:provider/provider.dart';

class PlayerTitle extends StatelessWidget {
  const PlayerTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<WeeklyProvider, Task>(
      selector: (_, provider) => provider.runningTask,
      builder: (_, runningTask, child) {
        if (runningTask == null) return Container();

        return SlideText<String>(
          offset: Offset(0.0, 10.0),
          data: runningTask.title,
          builder: (String title) {
            return Text(
              title,
              style: Theme.of(context).textTheme.button.copyWith(
                    color: AppTheme.lightTextColor,
                  ),
            );
          },
        );
      },
    );
  }
}
