import 'package:flutter/material.dart';

class DayItemsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Items List'),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(24.0),
        ),
      ),
    );
  }
}
