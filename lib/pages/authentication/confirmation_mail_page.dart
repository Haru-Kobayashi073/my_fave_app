import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/common_app_bar.dart';
import 'package:my_fave_app/widgets/widget.dart';

class ConfirmationMailPage extends HookConsumerWidget {
  const ConfirmationMailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.mail,
              color: AppColor.white,
              size: 100,
            ),
            const SizedBox(height: 30),
            const Text(
              'メールを確認してください',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'shimanoyuuki@yahoo.co.jpにパスワードをリセットするためのリンクを送信しました。パスワードをリセットし、再度ログインしてください。',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.grey88,
                ),
              ),
            ),
            const SizedBox(height: 24),
            CommonButton(
                  onPressed: () {
                    context.push(const ConfirmationMailPageRoute().location);
                  },
                  text: '完了',
                ),
          ],
        ),
      ),
    );
  }
}
