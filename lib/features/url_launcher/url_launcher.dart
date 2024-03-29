import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

final urlLauncherProvider = Provider<Future<void> Function(String url)>(
  (ref) => (url) async {
    final isNetworkCheck = await isNetworkConnected();
    try {
      await launchUrl(Uri.parse(url));
    } on AppException catch (e) {
      if (!isNetworkCheck) {
        const exception = AppException(
          message: 'Maybe your network is disconnected. Please check yours.',
        );
        throw exception;
      }
      debugPrint('プライバシーポリシーページエラー: $e');
    }
  },
);
