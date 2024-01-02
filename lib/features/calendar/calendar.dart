import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar.g.dart';

@riverpod
class Calendar extends _$Calendar {
  @override
  DateTime build() {
    return DateTime.now();
  }

  void selectedDate(DateTime dateTime) {
    state = dateTime;
    return;
  }
}
