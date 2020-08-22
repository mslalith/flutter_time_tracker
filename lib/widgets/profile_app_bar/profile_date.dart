import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/providers/weekly_provider.dart';
import 'package:flutter_time_tracker/themes/app_theme.dart';
import 'package:flutter_time_tracker/widgets/common/slide_text.dart';
import 'package:provider/provider.dart';

class ProfileDate extends StatelessWidget {
  const ProfileDate({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<WeeklyProvider, String>(
      selector: (_, provider) => provider.dateHeaderText,
      builder: (_, dateText, child) {
        return SlideText<String>(
          data: dateText,
          builder: (String date) {
            return Text(
              date,
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                    color: AppTheme.darkTextColor.withOpacity(0.6),
                  ),
            );
          },
        );
      },
    );
  }
}
