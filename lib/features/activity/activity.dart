import 'package:flutter/material.dart';
import 'package:my_fave_app/models/activity_data.dart';
import 'package:my_fave_app/repositories/activity/activity_repository_impl.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'activity.g.dart';

@riverpod
class Activity extends _$Activity {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> create(
    ActivityData activity,
    VoidCallback onSuccess,
  ) async {
    final isNetWorkCheck = await isNetworkConnected();
    try {
      ref.read(overlayLoadingWidgetProvider.notifier).update((state) => true);
      await ref.read(activityRepositoryImplProvider).createActivity(activity);
      onSuccess();
    } on Exception catch (e) {
      if (!isNetWorkCheck) {
        const exception = AppException(
          message: 'Maybe your network is disconnected. Please check yours.',
        );
        throw exception;
      }
      debugPrint('推し活作成エラー: $e');
      ref
          .read(scaffoldMessengerServiceProvider)
          .showExceptionSnackBar('推し活作成に失敗しました');
    } finally {
      ref.read(overlayLoadingWidgetProvider.notifier).update((state) => false);
    }
  }
}
