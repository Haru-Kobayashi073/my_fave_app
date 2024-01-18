import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/utils/routes/routes.dart';
import 'package:my_fave_app/widgets/widget.dart';

class AddFavoriteExperienceIntroducePage extends HookConsumerWidget {
  const AddFavoriteExperienceIntroducePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const Text(
              '次は推しの写真を追加しよう！',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'カバーになる写真だから自分の中で一番好きな写真を選んでみよう！',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 64),
            CommonButton(
              onPressed: () {
                context.go(
                  const AddFavoriteExperiencePhotoPageRoute().location,
                );
              },
              text: '次へ',
            ),
          ],
        ),
      ),
    );
  }
}
