import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_fave_app/models/favorite_data.dart';
import 'package:my_fave_app/repositories/favorite/favorite_repository_impl.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite.g.dart';

@Riverpod(keepAlive: true)
class Favorite extends _$Favorite {
  AppException get appException => const AppException(
        message: 'Maybe your network is disconnected. Please check yours.',
      );

  Stream<QuerySnapshot> fetch() async* {
    final isNetWorkCheck = await isNetworkConnected();
    try {
      final response =
          ref.read(favoriteRepositoryImplProvider).fetchFavoriteList();
      yield* response;
    } on Exception catch (e) {
      if (!isNetWorkCheck) {
        throw appException;
      }
      debugPrint('推し取得エラー: $e');
      ref
          .read(scaffoldMessengerServiceProvider)
          .showExceptionSnackBar('推しの取得に失敗しました');
    }
  }

  Future<List<FavoriteData>> fetchAsFuture() async {
    final isNetWorkCheck = await isNetworkConnected();
    try {
      final response =
          ref.read(favoriteRepositoryImplProvider).fetchFavoriteListAsFuture();
      return response;
    } on Exception catch (e) {
      if (!isNetWorkCheck) {
        throw appException;
      }
      debugPrint('推し取得エラー: $e');
      ref
          .read(scaffoldMessengerServiceProvider)
          .showExceptionSnackBar('推しの取得に失敗しました');
      return [];
    }
  }

  @override
  FutureOr<void> build() {
    return null;
  }

  List<FavoriteData> convertToFavoriteDataList(
    AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
  ) {
    if (snapshot.data == null) {
      return [];
    }
    final favoriteDataList = snapshot.data!.docs.map((doc) {
      final data = doc.data()! as Map<String, dynamic>;
      return FavoriteData.fromJson(data);
    }).toList();
    return favoriteDataList;
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
        throw appException;
      }
      debugPrint('推し作成エラー: $e');
      ref
          .read(scaffoldMessengerServiceProvider)
          .showExceptionSnackBar('推し作成に失敗しました');
    } finally {
      ref.read(overlayLoadingWidgetProvider.notifier).update((state) => false);
    }
  }

  Future<void> edit(FavoriteData favoriteData, VoidCallback onSuccess) async {
    final isNetWorkCheck = await isNetworkConnected();
    try {
      ref.read(overlayLoadingWidgetProvider.notifier).update((state) => true);
      await ref.read(favoriteRepositoryImplProvider).editFavorite(favoriteData);
      onSuccess();
    } on Exception catch (e) {
      if (!isNetWorkCheck) {
        throw appException;
      }
      debugPrint('推し編集エラー: $e');
      ref
          .read(scaffoldMessengerServiceProvider)
          .showExceptionSnackBar('推し編集に失敗しました');
    } finally {
      ref.read(overlayLoadingWidgetProvider.notifier).update((state) => false);
    }
  }

  Future<void> addPhoto(
    String id,
    String imageUrl,
    VoidCallback onSuccess,
  ) async {
    final isNetWorkCheck = await isNetworkConnected();
    try {
      await ref
          .read(favoriteRepositoryImplProvider)
          .addFavoritePhoto(id, imageUrl);
      onSuccess();
    } on Exception catch (e) {
      if (!isNetWorkCheck) {
        throw appException;
      }
      debugPrint('フォト追加編集エラー: $e');
      ref
          .read(scaffoldMessengerServiceProvider)
          .showExceptionSnackBar('フォト追加に失敗しました');
    }
  }

  Future<void> deletePhoto(
    String id,
    String imageUrl,
  ) async {
    final isNetWorkCheck = await isNetworkConnected();
    try {
      await ref
          .read(favoriteRepositoryImplProvider)
          .deleteFavoritePhoto(id, imageUrl);
    } on Exception catch (e) {
      if (isNetWorkCheck) {
        throw appException;
      }
      debugPrint('フォト削除エラー: $e');
      ref
          .read(scaffoldMessengerServiceProvider)
          .showExceptionSnackBar('フォト削除に失敗しました');
    }
  }
}
