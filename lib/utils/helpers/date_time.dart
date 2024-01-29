import 'package:intl/intl.dart';

int calculateDaysSince(DateTime pastDate) {
  final currentDate = DateTime.now();
  final difference = currentDate.difference(pastDate);
  return difference.inDays;
}

(String, String) formatDateTime(DateTime dateTime) {
  final formattedDate = DateFormat('yyyy/MM/dd').format(dateTime);
  final formattedTime = DateFormat('HH:mm').format(dateTime);
  final weekDay = DateFormat.E('ja').format(dateTime);
  return ('$formattedDate($weekDay)', formattedTime);
}

(DateTime, DateTime) formatDateTimeForAllDay(DateTime start, DateTime end) {
  final formattedStart = DateTime(start.year, start.month, start.day);
  final formattedEnd = DateTime(end.year, end.month, end.day);
  return (formattedStart, formattedEnd);
}

String formatDateTimeForWeekDay(DateTime dateTime) {
  final formattedDate =
      '${dateTime.year}/${dateTime.month}/${dateTime.day} ${'${'日月火水木金土日'[dateTime.weekday]}曜日'}';
  return formattedDate;
}

String formatDateTimeForBracesWeekDay(DateTime dateTime) {
  final formattedDate = '${dateTime.month}/${dateTime.day} (${'日月火水木金土日'[dateTime.weekday]})';
  return formattedDate;
}
