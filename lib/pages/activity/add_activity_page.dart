import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/activity/activity.dart';
import 'package:my_fave_app/features/file/crop_image.dart';
import 'package:my_fave_app/features/file/pick_image.dart';
import 'package:my_fave_app/features/file/upload_image.dart';
import 'package:my_fave_app/models/activity_data.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class AddActivityPage extends HookConsumerWidget {
  const AddActivityPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = useState<String?>(null);
    final selectImagePressed = useState<bool?>(false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.black00,
        elevation: 0,
        title: const Text(
          '推し活を投稿',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leadingWidth: 100,
        leading: TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'キャンセル',
            style: TextStyle(
              fontSize: 14,
              color: AppColor.white,
            ),
          ),
        ),
        actions: [
          Container(
            width: 112,
            height: 56,
            margin: const EdgeInsets.only(right: 16),
            child: CommonButton(
              onPressed: () async {
                if (imageUrl.value != null) {
                  await ref.read(activityProvider.notifier).create(
                      ActivityData(
                        id: '',
                        imageUrl: imageUrl.value!,
                        isLiked: false,
                      ), () {
                    context.pop();
                  });
                } else {
                  selectImagePressed.value = null;
                  ref
                      .read(scaffoldMessengerServiceProvider)
                      .showExceptionSnackBar('画像を選択してください');
                }
              },
              text: '投稿',
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SelectImage(
              onTap: () async {
                final pickedImage = await ref.read(pickImageProvider).call();
                final croppedImage =
                    await ref.read(cropImageProvider).call(pickedImage);
                final imageFile = File(croppedImage?.path ?? '');
                if (imageFile.path != '') {
                  imageUrl.value =
                      await ref.read(uploadImageProvider).call(imageFile);
                }
              },
              imageUrl: imageUrl.value,
            ),
            if (selectImagePressed.value ?? imageUrl.value == null)
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 16),
                child: const Text(
                  '選択してください',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
