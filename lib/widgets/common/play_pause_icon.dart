import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/providers/audio_provider.dart';
import 'package:provider/provider.dart';

class PlayPauseIcon extends StatelessWidget {
  final AnimatedIconData icon;
  final Color iconColor;
  final bool isSelected;
  final Duration duration;
  final Duration reverseDuration;

  const PlayPauseIcon({
    Key key,
    @required this.icon,
    @required this.iconColor,
    @required this.isSelected,
    this.duration = const Duration(milliseconds: 500),
    this.reverseDuration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final player = Provider.of<AudioProvider>(
        context,
        listen: false,
      ).player;
    return PlayerBuilder.isPlaying(
      player: player,
      builder: (_, isPlaying) {
        return _PlayPauseIcon(
          icon: icon,
          iconColor: iconColor,
          showPlayIcon: isSelected && isPlaying,
          duration: duration,
          reverseDuration: reverseDuration,
        );
      },
    );
  }
}

class _PlayPauseIcon extends StatefulWidget {
  final AnimatedIconData icon;
  final Color iconColor;
  final bool showPlayIcon;
  final Duration duration;
  final Duration reverseDuration;

  const _PlayPauseIcon({
    Key key,
    @required this.icon,
    @required this.iconColor,
    @required this.showPlayIcon,
    @required this.duration,
    @required this.reverseDuration,
  }) : super(key: key);

  @override
  _PlayPauseIconState createState() => _PlayPauseIconState();
}

class _PlayPauseIconState extends State<_PlayPauseIcon>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      reverseDuration: widget.reverseDuration,
    );
    if (widget.showPlayIcon) controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(_PlayPauseIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.showPlayIcon) {
      controller.forward(from: 0.0);
    } else {
      controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedIcon(
      progress: controller,
      icon: widget.icon,
      color: widget.iconColor,
    );
  }
}
