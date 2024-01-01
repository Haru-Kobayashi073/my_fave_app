import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/file/crop_image.dart';
import 'package:my_fave_app/features/file/pick_image.dart';
import 'package:my_fave_app/features/file/upload_image.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class AddFavoritePage extends HookConsumerWidget {
  const AddFavoritePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = useState<String?>(null);
    final imageStatus = ref.watch(imageModificationStatusProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('推しを追加'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(imageStatus == ImageStatus.uploaded ? 'できた！' : '推しを追加'),
            CommonButton(
              onPressed: () async {
                final pickedImage = await ref.read(pickImageProvider).call();
                final croppedImage =
                    await ref.read(cropImageProvider).call(pickedImage);
                imageUrl.value =
                    await ref.read(uploadImageProvider).call(croppedImage);
              },
              text: '画像加工',
            ),
          ],
        ),
      ),
    );
  }
}
