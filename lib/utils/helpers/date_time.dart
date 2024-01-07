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
