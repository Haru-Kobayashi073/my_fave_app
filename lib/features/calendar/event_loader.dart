import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/models/daily_schedule.dart';
import 'package:my_fave_app/pages/home/components/calendar_daily_card.dart';
import 'package:my_fave_app/repositories/calendar/calendar_repository_impl.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_loader.g.dart';

final displayLatestEventsViewProvider = StateProvider((ref) => false);

@Riverpod(keepAlive: true)
class EventLoader extends _$EventLoader {
  Future<Map<DateTime, List<DailySchedule>>> fetch() async {
    final isNetWorkCheck = await isNetworkConnected();
    try {
      final response =
          await ref.read(calendarRepositoryImplProvider).fetchScheduleList();
      final converttedMap = convertToKeyValue(response);
      return converttedMap;
    } on Exception catch (e) {
      if (!isNetWorkCheck) {
        const exception = AppException(
          message: 'Maybe your network is disconnected. Please check yours.',
        );
        throw exception;
      }
      debugPrint('スケジュール取得エラー: $e');
      ref
          .read(scaffoldMessengerServiceProvider)
          .showExceptionSnackBar('スケジュールの取得に失敗しました');
      return {};
    }
  }

  Map<DateTime, List<DailySchedule>> convertToKeyValue(
    List<DailySchedule> list,
  ) {
    if (list.isEmpty) {
      return {};
    }

    final map = <DateTime, List<DailySchedule>>{};

    for (final schedule in list) {
      final startDate = DateTime(
        schedule.start.year,
        schedule.start.month,
        schedule.start.day,
        9,
      );
      final endDate = DateTime(
        schedule.end!.year,
        schedule.end!.month,
        schedule.end!.day,
        9,
      );

      var currentDate = startDate;

      while (currentDate.isBefore(endDate) ||
          currentDate.isAtSameMomentAs(endDate)) {
        if (!map.containsKey(currentDate)) {
          map[currentDate] = [];
        }
        map[currentDate]!.add(schedule);

        currentDate = currentDate.add(const Duration(days: 1));
      }
    }

    return map;
  }

  List<DailySchedule> getScheduleForNext31Days(
    Map<DateTime, List<DailySchedule>> schedules,
  ) {
    final result = <DailySchedule>[];

    // 今日の日付を取得
    final today = DateTime.now();

    // 31日分の予定を取得
    for (var i = 0; i < 31; i++) {
      final currentDate = DateTime(
        today.year,
        today.month,
        today.day + i,
        9,
      );

      // currentDate に該当する予定があれば、それを result に追加
      if (schedules.containsKey(currentDate)) {
        result.addAll(schedules[currentDate]!);
      }
    }
    result.sort((a, b) => a.start.compareTo(b.start));
    return result;
  }

  @override
  FutureOr<Map<DateTime, List<DailySchedule>>> build() async {
    return await fetch();
  }

  void handleSelectedDate(
    BuildContext context,
    DateTime selectedDay,
  ) {
    final formattedDate = DateTime(
      selectedDay.year,
      selectedDay.month,
      selectedDay.day,
      9,
    );
    if (state.value!.isEmpty) {
      return;
    }
    if (state.value!.containsKey(formattedDate)) {
      final events = state.value!;
      CalendarDetailPageRoute(
        $extra: events,
        selectedDate: selectedDay,
      ).push<void>(context).then(
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
    Map<DateTime, List<DailySchedule>> events,
  ) {
    final list = getScheduleForNext31Days(events);
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
                        itemCount: list.length,
                        itemBuilder: (_, index) {
                          return CalendarDailyCard(schedule: list[index]);
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
