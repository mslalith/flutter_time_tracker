import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/themes/app_theme.dart';
import 'package:flutter_time_tracker/widgets/player/player.dart';
import 'package:flutter_time_tracker/widgets/profile_app_bar/profile_app_bar.dart';
import 'package:flutter_time_tracker/widgets/week_list/day_tasks_list.dart';
import 'package:flutter_time_tracker/widgets/weekly_bar/weekly_bar_content.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bottomPlayerHeight = 90.0;
    return Stack(
      children: [
        Positioned(
          height: bottomPlayerHeight,
          bottom: bottomPlayerHeight - 1,
          left: 0.0,
          right: 0.0,
          child: Container(color: AppTheme.bottomPlayerBackgroundColor),
        ),
        Positioned(
          height: bottomPlayerHeight,
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: const Player(),
        ),
        Positioned.fill(
          bottom: bottomPlayerHeight,
          child: Column(
            children: [
              const ProfileAppBar(),
              Expanded(
                flex: 4,
                child: const WeeklyBarContent(),
              ),
              Expanded(
                flex: 6,
                child: const DayTasksList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
