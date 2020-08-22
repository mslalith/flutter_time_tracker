import 'package:collection/collection.dart' show DeepCollectionEquality;
import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/models/task.dart';
import 'package:flutter_time_tracker/providers/weekly_provider.dart';
import 'package:flutter_time_tracker/themes/app_theme.dart';
import 'package:flutter_time_tracker/widgets/common/slide_text.dart';
import 'package:flutter_time_tracker/widgets/week_list/task_item.dart';
import 'package:provider/provider.dart';

class DayTasksList extends StatelessWidget {
  const DayTasksList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(24.0),
      ),
      child: Container(
        color: AppTheme.backgroundColor,
        child: Selector<WeeklyProvider, List<Task>>(
          selector: (_, provider) => provider.selectedDayTasks,
          builder: (context, selectedDayTasks, child) {
            return _DayTasksList(
              tasks: selectedDayTasks,
            );
          },
        ),
      ),
    );
  }
}

class _DayTasksList extends StatelessWidget {
  final List<Task> tasks;
  final double verticalPadding;

  const _DayTasksList({
    Key key,
    @required this.tasks,
    this.verticalPadding = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SlideText<List<Task>>(
            offset: Offset(0.0, 10.0),
            slideTransition: SlideEffect.slideOutAndIn,
            data: tasks,
            builder: (List<Task> tasks) => _builder(context, tasks),
            isEqual: (List<Task> oldData, newData) {
              final oldIds = oldData.map((task) => task.id).toSet();
              final newIds = newData.map((task) => task.id).toSet();
              return DeepCollectionEquality().equals(oldIds, newIds);
            },
          ),
        ),
        Positioned(
          height: verticalPadding * 1.5,
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppTheme.backgroundColor,
                  AppTheme.backgroundColor.withOpacity(0.7),
                  AppTheme.backgroundColor.withOpacity(0.0),
                ],
                stops: [0.4, 0.65, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Positioned(
          height: verticalPadding * 1.5,
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppTheme.backgroundColor,
                  AppTheme.backgroundColor.withOpacity(0.6),
                  AppTheme.backgroundColor.withOpacity(0.0),
                ],
                stops: [0.4, 0.65, 1.0],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _builder(BuildContext context, List<Task> tasks) {
    if (tasks.isEmpty) {
      return Center(
        child: Text(
          'No tasks for today',
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: AppTheme.darkTextColor,
              ),
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      physics: const BouncingScrollPhysics(),
      itemCount: tasks.length,
      itemBuilder: (_, index) => TaskItem(
        task: tasks[index],
        onItemPressed: context.read<WeeklyProvider>().setRunningTask,
      ),
    );
  }
}
