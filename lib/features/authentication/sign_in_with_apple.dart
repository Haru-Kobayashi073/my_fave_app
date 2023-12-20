import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_fave_app/repositories/authentication/auth_repository_impl.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_with_apple.g.dart';

@riverpod
Future<void> signInWithApple(
  SignInWithAppleRef ref,
  VoidCallback onSuccess,
) async {
  final read = ref.read;
  final isNetworkCheck = await isNetworkConnected();
  try {
    read(overlayLoadingWidgetProvider.notifier).update((state) => true);
    await read(authRepositoryImplProvider).signInWithApple();
    onSuccess();
    debugPrint('ログインしました');
    read(scaffoldMessengerServiceProvider).showSuccessSnackBar('ログインしました');
  } on FirebaseAuthException catch (e) {
    if (!isNetworkCheck) {
      const exception = AppException(
        message: 'Maybe your network is disconnected. Please check yours.',
      );
      throw exception;
    }

    debugPrint('ログインエラー: $e');
    read(scaffoldMessengerServiceProvider).showExceptionSnackBar(e.toJapanese);
  } finally {
    read(overlayLoadingWidgetProvider.notifier).update((state) => false);
  }
}
