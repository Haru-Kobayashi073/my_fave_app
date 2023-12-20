import 'package:flutter/foundation.dart';
import 'package:my_fave_app/repositories/authentication/auth_repository_impl.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'send_password_reset_email.g.dart';

@riverpod
Future<void> sendPasswordResetEmail(
  SendPasswordResetEmailRef ref, {
  required String email,
  required VoidCallback onSuccess,
}) async {
  final read = ref.read;
  final isNetworkCheck = await isNetworkConnected();
  try {
    read(overlayLoadingWidgetProvider.notifier).update((state) => true);
    await read(authRepositoryImplProvider).sendPasswordResetEmail(email: email);
    onSuccess();
    debugPrint('パスワードリセットのメール送信');
    read(scaffoldMessengerServiceProvider).showSuccessSnackBar('送信しました');
  } on Exception catch (e) {
    if (!isNetworkCheck) {
      const exception = AppException(
        message: 'Maybe your network is disconnected. Please check yours.',
      );
      throw exception;
    }

    if (email.isEmpty) {
      const exception = AppException(
        message: 'Please input your email.',
      );
      throw exception;
    }
    debugPrint('パスワードリセットのメール送信エラー: $e');
    read(scaffoldMessengerServiceProvider).showExceptionSnackBar('送信できませんでした');
  } finally {
    read(overlayLoadingWidgetProvider.notifier).update((state) => false);
  }
}
