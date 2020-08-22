import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/models/task.dart';
import 'package:flutter_time_tracker/providers/audio_provider.dart';
import 'package:flutter_time_tracker/providers/weekly_provider.dart';
import 'package:flutter_time_tracker/themes/app_theme.dart';
import 'package:flutter_time_tracker/widgets/common/slide_text.dart';
import 'package:provider/provider.dart';

class PlayerTime extends StatelessWidget {
  const PlayerTime({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final player = Provider.of<AudioProvider>(
      context,
      listen: false,
    ).player;

    return Selector<WeeklyProvider, Task>(
      selector: (_, provider) => provider.runningTask,
      builder: (_, runningTask, child) {
        if (runningTask == null) return Container();

        return SlideText<int>(
          offset: Offset(0.0, 10.0),
          data: runningTask.id,
          builder: (int id) {
            return PlayerBuilder.currentPosition(
              player: player,
              builder: (_, duration) {
                return Row(
                  children: [
                    _withSlideText(duration.inHours),
                    _text(':'),
                    _withSlideText(duration.inMinutes ~/ 10),
                    _withSlideText(duration.inMinutes % 10),
                    _text(':', dim: true),
                    _withSlideText((duration.inSeconds % 60) ~/ 10, dim: true),
                    _withSlideText((duration.inSeconds % 60) % 10, dim: true),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _withSlideText(int value, {bool dim = false}) {
    return SlideText<int>(
      offset: Offset(0.0, 10.0),
      duration: const Duration(milliseconds: 100),
      data: value,
      builder: (number) => _text('$number', dim: dim),
    );
  }

  Widget _text(String number, {bool dim = false}) {
    return Text(
      number,
      style: TextStyle(
        fontSize: 14.0,
        color: AppTheme.lightTextColor.withOpacity(dim ? 0.4 : 0.7),
        fontFamily: 'RobotoMono',
      ),
    );
  }
}
