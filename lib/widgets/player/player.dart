import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/themes/app_theme.dart';
import 'package:flutter_time_tracker/widgets/common/circular_icon_button.dart';
import 'package:flutter_time_tracker/widgets/player/player_button.dart';
import 'package:flutter_time_tracker/widgets/player/player_time.dart';
import 'package:flutter_time_tracker/widgets/player/player_title.dart';

class Player extends StatelessWidget {
  const Player({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.bottomPlayerBackgroundColor,
      alignment: Alignment.center,
      child: ListTile(
        leading: const PlayerButton(),
        title: const PlayerTime(),
        subtitle: const PlayerTitle(),
        trailing: CircularIconButton(
          icon: Icons.more_horiz,
          iconColor: AppTheme.lightTextColor.withOpacity(0.5),
          onPressed: () {},
        ),
      ),
    );
  }
}
