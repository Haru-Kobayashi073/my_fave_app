import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/calendar/calendar.dart';
import 'package:my_fave_app/models/daily_schedule.dart';
import 'package:my_fave_app/widgets/widget.dart';
import 'package:table_calendar/table_calendar.dart';

final sampleMap = {
  DateTime.utc(2024, 1, 3): <DailySchedule>[
    DailySchedule(
      id: '1',
      title: 'live',
      location: 'Minato Tokyo',
      start: DateTime.utc(2024, 1, 3),
    ),
  ],
  DateTime.utc(2024, 1, 4): <DailySchedule>[
    DailySchedule(
      id: '2',
      title: 'CD release',
      location: 'Sibuya Tokyo',
      start: DateTime.utc(2024, 1, 4),
    ),
    DailySchedule(
      id: '3',
      title: 'fan meeting',
      location: 'Harajuku Tokyo',
      start: DateTime.utc(2024, 1, 4),
    ),
  ],
};

class CalendarPage extends HookConsumerWidget {
  const CalendarPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(calendarProvider);

    return Scaffold(
      appBar: CommonAppBar(
        icon: IconButton(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.circleQuestion),
        ),
      ),
      body: TableCalendar<DailySchedule>(
        focusedDay: selectedDay,
        firstDay: DateTime(DateTime.now().year - 30),
        lastDay: DateTime(DateTime.now().year + 5),
        selectedDayPredicate: (day) {
          return isSameDay(selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          ref.read(calendarProvider.notifier).selectedDate(selectedDay);
        },
        eventLoader: (date) {
          return sampleMap[date] ?? [];
        },
        shouldFillViewport: true,
      ),
    );
  }
}
