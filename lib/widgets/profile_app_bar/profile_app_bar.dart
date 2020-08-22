import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/themes/app_theme.dart';
import 'package:flutter_time_tracker/widgets/common/circular_icon_button.dart';
import 'package:flutter_time_tracker/widgets/profile_app_bar/profile_date.dart';
import 'package:flutter_time_tracker/widgets/profile_app_bar/profile_photo.dart';
import 'package:flutter_time_tracker/widgets/profile_app_bar/profile_time.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 24.0,
        bottom: 12.0,
        left: 16.0,
        right: 16.0,
      ),
      color: AppTheme.backgroundColor,
      child: Row(
        children: [
          const ProfilePhoto(),
          const SizedBox(width: 12.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileTime(),
              const ProfileDate(),
            ],
          ),
          Spacer(),
          CircularIconButton(
            icon: Icons.sort,
            iconColor: AppTheme.barPlayColor,
            onPressed: () {},
          ),
          CircularIconButton(
            icon: Icons.add,
            iconColor: AppTheme.barPlayColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
