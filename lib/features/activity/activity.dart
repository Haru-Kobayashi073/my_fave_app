import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_fave_app/models/activity_data.dart';
import 'package:my_fave_app/repositories/activity/activity_repository_impl.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'activity.g.dart';

@riverpod
class Activity extends _$Activity {
  Stream<QuerySnapshot> fetchActivities() async* {
    final isNetWorkCheck = await isNetworkConnected();
    try {
      final response =
          ref.read(activityRepositoryImplProvider).fetchActivities();
      yield* response;
    } on Exception catch (e) {
      if (!isNetWorkCheck) {
        const exception = AppException(
          message: 'Maybe your network is disconnected. Please check yours.',
        );
        throw exception;
      }
      debugPrint('推し活の取得エラー: $e');
      ref
          .read(scaffoldMessengerServiceProvider)
          .showExceptionSnackBar('推し活の取得に失敗しました');
    }
  }

  @override
  void build() {
    return;
  }

  Map<DateTime, List<ActivityData>> generateActivityMap(
    AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
  ) {
    final scheduleMap = <DateTime, List<ActivityData>>{};
    final activityDataList = snapshot.data!.docs
        .map(
          (doc) => ActivityData.fromJson(doc.data()! as Map<String, dynamic>),
        )
        .toList();

    for (final activityData in activityDataList) {
      // DateTimeを取得
      final date = DateTime(
        activityData.createdAt!.year,
        activityData.createdAt!.month,
        activityData.createdAt!.day,
        9,
      );

      if (!scheduleMap.containsKey(date)) {
        scheduleMap[date] = [];
      }
      scheduleMap[date]!.add(activityData);
    }

    return scheduleMap;
  }

  List<ActivityData> generateLikedActivityList(
    AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
  ) {
    final activityDataList = snapshot.data!.docs
        .map(
          (doc) => ActivityData.fromJson(doc.data()! as Map<String, dynamic>),
        )
        .toList();

    final likedActivityList = activityDataList
        .where(
          (activityData) => activityData.isLiked,
        )
        .toList();

    return likedActivityList;
  }

  List<ActivityData> generateTodayActivityList(
    AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
  ) {
    final today = DateTime.now();
    final todayActivityList = <ActivityData>[];
    final activityDataList = snapshot.data!.docs
        .map(
          (doc) => ActivityData.fromJson(doc.data()! as Map<String, dynamic>),
        )
        .toList();

    for (final activityData in activityDataList) {
      if (activityData.createdAt!.year == today.year &&
          activityData.createdAt!.month == today.month &&
          activityData.createdAt!.day == today.day) {
        todayActivityList.add(activityData);
      }
    }

    return todayActivityList;
  }

  /// 過去2週間分の推し活を取得
  List<ActivityData> generateTwoWeeksActivityList(
    AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
  ) {
    final twoWeeksActivityList = <ActivityData>[];
    final activityDataList = snapshot.data!.docs
        .map(
          (doc) => ActivityData.fromJson(doc.data()! as Map<String, dynamic>),
        )
        .toList();

    final today = DateTime.now();
    final twoWeeksAgo = today.subtract(const Duration(days: 14));

    for (final activityData in activityDataList) {
      if (activityData.createdAt!.isAfter(twoWeeksAgo) ||
          activityData.createdAt!.isAtSameMomentAs(today)) {
        twoWeeksActivityList.add(activityData);
      }
    }

    return twoWeeksActivityList;
  }

  /// 選択された日付の推し活を取得
  List<ActivityData> generateSelectedDayActivityList(
    List<ActivityData> list,
    DateTime selectedDay,
  ) {
    final selectedDayActivityList = <ActivityData>[];

    for (final activityData in list) {
      if (activityData.createdAt!.year == selectedDay.year &&
          activityData.createdAt!.month == selectedDay.month &&
          activityData.createdAt!.day == selectedDay.day) {
        selectedDayActivityList.add(activityData);
      }
    }

    return selectedDayActivityList;
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

  Future<void> favorite({
    required String activityId,
    required bool isLiked,
  }) async {
    final isNetWorkCheck = await isNetworkConnected();
    try {
      await ref
          .read(activityRepositoryImplProvider)
          .favoriteActivity(activityId: activityId, isLiked: isLiked);
    } on Exception catch (e) {
      if (!isNetWorkCheck) {
        const exception = AppException(
          message: 'Maybe your network is disconnected. Please check yours.',
        );
        throw exception;
      }
      debugPrint('推し活のお気に入りエラー: $e');
      ref
          .read(scaffoldMessengerServiceProvider)
          .showExceptionSnackBar('推し活のお気に入りに失敗しました');
    }
  }
}
