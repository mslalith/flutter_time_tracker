extension DateTimeX on DateTime {
  bool isInBetween(DateTime from, DateTime to) {
    return (isAtSameMomentAs(from) || isAfter(from)) &&
        (isAtSameMomentAs(to) || isBefore(to));
  }

  bool isEqualTo(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  DateTime nextWeek({bool inclusive = true}) =>
      add(Duration(days: inclusive ? 6 : 7));

  String get weekdayShort {
    switch (weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thur';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  String get monthShort {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }
}
