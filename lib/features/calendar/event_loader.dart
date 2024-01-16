import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
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
  Stream<QuerySnapshot> fetch() async* {
    final isNetWorkCheck = await isNetworkConnected();
    try {
      final response =
          ref.read(calendarRepositoryImplProvider).fetchScheduleList();
      yield* response;
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
    }
  }

  Stream<QuerySnapshot> fetchList() async* {
    final isNetWorkCheck = await isNetworkConnected();
    try {
      final response =
          ref.read(calendarRepositoryImplProvider).fetchScheduleList();
      yield* response;
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
    }
  }

  Map<DateTime, List<DailySchedule>> convertToKeyValue(
    AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
  ) {
    if (snapshot.data == null) {
      return {};
    }

    final list = snapshot.data!.docs
        .map(
          (doc) => DailySchedule.fromJson(doc.data()! as Map<String, dynamic>),
        )
        .toList();

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

  List<DailySchedule> generateMonthlyScheduleList(
    List<DailySchedule> scheduleList,
  ) {
    final futureOneMonthSchedules = <DailySchedule>[];
    final today = DateTime.now();
    final oneMonthLater = today.add(const Duration(days: 30));

    for (final dailySchedule in scheduleList) {
      if (dailySchedule.start.isAfter(today) &&
          dailySchedule.start.isBefore(oneMonthLater)) {
        futureOneMonthSchedules.add(dailySchedule);
      }
    }

    return futureOneMonthSchedules;
  }

  @override
  FutureOr<void> build() {
    return null;
  }

  List<DailySchedule> extractAllValues(
    Map<DateTime, List<DailySchedule>> inputMap,
  ) {
    // 新しいリストを作成
    final allValues = <DailySchedule>[];

    // マップ内の各エントリに対してループ
    inputMap.forEach((key, value) {
      // マップの値（List<dynamic>）をすべてリストに追加
      allValues.addAll(value);
    });

    // 結果を返す
    return allValues;
  }

  void handleSelectedDate(
    BuildContext context,
    DateTime selectedDay,
    Map<DateTime, List<DailySchedule>> detaMap,
  ) {
    final formattedDate = DateTime(
      selectedDay.year,
      selectedDay.month,
      selectedDay.day,
      9,
    );
    if (detaMap.isEmpty) {
      return;
    }
    if (detaMap.containsKey(formattedDate)) {
      final events = extractAllValues(detaMap);
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
    List<DailySchedule> events,
  ) {
    final list = generateMonthlyScheduleList(events);
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
