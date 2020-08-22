import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/providers/audio_provider.dart';
import 'package:flutter_time_tracker/themes/app_theme.dart';
import 'package:flutter_time_tracker/widgets/common/play_pause_icon.dart';
import 'package:provider/provider.dart';

class PlayerButton extends StatelessWidget {
  const PlayerButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.barPlayColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60.0),
      ),
      child: InkWell(
        onTap: () => context.read<AudioProvider>().toggle(),
        borderRadius: BorderRadius.circular(60.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 24.0,
          child: PlayPauseIcon(
            icon: AnimatedIcons.play_pause,
            iconColor: AppTheme.backgroundColor,
            isSelected: true,
          ),
        ),
      ),
    );
  }
}
