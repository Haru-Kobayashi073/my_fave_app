import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:my_fave_app/features/calendar/calendar.dart';
import 'package:my_fave_app/features/calendar/event_loader.dart';
import 'package:my_fave_app/models/daily_schedule.dart';
import 'package:my_fave_app/pages/calendar/components/calendar_components.dart';

import 'package:my_fave_app/utils/constants/app_color.dart';
import 'package:my_fave_app/widgets/widget.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends HookConsumerWidget {
  const CalendarPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(calendarProvider);
    final calendarNotifier = ref.watch(calendarProvider.notifier);
    final eventLoader = ref.watch(eventLoaderProvider);
    final eventLoaderNotifer = ref.watch(eventLoaderProvider.notifier);

    return Scaffold(
      appBar: CommonAppBar(
        icon: IconButton(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.circleQuestion),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: eventLoader.when(
          data: (events) {
            return TableCalendar<DailySchedule>(
              focusedDay: selectedDay,
              firstDay: DateTime(DateTime.now().year - 30),
              lastDay: DateTime(DateTime.now().year + 5),
              selectedDayPredicate: (day) {
                return isSameDay(selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                ref.read(calendarProvider.notifier).selectedDate(selectedDay);
                ref
                    .read(eventLoaderProvider.notifier)
                    .handleSelectedDate(context, selectedDay);
              },
              eventLoader: (date) {
                final localTime = date.toLocal();
                return events[localTime] ?? [];
              },
              onPageChanged: (focusedDay) {
                if (focusedDay != selectedDay) {
                  focusedDay.isBefore(selectedDay)
                      ? calendarNotifier.switchToPreviousMonth()
                      : calendarNotifier.switchToNextMonth();
                  ref.invalidate(eventLoaderProvider);
                }
              },
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                leftChevronVisible: false,
                rightChevronVisible: false,
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                ),
                weekendStyle: TextStyle(
                  color: AppColor.grey88,
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                ),
              ),
              rowHeight: 72,
              calendarBuilders: CalendarBuilders(
                headerTitleBuilder: (_, date) {
                  final text = const HeaderStyle()
                          .titleTextFormatter
                          ?.call(date, 'en') ??
                      DateFormat.yMMMM('en').format(date);
                  return CalendarHeader(
                    yearMonthText: text,
                    events: eventLoaderNotifer.extractAllValues(events),
                  );
                },
                todayBuilder: (_, date, focusedDay) {
                  return Center(
                    child: CircleAvatar(
                      backgroundColor: AppColor.white,
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(
                          color: AppColor.black00,
                        ),
                      ),
                    ),
                  );
                },
                selectedBuilder: (_, date, focusedDay) {
                  return Center(
                    child: isSameDay(DateTime.now(), date)
                        ? CircleAvatar(
                            backgroundColor: AppColor.white,
                            child: Text(
                              date.day.toString(),
                              style: TextStyle(
                                color: AppColor.black00,
                              ),
                            ),
                          )
                        : Text(
                            date.day.toString(),
                          ),
                  );
                },
                markerBuilder: (_, date, events) {
                  return events.isNotEmpty
                      ? Container(
                          width: 6,
                          height: 6,
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            shape: BoxShape.circle,
                          ),
                        )
                      : const SizedBox();
                },
              ),
            );
          },
          error: (e, s) => const SizedBox(),
          loading: () => const SizedBox(),
        ),
      ),
    );
  }
}
