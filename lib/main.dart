import 'package:flutter/material.dart';
import 'package:flutter_time_tracker/providers/weekly_provider.dart';
import 'package:flutter_time_tracker/themes/app_theme.dart';
import 'package:flutter_time_tracker/widgets/home_content.dart';
import 'package:flutter_time_tracker/widgets/common/mobile_view.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Time Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppTheme.backgroundColor,
        canvasColor: AppTheme.bottomPlayerBackgroundColor,
        fontFamily: 'Poppins',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (_) => WeeklyProvider(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileView(
      child: Scaffold(
        body: HomeContent(),
      ),
    );
  }
}