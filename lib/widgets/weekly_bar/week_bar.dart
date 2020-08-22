import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/extensions.dart';
import 'package:flutter_time_tracker/models/day_tasks.dart';
import 'package:flutter_time_tracker/providers/weekly_provider.dart';
import 'package:flutter_time_tracker/themes/app_theme.dart';
import 'package:provider/provider.dart';

class WeekBar extends StatelessWidget {
  final DayTasks dayTasks;
  final int maxSeconds;
  final Function(DateTime) onBarPressed;

  const WeekBar({
    Key key,
    @required this.dayTasks,
    @required this.maxSeconds,
    @required this.onBarPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final barSize = Size(
          constraints.maxWidth,
          constraints.maxHeight,
        );
        final percent =
            maxSeconds != 0 ? (dayTasks.totalSeconds / maxSeconds) : 0;
        final date = dayTasks.date;

        final minutes = dayTasks.totalSeconds ~/ 60;
        final seconds = (dayTasks.totalSeconds % 60).toString().padLeft(2, '0');
        final time = '$minutes:$seconds';

        return Selector<WeeklyProvider, DateTime>(
            selector: (_, provider) => provider.selectedDay,
            builder: (_, selectedDay, child) {
              final isSelected = selectedDay?.isAtSameMomentAs(date) ?? false;
              final textHeight = 20.0;
              final marginSize = 6.0;
              final barHeight =
                  barSize.height - (marginSize * 6) - (textHeight * 2);

              return InkWell(
                onTap: () => onBarPressed(date),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  width: barSize.width,
                  height: barSize.height,
                  margin: EdgeInsets.symmetric(
                    horizontal: 2.0,
                    vertical: marginSize,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppTheme.barPlayColor.withOpacity(0.2)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: marginSize),
                      Spacer(),
                      SizedBox(
                        height: textHeight,
                        child: Text(
                          time,
                          style: Theme.of(context).textTheme.caption.copyWith(
                                color: AppTheme.darkTextColor.withOpacity(
                                  dayTasks.totalSeconds == 0 ? 0.4 : 0.8,
                                ),
                                fontFamily: 'RobotoMono',
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      SizedBox(height: marginSize),
                      Container(
                        width: 4.0,
                        height: barHeight * percent,
                        decoration: BoxDecoration(
                          color: AppTheme.barPlayColor,
                          borderRadius: BorderRadius.circular(60.0),
                        ),
                      ),
                      SizedBox(height: marginSize),
                      SizedBox(
                        height: textHeight,
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 800),
                          child: Text(date.weekdayShort),
                          style: Theme.of(context).textTheme.caption.copyWith(
                                color: isSelected
                                    ? AppTheme.barPlayColor
                                    : AppTheme.darkTextColor.withOpacity(0.4),
                              ),
                        ),
                      ),
                      SizedBox(height: marginSize),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
