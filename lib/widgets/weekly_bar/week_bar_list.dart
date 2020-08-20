import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/models/weekly_tasks.dart';
import 'package:flutter_time_tracker/widgets/weekly_bar/week_bar.dart';
import 'package:just_audio/just_audio.dart';

class WeekBarList extends StatefulWidget {
  final DateTime from;

  const WeekBarList({
    Key key,
    @required this.from,
  }) : super(key: key);

  @override
  _WeekBarListState createState() => _WeekBarListState();
}

class _WeekBarListState extends State<WeekBarList> {
  WeeklyTasks weeklyTasks;

  @override
  void initState() {
    super.initState();
    // weeklyTasks = WeeklyTasks.weeklyTasks(widget.from);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final player = AudioPlayer();
      final duration = await player.setUrl(url);
      print('Duration: $duration');
      await player.play();
      await player.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 7; i++)
          Expanded(
            child: WeekBar(
              date: widget.from.add(Duration(days: i)),
            ),
          ),
      ],
    );
  }
}
