import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/utils/constants/constants.dart';
import 'package:my_fave_app/widgets/widget.dart';

class ErrorPage extends HookConsumerWidget {
  const ErrorPage({
    super.key,
    required this.onRetry,
  });
  final void Function() onRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Icon(
              Icons.error_outline_outlined,
              size: 100,
              color: AppColor.white,
            ),
            const SizedBox(height: 40),
            const Expanded(
              child: Text(
                '申し訳ございません、エラーが発生しました。\n 通信環境をご確認の上、再度お試しください。',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CommonButton(
              onPressed: onRetry,
              text: 'やり直す',
            ),
          ],
        ),
      ),
    );
  }
}
