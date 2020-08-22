import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/models/weekly_tasks.dart';
import 'package:flutter_time_tracker/providers/weekly_provider.dart';
import 'package:flutter_time_tracker/themes/app_theme.dart';
import 'package:provider/provider.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<WeeklyProvider, WeeklyTasks>(
      selector: (_, provider) => provider.currentWeeklyTasks,
      builder: (_, weeklyTasks, child) {
        if (weeklyTasks == null) return Container();

        return _ProfilePhoto(
          totalWeekSeconds: weeklyTasks.totalWeekSeconds,
        );
      },
    );
  }
}

class _ProfilePhoto extends StatefulWidget {
  final int totalWeekSeconds;

  const _ProfilePhoto({
    Key key,
    @required this.totalWeekSeconds,
  }) : super(key: key);

  @override
  _ProfilePhotoState createState() => _ProfilePhotoState();
}

class _ProfilePhotoState extends State<_ProfilePhoto>
    with SingleTickerProviderStateMixin {
  final size = 48.0;
  final strokeWidth = 2.0;
  AnimationController controller;
  Tween<double> transitionTween;
  int maxWeekSeconds;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..addListener(() => setState(() {}));

    maxWeekSeconds = context.read<WeeklyProvider>().maxWeekSeconds;
    transitionTween = Tween<double>(
      begin: 0.0,
      end: widget.totalWeekSeconds / maxWeekSeconds,
    );
    controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(_ProfilePhoto oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.totalWeekSeconds != widget.totalWeekSeconds) {
      final oldPercent = oldWidget.totalWeekSeconds / maxWeekSeconds;
      final currentPercent = widget.totalWeekSeconds / maxWeekSeconds;

    transitionTween = Tween<double>(
      begin: oldPercent,
      end: currentPercent,
    );
      controller.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: WeekTasksTimePainter(
          transitionValue: transitionTween.transform(controller.value),
          cicleColor: AppTheme.barPlayColor,
          strokeWidth: strokeWidth,
        ),
        child: Container(
          padding: EdgeInsets.all(strokeWidth),
          child: ClipOval(
            child: Image.asset('images/profile_pic.jpg'),
          ),
        ),
      ),
    );
  }
}

class WeekTasksTimePainter extends CustomPainter {
  final double transitionValue;
  final Color cicleColor;
  Paint circlePaint;

  WeekTasksTimePainter({
    @required this.transitionValue,
    @required this.cicleColor,
    double strokeWidth = 2.0,
  }) : circlePaint = Paint()
          ..color = cicleColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawArc(
      Rect.fromCircle(
        center: size.center(Offset.zero),
        radius: size.width * 0.5,
      ),
      -pi / 2,
      (pi * 2) * transitionValue,
      false,
      circlePaint,
    );
  }

  @override
  bool shouldRepaint(WeekTasksTimePainter oldDelegate) =>
      oldDelegate.transitionValue != transitionValue;
}
