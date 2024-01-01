import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_fave_app/repositories/file/file_repository_impl.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final pickImageProvider = Provider<Future<File?> Function()>(
  (ref) => () async {
    final read = ref.read;
    final isNetworkCheck = await isNetworkConnected();
    try {
      read(overlayLoadingWidgetProvider.notifier).update((state) => true);
      final pickedImage = await read(fileRepositoryImplProvider).pickImage();
      if (pickedImage == null) {
        return null;
      }
      read(imageModificationStatusProvider.notifier).picked();
      return pickedImage;
    } on Exception catch (e) {
      if (!isNetworkCheck) {
        const exception = AppException(
          message: 'Maybe your network is disconnected. Please check yours.',
        );
        throw exception;
      }

      debugPrint('画像選択エラー: $e');
      read(scaffoldMessengerServiceProvider)
          .showExceptionSnackBar('画像の選択に失敗しました');
      return null;
    } finally {
      read(overlayLoadingWidgetProvider.notifier).update((state) => false);
    }
  },
);
