import 'package:flutter/material.dart';
import 'package:my_fave_app/models/marker_data.dart';
import 'package:my_fave_app/repositories/map/map_repository_impl.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map.g.dart';

@riverpod
class Map extends _$Map {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> create(
    MarkerData markerData,
    VoidCallback onSuccess,
  ) async {
    final isNetWorkCheck = await isNetworkConnected();
    try {
      ref.read(overlayLoadingWidgetProvider.notifier).update((state) => true);
      await ref.read(mapRepositoryImplProvider).createMarker(markerData);
      onSuccess();
    } on Exception catch (e) {
      if (!isNetWorkCheck) {
        const exception = AppException(
          message: 'Maybe your network is disconnected. Please check yours.',
        );
        throw exception;
      }
      debugPrint('マーカー作成エラー: $e');
      ref
          .read(scaffoldMessengerServiceProvider)
          .showExceptionSnackBar('マーカー作成に失敗しました');
    } finally {
      ref.read(overlayLoadingWidgetProvider.notifier).update((state) => false);
    }
  }
}
