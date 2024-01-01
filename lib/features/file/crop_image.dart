import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:my_fave_app/repositories/file/file_repository_impl.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final cropImageProvider =
    Provider<Future<CroppedFile?> Function(File? pickedImage)>(
  (ref) => (pickedImage) async {
    final read = ref.read;
    final isNetworkCheck = await isNetworkConnected();
    try {
      read(overlayLoadingWidgetProvider.notifier).update((state) => true);
      final croppedImage =
          await read(fileRepositoryImplProvider).cropImage(pickedImage);
      if (croppedImage == null) {
        return null;
      }
      read(imageModificationStatusProvider.notifier).cropped();
      return croppedImage;
    } on Exception catch (e) {
      if (!isNetworkCheck) {
        const exception = AppException(
          message: 'Maybe your network is disconnected. Please check yours.',
        );
        throw exception;
      }

      debugPrint('画像加工エラー: $e');
      read(scaffoldMessengerServiceProvider)
          .showExceptionSnackBar('画像の加工に失敗しました');
      return null;
    } finally {
      read(overlayLoadingWidgetProvider.notifier).update((state) => false);
    }
  },
);
