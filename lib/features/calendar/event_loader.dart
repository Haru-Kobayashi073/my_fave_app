// ignore_for_file: prefer_foreach

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_fave_app/models/daily_schedule.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_loader.g.dart';

@Riverpod(keepAlive: true)
List<DailySchedule> cacheEvents(CacheEventsRef ref) {
  return [];
}

@Riverpod(keepAlive: true)
class EventLoader extends _$EventLoader {
  @override
  FutureOr<Map<DateTime, List<DailySchedule>>> build() {
    return {
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
  }

  List<DailySchedule> handleSelectedDate(
    BuildContext context,
    DateTime selectedDay,
  ) {
    if (state.value!.isEmpty) {
      return [];
    }
    if (state.value!.containsKey(selectedDay)) {
      final events = state.value![selectedDay]!;
      for (final event in events) {
        ref.read(cacheEventsProvider).add(event);
      }
      showSelectedDateEventsView(context, events);
      return events;
    } else {
      final cachEvents = ref.read(cacheEventsProvider);
      if (cachEvents.isNotEmpty) {
        context.pop();
        ref.read(cacheEventsProvider).clear();
      }
      return [];
    }
  }

  void showSelectedDateEventsView(
    BuildContext context,
    List<DailySchedule> events,
  ) {
    showBottomSheet<void>(
      context: context,
      builder: (context) {
        return Container(
          height: 300,
          color: AppColor.green,
          child: ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return ListTile(
                title: Text(event.title),
                subtitle: Text(event.location),
                onTap: () {},
              );
            },
          ),
        );
      },
    );
  }
}
