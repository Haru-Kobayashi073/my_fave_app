import 'package:flutter/material.dart';
import 'package:my_fave_app/models/daily_schedule.dart';
import 'package:my_fave_app/repositories/calendar/calendar_repository_impl.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'schedule.g.dart';

@riverpod
class Schedule extends _$Schedule {
  Future<bool> get isNetWorkCheck async => isNetworkConnected();

  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> create(
    DailySchedule schedule,
    VoidCallback onSuccess,
  ) async {
    try {
      ref.read(overlayLoadingWidgetProvider.notifier).update((state) => true);
      await ref.read(calendarRepositoryImplProvider).createSchedule(schedule);
      onSuccess();
    } on Exception catch (e) {
      if (!await isNetWorkCheck) {
        const exception = AppException(
          message: 'Maybe your network is disconnected. Please check yours.',
        );
        throw exception;
      }
      debugPrint('スケジュール作成エラー: $e');
      ref
          .read(scaffoldMessengerServiceProvider)
          .showExceptionSnackBar('スケジュール作成に失敗しました');
    } finally {
      ref.read(overlayLoadingWidgetProvider.notifier).update((state) => false);
    }
  }
}
