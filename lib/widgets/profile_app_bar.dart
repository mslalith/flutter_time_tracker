import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/providers/weekly_provider.dart';
import 'package:flutter_time_tracker/themes/app_theme.dart';
import 'package:flutter_time_tracker/extensions.dart';
import 'package:flutter_time_tracker/widgets/common/circular_icon_button.dart';
import 'package:provider/provider.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeeklyProvider>(context);
    final from = provider.from;
    final to = provider.to;
    final weekIndicator = '${from.monthShort} ${from.day} — ${to.day}';
    return Container(
      padding: const EdgeInsets.only(top: 12.0),
      color: AppTheme.backgroundColor,
      child: ListTile(
        leading: Container(
          height: kToolbarHeight * 0.8,
          child: ClipOval(
            child: Image.asset('images/profile_pic.jpg'),
          ),
        ),
        title: Text(
          '14:03',
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: AppTheme.darkTextColor,
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.bold,
              ),
        ),
        subtitle: Text(
          weekIndicator,
          style: Theme.of(context).textTheme.subtitle2.copyWith(
                color: AppTheme.darkTextColor.withOpacity(0.6),
              ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
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
      ),
    );
  }
}
