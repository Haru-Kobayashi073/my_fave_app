import 'package:flutter/material.dart';
import 'package:my_fave_app/repositories/favorite_leveling/favorite_leveling_repository_impl.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_leveling.g.dart';

@riverpod
class FavoriteLeveling extends _$FavoriteLeveling {
  AppException get appException => const AppException(
        message: 'Maybe your network is disconnected. Please check yours.',
      );

  @override
  void build() {
    return;
  }

  /// 全推しのレベルを取得する
  Future<List<int?>> fetchFavoriteLevelList() async {
    final isNetWorkCheck = await isNetworkConnected();
    try {
      final response = ref
          .read(favoriteLevelingRepositoryImplProvider)
          .fetchFavoriteLevelList();
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

  /// 全推しの中で最も高いレベルを返す
  Future<int?> getHighestLevel() async {
    final favoriteLevelList = await fetchFavoriteLevelList();

    if (favoriteLevelList.isEmpty) {
      return null;
    }
    // 初期値としてリストの最初の要素を設定し、それと比較して最大値を求める
    final highestValue = favoriteLevelList.reduce(
      (currentMax, number) => currentMax! > number! ? currentMax : number,
    );
    return highestValue;
  }

  /// レベルを計算する
  int calculateLevel(int? likingLevel) {
    if (likingLevel == null) {
      return 0;
    }
    final levelStage = LevelStage.values.lastWhere(
      (element) => element.point <= likingLevel,
    );
    return levelStage.level;
  }

  Future<void> increaseFavoriteLevel(
    String favoriteId,
    LevelAlgorithm levelAlgorithm,
  ) async {
    final isNetWorkCheck = await isNetworkConnected();
    try {
      await ref
          .read(favoriteLevelingRepositoryImplProvider)
          .increaseFavoriteLevel(favoriteId, levelAlgorithm);
    } on Exception catch (e) {
      if (!isNetWorkCheck) {
        throw appException;
      }
      debugPrint('推しレベルアップエラー: $e');
      ref
          .read(scaffoldMessengerServiceProvider)
          .showExceptionSnackBar('推しのレベルアップに失敗しました');
    }
  }
}
