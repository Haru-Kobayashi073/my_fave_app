import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/favorite/favorite.dart';
import 'package:my_fave_app/features/file/crop_image.dart';
import 'package:my_fave_app/features/file/pick_image.dart';
import 'package:my_fave_app/features/file/upload_image.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class AddFavoritePhotoPage extends HookConsumerWidget {
  const AddFavoritePhotoPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = useState<String?>(null);
    final selectImagePressed = useState<bool?>(false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.black00,
        elevation: 0,
        title: const Text(
          'フォト',
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
                  await ref.read(favoriteProvider.notifier).addPhoto(
                    id,
                    imageUrl.value!,
                    () {
                      ref.invalidate(favoriteProvider);
                      context.pop();
                    },
                  );
                } else {
                  selectImagePressed.value = null;
                  ref
                      .read(scaffoldMessengerServiceProvider)
                      .showExceptionSnackBar('画像を選択してください');
                }
              },
              text: '追加',
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
                imageUrl.value =
                    await ref.read(uploadImageProvider).call(croppedImage);
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
