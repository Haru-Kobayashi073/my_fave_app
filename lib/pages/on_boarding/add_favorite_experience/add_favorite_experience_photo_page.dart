import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/file/crop_image.dart';
import 'package:my_fave_app/features/file/pick_image.dart';
import 'package:my_fave_app/features/file/upload_image.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class AddFavoriteExperiencePhotoPage extends HookConsumerWidget {
  const AddFavoriteExperiencePhotoPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = useState<String?>(null);
    final selectImagePressed = useState<bool?>(false);

    return Scaffold(
      appBar: const CommonAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '推しを追加',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'カバーになる写真だから自分の中で一番好きな写真を選んでみよう！',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColor.grey88,
                ),
              ),
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
              const SizedBox(height: 16),
              CommonButton(
                onPressed: () {
                  if (imageUrl.value != null) {
                    context.push(
                      AddFavoriteExperienceNamePageRoute(
                        imageUrl: imageUrl.value!,
                      ).location,
                    );
                  } else {
                    selectImagePressed.value = null;
                    ref
                        .read(scaffoldMessengerServiceProvider)
                        .showExceptionSnackBar('画像を選択してください');
                  }
                },
                text: '次へ',
              ),
              if (imageUrl.value != null)
                CommonButton(
                  onPressed: () async {
                    final pickedImage =
                        await ref.read(pickImageProvider).call();
                    final croppedImage =
                        await ref.read(cropImageProvider).call(pickedImage);
                    final imageFile = File(croppedImage?.path ?? '');
                    if (imageFile.path != '') {
                      imageUrl.value =
                          await ref.read(uploadImageProvider).call(imageFile);
                    }
                  },
                  text: '再選択',
                  isWhite: false,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
