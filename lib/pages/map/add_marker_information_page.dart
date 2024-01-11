import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_fave_app/features/file/upload_image.dart';
import 'package:my_fave_app/features/map/map.dart';
import 'package:my_fave_app/models/marker_data.dart';
import 'package:my_fave_app/pages/map/map_page.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class AddMarkerInformationPage extends HookConsumerWidget {
  const AddMarkerInformationPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = useState<String?>(null);
    final entryMarkerInformation = useState<bool>(false);
    final titleController = useTextEditingController();
    final locationController = useTextEditingController();
    final memoController = useTextEditingController();
    final locationFocusNode = useFocusNode();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.black00,
        elevation: 0,
        title: const Text(
          '聖地を追加',
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
              entryMarkerInformation.value
                  ? Column(
                      children: [
                        const SizedBox(height: 16),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: imageUrl.value!,
                            fit: BoxFit.cover,
                            width: context.deviceWidth,
                            height: context.deviceWidth - 32,
                            progressIndicatorBuilder: (_, __, ___) =>
                                const Loading(),
                          ),
                        ),
                        TextFormField(
                          controller: titleController,
                          cursorColor: AppColor.white,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) => FocusScope.of(context)
                              .requestFocus(locationFocusNode),
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
                          focusNode: locationFocusNode,
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
                            final currentSpot = ref.read(currentSpotProvider);
                            if (titleController.text.isNotEmpty &&
                                locationController.text.isNotEmpty &&
                                currentSpot != null) {
                              ref.read(mapProvider.notifier).create(
                                MarkerData(
                                  markerId: '',
                                  title: titleController.text,
                                  location: locationController.text,
                                  imageUrl: imageUrl.value!,
                                  latitude: currentSpot.latitude,
                                  longitude: currentSpot.longitude,
                                ),
                                () {
                                  context.pop();
                                },
                              );
                            } else {
                              ref
                                  .read(scaffoldMessengerServiceProvider)
                                  .showExceptionSnackBar('必須項目を入力してください');
                            }
                          },
                          text: '追加',
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: GestureDetector(
                        onTap: () async {
                          final takedImage =
                              await AddMarkerInformationPageRoute()
                                  .push<XFile?>(context);
                          if (takedImage != null) {
                            final imageFile = File(takedImage.path);
                            imageUrl.value = await ref
                                .read(uploadImageProvider)
                                .call(imageFile);
                          }
                        },
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ),
                          child: imageUrl.value != null
                              ? CachedNetworkImage(
                                  imageUrl: imageUrl.value!,
                                  fit: BoxFit.cover,
                                  width: context.deviceWidth,
                                  height: context.deviceWidth - 32,
                                  progressIndicatorBuilder: (_, __, ___) =>
                                      const Loading(),
                                )
                              : Container(
                                  color: AppColor.black15,
                                  width: context.deviceWidth,
                                  height: context.deviceWidth - 32,
                                  child: Center(
                                    child: CircleAvatar(
                                      backgroundColor: AppColor.grey88,
                                      radius: 20,
                                      child: Icon(
                                        Icons.add,
                                        color: AppColor.white,
                                        size: 36,
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
              if (imageUrl.value != null && !entryMarkerInformation.value)
                Column(
                  children: [
                    const SizedBox(height: 24),
                    CommonButton(
                      onPressed: () {
                        entryMarkerInformation.value = true;
                      },
                      text: '次へ',
                    ),
                    CommonButton(
                      onPressed: () async {
                        final takedImage = await AddMarkerInformationPageRoute()
                            .push<XFile?>(context);
                        if (takedImage != null) {
                          final imageFile = File(takedImage.path);
                          imageUrl.value = await ref
                              .read(uploadImageProvider)
                              .call(imageFile);
                        }
                      },
                      text: '再撮影',
                      isWhite: false,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
