import 'package:flutter/material.dart' show required;
import 'package:flutter_time_tracker/extensions.dart';

class Task {
  final int id;
  final String title;
  final String from;
  final String audioPath;
  final DateTime date;

  const Task({
    @required this.id,
    @required this.title,
    @required this.from,
    @required this.audioPath,
    @required this.date,
  });

  static List<Task> weeklyData(DateTime from, DateTime to) {
    assert(from.day <= to.day, 'from can\'t be greater than to');
    assert(to.day - from.day == 6, 'from and to should have a week difference');
    return _dummyTasks
        .where((task) => task.date.isInBetween(from, to))
        .toList();
  }

  static final List<Task> _dummyTasks = <Task>[
    Task(
      id: 1,
      title: 'Minor changes',
      from: 'Traveller',
      audioPath: 'audios/1.mp3',
      date: DateTime(2020, 4, 19),
    ),
    Task(
      id: 2,
      title: 'Icons',
      from: 'Library',
      audioPath: 'audios/2.mp3',
      date: DateTime(2020, 4, 19),
    ),
    Task(
      id: 3,
      title: 'Update profile statistics',
      from: 'Traveller',
      audioPath: 'audios/3.mp3',
      date: DateTime(2020, 4, 19),
    ),
    Task(
      id: 4,
      title: 'Prepare & schedule shots',
      from: 'Dribbble',
      audioPath: 'audios/4.mp3',
      date: DateTime(2020, 4, 19),
    ),
    Task(
      id: 5,
      title: 'New pastel colors',
      from: 'Library',
      audioPath: 'audios/5.mp3',
      date: DateTime(2020, 4, 9),
    ),
    Task(
      id: 6,
      title: 'New gradients',
      from: 'Library',
      audioPath: 'audios/6.mp3',
      date: DateTime(2020, 4, 9),
    ),
    Task(
      id: 7,
      title: 'Updated colors',
      from: 'Personal Portfolio',
      audioPath: 'audios/7.mp3',
      date: DateTime(2020, 4, 9),
    ),
    Task(
      id: 8,
      title: 'Prototype fixes',
      from: 'Better Weather',
      audioPath: 'audios/8.mp3',
      date: DateTime(2020, 4, 9),
    ),
    Task(
      id: 9,
      title: 'Onboarding screens',
      from: 'Better Weather',
      audioPath: 'audios/9.mp3',
      date: DateTime(2020, 4, 9),
    ),
    Task(
      id: 10,
      title: 'Shots preparation',
      from: 'Dribbble',
      audioPath: 'audios/10.mp3',
      date: DateTime(2020, 4, 9),
    ),
    Task(
      id: 11,
      title: 'Shots description',
      from: 'Dribbble',
      audioPath: 'audios/11.mp3',
      date: DateTime(2020, 4, 9),
    ),
    Task(
      id: 12,
      title: 'Prepare & schedule shots',
      from: 'Dribbble',
      audioPath: 'audios/12.mp3',
      date: DateTime(2020, 4, 9),
    ),
    Task(
      id: 13,
      title: 'Feed changes',
      from: 'Traveller',
      audioPath: 'audios/13.mp3',
      date: DateTime(2020, 4, 9),
    ),
    Task(
      id: 14,
      title: 'Update profile statistics',
      from: 'Traveller',
      audioPath: 'audios/3.mp3',
      date: DateTime(2020, 4, 18),
    ),
    Task(
      id: 15,
      title: 'Prepare & schedule shots',
      from: 'Dribbble',
      audioPath: 'audios/4.mp3',
      date: DateTime(2020, 4, 18),
    ),
    Task(
      id: 16,
      title: 'New pastel colors',
      from: 'Library',
      audioPath: 'audios/5.mp3',
      date: DateTime(2020, 4, 18),
    ),
    Task(
      id: 17,
      title: 'New gradients',
      from: 'Library',
      audioPath: 'audios/6.mp3',
      date: DateTime(2020, 4, 18),
    ),
    Task(
      id: 18,
      title: 'Updated colors',
      from: 'Personal Portfolio',
      audioPath: 'audios/7.mp3',
      date: DateTime(2020, 4, 18),
    ),
    Task(
      id: 19,
      title: 'Prototype fixes',
      from: 'Better Weather',
      audioPath: 'audios/8.mp3',
      date: DateTime(2020, 4, 18),
    ),
    Task(
      id: 20,
      title: 'Feed changes',
      from: 'Traveller',
      audioPath: 'audios/13.mp3',
      date: DateTime(2020, 4, 18),
    ),
    Task(
      id: 21,
      title: 'Icons',
      from: 'Library',
      audioPath: 'audios/2.mp3',
      date: DateTime(2020, 4, 17),
    ),
    Task(
      id: 22,
      title: 'Update profile statistics',
      from: 'Traveller',
      audioPath: 'audios/3.mp3',
      date: DateTime(2020, 4, 17),
    ),
    Task(
      id: 23,
      title: 'Prepare & schedule shots',
      from: 'Dribbble',
      audioPath: 'audios/4.mp3',
      date: DateTime(2020, 4, 17),
    ),
    Task(
      id: 24,
      title: 'Feed changes',
      from: 'Traveller',
      audioPath: 'audios/13.mp3',
      date: DateTime(2020, 4, 17),
    ),
    Task(
      id: 25,
      title: 'Prepare & schedule shots',
      from: 'Dribbble',
      audioPath: 'audios/4.mp3',
      date: DateTime(2020, 4, 16),
    ),
    Task(
      id: 26,
      title: 'New pastel colors',
      from: 'Library',
      audioPath: 'audios/5.mp3',
      date: DateTime(2020, 4, 16),
    ),
    Task(
      id: 27,
      title: 'New gradients',
      from: 'Library',
      audioPath: 'audios/6.mp3',
      date: DateTime(2020, 4, 16),
    ),
    Task(
      id: 28,
      title: 'Updated colors',
      from: 'Personal Portfolio',
      audioPath: 'audios/7.mp3',
      date: DateTime(2020, 4, 16),
    ),
    Task(
      id: 29,
      title: 'Prototype fixes',
      from: 'Better Weather',
      audioPath: 'audios/8.mp3',
      date: DateTime(2020, 4, 16),
    ),
    Task(
      id: 30,
      title: 'Feed changes',
      from: 'Traveller',
      audioPath: 'audios/13.mp3',
      date: DateTime(2020, 4, 16),
    ),
    Task(
      id: 31,
      title: 'Minor changes',
      from: 'Traveller',
      audioPath: 'audios/1.mp3',
      date: DateTime(2020, 4, 15),
    ),
    Task(
      id: 32,
      title: 'Icons',
      from: 'Library',
      audioPath: 'audios/2.mp3',
      date: DateTime(2020, 4, 15),
    ),
    Task(
      id: 33,
      title: 'Update profile statistics',
      from: 'Traveller',
      audioPath: 'audios/3.mp3',
      date: DateTime(2020, 4, 15),
    ),
    Task(
      id: 34,
      title: 'Prepare & schedule shots',
      from: 'Dribbble',
      audioPath: 'audios/4.mp3',
      date: DateTime(2020, 4, 15),
    ),
    Task(
      id: 35,
      title: 'New pastel colors',
      from: 'Library',
      audioPath: 'audios/5.mp3',
      date: DateTime(2020, 4, 15),
    ),
    Task(
      id: 36,
      title: 'New gradients',
      from: 'Library',
      audioPath: 'audios/6.mp3',
      date: DateTime(2020, 4, 15),
    ),
    Task(
      id: 37,
      title: 'Feed changes',
      from: 'Traveller',
      audioPath: 'audios/13.mp3',
      date: DateTime(2020, 4, 11),
    ),
    Task(
      id: 38,
      title: 'Shots preparation',
      from: 'Dribbble',
      audioPath: 'audios/10.mp3',
      date: DateTime(2020, 4, 12),
    ),
    Task(
      id: 39,
      title: 'Shots description',
      from: 'Dribbble',
      audioPath: 'audios/11.mp3',
      date: DateTime(2020, 4, 12),
    ),
    Task(
      id: 40,
      title: 'Prepare & schedule shots',
      from: 'Dribbble',
      audioPath: 'audios/12.mp3',
      date: DateTime(2020, 4, 12),
    ),
  ];
}
