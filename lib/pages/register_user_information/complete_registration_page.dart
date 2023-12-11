import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/widgets/widget.dart';

class CompleteRegistrationPage extends HookConsumerWidget {
  const CompleteRegistrationPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StatusBar(phaseIndex: 6),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'アカウントの登録が完了したよ！',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Welcome to the My Fave! 😍',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 48),
              child: CommonButton(
                onPressed: () {},
                text: '次へ',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
