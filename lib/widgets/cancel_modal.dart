import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class CancelModal extends HookConsumerWidget {
  const CancelModal({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      backgroundColor: AppColor.black15,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      content: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '前の画面に戻ると、情報は削除されます。本当に削除しますか？',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            CommonButton(
              onPressed: () {
                context.pop(true);
              },
              text: '削除する',
            ),
            CommonButton(
              onPressed: () {
                context.pop(false);
              },
              text: 'キャンセル',
              isWhite: false,
            ),
          ],
        ),
      ),
    );
  }
}
