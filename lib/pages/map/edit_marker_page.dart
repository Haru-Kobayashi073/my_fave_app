import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_fave_app/features/file/upload_image.dart';
import 'package:my_fave_app/features/google_map_marker/google_map_marker.dart';
import 'package:my_fave_app/models/marker_data.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class EditMarkerPage extends HookConsumerWidget {
  const EditMarkerPage({
    super.key,
    required this.marker,
  });
  final MarkerData marker;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = useState<String?>(marker.imageUrl);
    final titleController = useTextEditingController(text: marker.title);
    final locationController = useTextEditingController(text: marker.location);
    final memoController = useTextEditingController(text: marker.memo);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.black00,
        elevation: 0,
        title: const Text(
          '聖地を編集',
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () async {
                  final takedImage =
                      await TakePhotoPageRoute().push<XFile?>(context);
                  if (takedImage != null) {
                    final imageFile = File(takedImage.path);
                    imageUrl.value =
                        await ref.read(uploadImageProvider).call(imageFile);
                  }
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl.value!,
                    fit: BoxFit.cover,
                    width: context.deviceWidth,
                    height: context.deviceWidth - 32,
                    progressIndicatorBuilder: (_, __, ___) => const Loading(),
                  ),
                ),
              ),
              TextFormField(
                controller: titleController,
                cursorColor: AppColor.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecorationStyles.square('タイトル'),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Container(
                width: context.deviceWidth - 34,
                height: 1,
                color: AppColor.black33,
              ),
              TextFormField(
                controller: locationController,
                cursorColor: AppColor.white,
                decoration: InputDecorationStyles.square('場所を追加'),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Container(
                width: context.deviceWidth - 34,
                height: 1,
                color: AppColor.black33,
              ),
              TextFormField(
                controller: memoController,
                cursorColor: AppColor.white,
                decoration: InputDecorationStyles.square('メモ'),
                style: const TextStyle(
                  fontSize: 16,
                ),
                maxLines: null,
              ),
              const SizedBox(height: 32),
              CommonButton(
                onPressed: () {
                  final markerComparison = MarkerData(
                    markerId: marker.markerId,
                    favoriteId: marker.favoriteId,
                    title: titleController.text,
                    location: locationController.text,
                    imageUrl: imageUrl.value!,
                    latitude: marker.latitude,
                    longitude: marker.longitude,
                    memo: memoController.text.isNotEmpty
                        ? memoController.text
                        : null,
                    createdAt: marker.createdAt,
                  );
                  if (titleController.text.isNotEmpty &&
                      locationController.text.isNotEmpty) {
                    if (marker != markerComparison) {
                      ref.read(googleMapMarkerProvider.notifier).edit(
                        markerComparison,
                        () {
                          context
                            ..pop()
                            ..pop();
                        },
                      );
                    } else {
                      ref
                          .read(scaffoldMessengerServiceProvider)
                          .showExceptionSnackBar('変更がありません');
                    }
                  } else {
                    ref
                        .read(scaffoldMessengerServiceProvider)
                        .showExceptionSnackBar('必須項目を入力してください');
                  }
                },
                text: '変更',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
