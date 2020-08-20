import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/widgets/bottom_player.dart';
import 'package:flutter_time_tracker/widgets/profile_app_bar.dart';
import 'package:flutter_time_tracker/widgets/week_list/day_items_list.dart';
import 'package:flutter_time_tracker/widgets/weekly_bar/weekly_bar_content.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bottomPlayerHeight = 90.0;
    return Column(
      children: [
        const ProfileAppBar(),
        Expanded(
          flex: 4,
          child: WeeklyBarContent(),
        ),
        Expanded(
          flex: 6,
          child: DayItemsList(),
        ),
        BottomPlayer(height: bottomPlayerHeight),
      ],
    );
  }
}
