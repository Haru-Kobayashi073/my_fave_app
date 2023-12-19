import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_fave_app/repositories/authentication/auth_repository_impl.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up.g.dart';

@riverpod
Future<void> signUp(
  SignUpRef ref,
  String email,
  String password,
  VoidCallback onSuccess,
) async {
  final read = ref.read;
  final isNetworkCheck = await isNetworkConnected();
  try {
    read(overlayLoadingWidgetProvider.notifier).update((state) => true);
    await read(authRepositoryImplProvider).signUp(
      email: email,
      password: password,
    );
    onSuccess();
    debugPrint('新規登録が完了');
    read(scaffoldMessengerServiceProvider).showSuccessSnackBar('新規登録が完了しました。');
  } on FirebaseAuthException catch (e) {
    if (!isNetworkCheck) {
      const exception = AppException(
        message: 'Maybe your network is disconnected. Please check yours.',
      );
      throw exception;
    }

    if (email.isEmpty || password.isEmpty) {
      const exception = AppException(
        message: 'Please input your email and password.',
      );
      throw exception;
    }
    debugPrint('新規登録エラー: $e');
    read(scaffoldMessengerServiceProvider).showExceptionSnackBar(e.toJapanese);
  } finally {
    read(overlayLoadingWidgetProvider.notifier).update((state) => false);
  }
}
