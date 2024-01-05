int calculateDaysSince(DateTime pastDate) {
  final currentDate = DateTime.now();
  final difference = currentDate.difference(pastDate);
  return difference.inDays;
}
