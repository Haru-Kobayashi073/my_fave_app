import 'package:flutter/material.dart';
import 'package:my_fave_app/models/favorite_data.dart';
import 'package:my_fave_app/repositories/favorite/favorite_repository_impl.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite.g.dart';

@riverpod
class Favorite extends _$Favorite {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> create(
    FavoriteData favoriteData,
    VoidCallback onSuccess,
  ) async {
    final isNetWorkCheck = await isNetworkConnected();
    try {
      ref.read(overlayLoadingWidgetProvider.notifier).update((state) => true);
      await ref
          .read(favoriteRepositoryImplProvider)
          .createFavorite(favoriteData);
      onSuccess();
    } on Exception catch (e) {
      if (!isNetWorkCheck) {
        const exception = AppException(
          message: 'Maybe your network is disconnected. Please check yours.',
        );
        throw exception;
      }
      debugPrint('推し作成エラー: $e');
      ref
          .read(scaffoldMessengerServiceProvider)
          .showExceptionSnackBar('推し作成に失敗しました');
    } finally {
      ref.read(overlayLoadingWidgetProvider.notifier).update((state) => false);
    }
  }
}
