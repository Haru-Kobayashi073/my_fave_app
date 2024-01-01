import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:my_fave_app/repositories/file/file_repository_impl.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final uploadImageProvider =
    Provider.autoDispose<Future<String?> Function(CroppedFile? croppedFile)>(
  (ref) => (croppedFile) async {
    final read = ref.read;
    final isNetworkCheck = await isNetworkConnected();
    try {
      read(overlayLoadingWidgetProvider.notifier).update((state) => true);
      final response =
          await read(fileRepositoryImplProvider).uploadImage(croppedFile);
      read(imageModificationStatusProvider.notifier).uploaded();
      return response;
    } on Exception catch (e) {
      if (!isNetworkCheck) {
        const exception = AppException(
          message: 'Maybe your network is disconnected. Please check yours.',
        );
        throw exception;
      }

      debugPrint('画像アップロードエラー: $e');
      read(scaffoldMessengerServiceProvider)
          .showExceptionSnackBar('画像のアップロードに失敗しました');
      return null;
    } finally {
      read(overlayLoadingWidgetProvider.notifier).update((state) => false);
    }
  },
);
