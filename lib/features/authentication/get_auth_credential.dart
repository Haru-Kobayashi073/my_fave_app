import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_fave_app/repositories/authentication/auth_repository_impl.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final getAuthCredentialProvider = Provider<
    Future<AuthCredential?> Function(
      String email,
      String password,
    )>(
  (ref) => (email, password) async {
    final read = ref.read;
    final isNetworkCheck = await isNetworkConnected();
    try {
      read(overlayLoadingWidgetProvider.notifier).update((state) => true);
      final authcredential = read(authRepositoryImplProvider)
          .getAuthCredential(email: email, password: password);
      debugPrint('認証情報を取得しました');
      return authcredential;
    } on FirebaseAuthException catch (e) {
      if (!isNetworkCheck) {
        const exception = AppException(
          message: 'Maybe your network is disconnected. Please check yours.',
        );
        throw exception;
      }

      debugPrint('認証情報の取得エラー: $e');
      read(scaffoldMessengerServiceProvider)
          .showExceptionSnackBar(e.toJapanese);
      rethrow;
    } finally {
      read(overlayLoadingWidgetProvider.notifier).update((state) => false);
    }
  },
);
