import 'package:my_fave_app/utils/utils.dart';
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

  void switchToPreviousMonth() => state = state.subtract(
        Duration(
          days: state.getDaysInCurrentMonth,
        ),
      );

  void switchToNextMonth() => state = state.add(
        Duration(
          days: state.getDaysInNextMonth,
        ),
      );
}
