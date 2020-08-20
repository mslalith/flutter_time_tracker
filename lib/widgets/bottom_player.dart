import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/themes/app_theme.dart';

class BottomPlayer extends StatelessWidget {
  final double height;

  const BottomPlayer({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: AppTheme.bottomPlayerBackgroundColor,
      alignment: Alignment.center,
      child: ListTile(
        leading: CircleAvatar(
          radius: 24.0,
          backgroundColor: AppTheme.barPlayColor,
          child: Icon(Icons.play_arrow),
        ),
        title: Text(
            '2:01:37',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
        color: AppTheme.lightTextColor.withOpacity(0.7),
        fontFamily: 'RobotoMono',
                ),
          ),
        subtitle: Text(
          'Update profile statistics',
          style: Theme.of(context).textTheme.button.copyWith(
                color: AppTheme.lightTextColor,
              ),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.more_horiz,
            color: AppTheme.lightTextColor.withOpacity(0.5),
          ),
          onPressed: () {},
        ),
      ),
      // child: Row(
      //   children: [
      //     CircleAvatar(
      //       backgroundColor: AppTheme.barPlayColor,
      //       child: Icon(Icons.play_arrow),
      //     ),
      //   ],
      // ),
    );
  }
}
