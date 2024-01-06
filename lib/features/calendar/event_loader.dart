import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/models/daily_schedule.dart';
import 'package:my_fave_app/pages/home/components/calendar_daily_card.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_loader.g.dart';

final displayLatestEventsViewProvider = StateProvider((ref) => false);

@Riverpod(keepAlive: true)
class EventLoader extends _$EventLoader {
  @override
  FutureOr<Map<DateTime, List<DailySchedule>>> build() {
    return {
      DateTime.utc(2024, 1, 6): <DailySchedule>[
        DailySchedule(
          id: '1',
          title: 'live',
          location: 'Minato Tokyo',
          start: DateTime.utc(2024, 1, 6),
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

  void handleSelectedDate(
    BuildContext context,
    DateTime selectedDay,
  ) {
    if (state.value!.isEmpty) {
      return;
    }
    if (state.value!.containsKey(selectedDay)) {
      final events = state.value![selectedDay]!;
      CalendarDetailPageRoute($extra: events).push<void>(context).then(
        (value) {
          if (ref.read(displayLatestEventsViewProvider.notifier).state) {
            context.pop();
            ref.read(displayLatestEventsViewProvider.notifier).state = false;
          }
        },
      );
    } else {
      return;
    }
  }

  PersistentBottomSheetController<void> showLatestEventsView(
    BuildContext context,
    List<DailySchedule> events,
  ) {
    return showBottomSheet<void>(
      context: context,
      backgroundColor: AppColor.black15.withOpacity(0.5),
      builder: (context) {
        return ClipRect(
          child: SizedBox(
            height: 260,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 56,
                        height: 4,
                        margin: const EdgeInsets.only(top: 20, bottom: 8),
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    const Text(
                      '今後1ヶ月内の予定',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 180,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 16,
                          mainAxisExtent: 152,
                        ),
                        itemCount: 4,
                        itemBuilder: (_, index) {
                          return const CalendarDailyCard();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
