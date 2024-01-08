// ignore_for_file: lines_longer_than_80_chars

extension DateTimeExtension on DateTime {
  int get getDaysInCurrentMonth {
    return DateTime(year, month, 0).day;
  }

  int get getDaysInNextMonth {
    final nextMonth = DateTime(year, month + 1);
    return DateTime(nextMonth.year, nextMonth.month, 0).day;
  }

  String toHourMinute() {
    return "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
  }

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
