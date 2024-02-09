import 'package:flutter/material.dart';
import 'package:my_fave_app/repositories/user/user_repository_impl.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_user.g.dart';

@riverpod
Future<void> createUser(
  CreateUserRef ref, {
  String? userName,
  required VoidCallback onSuccess,
}) async {
  final read = ref.read;
  final isNetworkCheck = await isNetworkConnected();
  try {
    read(overlayLoadingWidgetProvider.notifier).update((state) => true);
    await read(userRepositoryImplProvider).createUser(userName: userName);
    onSuccess();
    debugPrint('ユーザーを作成しました');
  } on Exception catch (e) {
    if (!isNetworkCheck) {
      const exception = AppException(
        message: 'Maybe your network is disconnected. Please check yours.',
      );
      throw exception;
    }

    debugPrint('ユーザー作成エラー: $e');
    read(scaffoldMessengerServiceProvider)
        .showExceptionSnackBar('ユーザー作成に失敗しました');
  } finally {
    read(overlayLoadingWidgetProvider.notifier).update((state) => false);
  }
}
