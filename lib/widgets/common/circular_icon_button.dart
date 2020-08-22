import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/themes/app_theme.dart';

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final VoidCallback onPressed;
  final EdgeInsets padding;

  const CircularIconButton({
    Key key,
    @required this.icon,
    @required this.onPressed,
    this.iconColor = Colors.black,
    this.iconSize = 24.0,
    this.padding = const EdgeInsets.all(8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          splashColor: AppTheme.barPlayColor.withOpacity(0.3),
          hoverColor: AppTheme.barPlayColor.withOpacity(0.1),
          child: Container(
            padding: padding,
            child: Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
