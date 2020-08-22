import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/providers/audio_provider.dart';
import 'package:flutter_time_tracker/providers/weekly_provider.dart';
import 'package:flutter_time_tracker/widgets/weekly_bar/week_bar_list.dart';
import 'package:provider/provider.dart';

class WeeklyBarContent extends StatefulWidget {
  const WeeklyBarContent({
    Key key,
  }) : super(key: key);

  @override
  _WeeklyBarContentState createState() => _WeeklyBarContentState();
}

class _WeeklyBarContentState extends State<WeeklyBarContent> {
  WeeklyProvider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<WeeklyProvider>(context, listen: false);
    provider.initWeeklyTasksList();
    // for initial selection of Day and a Task.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final task = provider.runningTask;
      context.read<AudioProvider>().setAudio(task.audioFileName);
      provider.notify();
    });
  }

  @override
  Widget build(BuildContext context) {
    final weeklyList = provider.weeklyList;
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      onPageChanged: provider.onWeekChanged,
      itemCount: weeklyList.length,
      itemBuilder: (_, index) => const WeekBarList(),
    );
  }
}
