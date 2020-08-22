import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/models/task.dart';
import 'package:flutter_time_tracker/providers/audio_provider.dart';
import 'package:flutter_time_tracker/providers/weekly_provider.dart';
import 'package:flutter_time_tracker/themes/app_theme.dart';
import 'package:flutter_time_tracker/widgets/common/play_pause_icon.dart';
import 'package:provider/provider.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Function(Task) onItemPressed;

  const TaskItem({
    Key key,
    @required this.task,
    @required this.onItemPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<WeeklyProvider, Task>(
      selector: (_, provider) => provider.runningTask,
      builder: (_, runningTask, child) {
        final isSelectedTask = runningTask.id == task.id;
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              await _handleAudio(context, isSelectedTask);
              onItemPressed(task);
            },
            splashColor: AppTheme.barPlayColor.withOpacity(0.3),
            hoverColor: AppTheme.barPlayColor.withOpacity(0.1),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: isSelectedTask
                    ? AppTheme.barPlayColor.withOpacity(0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: _TaskItem(
                task: task,
                isSelected: isSelectedTask,
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _handleAudio(BuildContext context, bool isSelected) async {
    final audioPlayer = context.read<AudioProvider>();
    if (isSelected) {
      await audioPlayer.toggle();
    } else {
      await audioPlayer.setAudio(task.audioFileName);
      await audioPlayer.play();
    }
  }
}

class _TaskItem extends StatelessWidget {
  final Task task;
  final bool isSelected;

  const _TaskItem({
    Key key,
    @required this.task,
    @required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final minutes = task.audioDuration ~/ 60;
    final seconds = (task.audioDuration % 60).toString().padLeft(2, '0');
    final time = '$minutes:$seconds';

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppTheme.barPlayColor.withOpacity(0.2),
        child: PlayPauseIcon(
          icon: AnimatedIcons.play_pause,
          iconColor: AppTheme.barPlayColor,
          isSelected: isSelected,
        ),
      ),
      title: Text(
        task.from,
        style: Theme.of(context).textTheme.caption.copyWith(
              color: AppTheme.darkTextColor.withOpacity(0.7),
              letterSpacing: 1.0,
            ),
      ),
      subtitle: Text(
        task.title,
        style: Theme.of(context).textTheme.bodyText1.copyWith(
              color: AppTheme.darkTextColor,
            ),
      ),
      trailing: Text(
        time,
        style: Theme.of(context).textTheme.bodyText1.copyWith(
              color: AppTheme.darkTextColor,
              fontFamily: 'RobotoMono',
            ),
      ),
    );
  }
}
