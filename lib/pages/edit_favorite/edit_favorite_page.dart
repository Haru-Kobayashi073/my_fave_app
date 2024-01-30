// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/favorite/favorite.dart';
import 'package:my_fave_app/features/file/crop_image.dart';
import 'package:my_fave_app/features/file/pick_image.dart';
import 'package:my_fave_app/features/file/upload_image.dart';
import 'package:my_fave_app/models/favorite_data.dart';
import 'package:my_fave_app/pages/register_user_information/components/register_user_information_components.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class EditFavoritePage extends HookConsumerWidget {
  const EditFavoritePage({super.key, required this.favoriteData});
  final FavoriteData favoriteData;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = useState<String?>(favoriteData.imageUrl);
    final selectImagePressed = useState<bool?>(false);
    final nameController = useTextEditingController(text: favoriteData.name);
    final numberOfLIveParticipationController = useTextEditingController(
      text: favoriteData.numberOfLiveParticipation.toString(),
    );
    final fanClubIdController =
        useTextEditingController(text: favoriteData.fanClubId);
    final startedLikingDate =
        useState<DateTime?>(favoriteData.startedLikingDate);
    final startedLikingDatePressed = useState<bool?>(false);
    final contractRenewalDateForFanClub =
        useState<DateTime?>(favoriteData.contractRenewalDateForFanClub);
    final contractRenewalDateForFanClubPressed = useState<bool?>(false);
    final favoriteBirthDay = useState<DateTime?>(favoriteData.favoriteBirthDay);
    final favoriteBirthDayPressed = useState<bool?>(false);
    final amountUsedController =
        useTextEditingController(text: favoriteData.amountUsed.toString());
    final instagramController =
        useTextEditingController(text: favoriteData.instagramLink);
    final xController = useTextEditingController(text: favoriteData.xLink);
    final youtubeController =
        useTextEditingController(text: favoriteData.youtubeLink);
    final otherLinkController =
        useTextEditingController(text: favoriteData.link);
    final otherLinkControllers = useState<List<TextEditingController>>(
      (favoriteData.otherlinks ?? [])
          .map((e) => TextEditingController(text: e))
          .toList(),
    );
    final formKey = useFormStateKey();
    final validateMode = useState<AutovalidateMode>(AutovalidateMode.disabled);

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        final willPop = await showDialog<bool>(
          context: context,
          builder: (_) => const CancelModal(),
        );
        if (willPop != null && willPop) {
          if (!context.mounted) {
            return;
          }
          context.pop();
        }
      },
      child: Scaffold(
        appBar: const CommonAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '推しを編集',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SelectImage(
                    onTap: () async {
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
                  const SizedBox(height: 16),
                  CommonTextField(
                    labelText: '推しの名前を入力※',
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    validator: Validator.common,
                    autovalidateMode: validateMode.value,
                  ),
                  const SizedBox(height: 16),
                  PopUpButton(
                    labelText: '推し始めたのはいつ頃ですか？※',
                    visibleError: startedLikingDatePressed.value ??
                        startedLikingDate.value == null,
                    child: Text(
                      startedLikingDate.value == null
                          ? '選択してください'
                          : '${startedLikingDate.value!.year}年${startedLikingDate.value!.month}月',
                      style: TextStyle(
                        color: startedLikingDate.value == null
                            ? AppColor.grey88
                            : AppColor.white,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () async {
                      await showCupertinoModalPopup<void>(
                        context: context,
                        builder: (_) => DatePickerWrapper(
                          child: CupertinoDatePicker(
                            initialDateTime: startedLikingDate.value,
                            mode: CupertinoDatePickerMode.monthYear,
                            onDateTimeChanged: (dateTime) {
                              startedLikingDate.value = dateTime;
                            },
                            maximumYear: DateTime.now().year,
                            backgroundColor: AppColor.black15,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  CommonTextField(
                    labelText: 'LIVEに参加した回数を教えてください!',
                    controller: numberOfLIveParticipationController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '推しについて',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CommonTextField(
                    labelText: 'ファンクラブID',
                    controller: fanClubIdController,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  PopUpButton(
                    labelText: 'ファンクラブ更新日',
                    visibleError: contractRenewalDateForFanClubPressed.value ??
                        contractRenewalDateForFanClub.value == null,
                    child: Text(
                      contractRenewalDateForFanClub.value == null
                          ? '選択してください'
                          : '${contractRenewalDateForFanClub.value!.year}年${contractRenewalDateForFanClub.value!.month}月${contractRenewalDateForFanClub.value!.day}日',
                      style: TextStyle(
                        color: contractRenewalDateForFanClub.value == null
                            ? AppColor.grey88
                            : AppColor.white,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () async {
                      await showCupertinoModalPopup<void>(
                        context: context,
                        builder: (_) => DatePickerWrapper(
                          child: CupertinoDatePicker(
                            initialDateTime:
                                contractRenewalDateForFanClub.value,
                            mode: CupertinoDatePickerMode.date,
                            onDateTimeChanged: (dateTime) {
                              contractRenewalDateForFanClub.value = dateTime;
                            },
                            maximumYear: DateTime.now().year,
                            backgroundColor: AppColor.black15,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  CommonTextField(
                    labelText: '推しへの使用額',
                    controller: amountUsedController,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  PopUpButton(
                    labelText: '推しの誕生日',
                    visibleError: favoriteBirthDayPressed.value ??
                        favoriteBirthDay.value == null,
                    child: Text(
                      favoriteBirthDay.value == null
                          ? '選択してください'
                          : '${favoriteBirthDay.value!.year}年${favoriteBirthDay.value!.month}月${favoriteBirthDay.value!.day}日',
                      style: TextStyle(
                        color: favoriteBirthDay.value == null
                            ? AppColor.grey88
                            : AppColor.white,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () async {
                      await showCupertinoModalPopup<void>(
                        context: context,
                        builder: (_) => DatePickerWrapper(
                          child: CupertinoDatePicker(
                            initialDateTime: favoriteBirthDay.value,
                            mode: CupertinoDatePickerMode.date,
                            onDateTimeChanged: (dateTime) {
                              favoriteBirthDay.value = dateTime;
                            },
                            maximumYear: DateTime.now().year,
                            backgroundColor: AppColor.black15,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'SNS',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CommonTextField(
                    labelText: 'Instagram',
                    controller: instagramController,
                    keyboardType: TextInputType.url,
                    validator: Validator.url,
                    autovalidateMode: validateMode.value,
                  ),
                  const SizedBox(height: 16),
                  CommonTextField(
                    labelText: 'X',
                    controller: xController,
                    keyboardType: TextInputType.url,
                    validator: Validator.url,
                    autovalidateMode: validateMode.value,
                  ),
                  const SizedBox(height: 16),
                  CommonTextField(
                    labelText: 'Youtube',
                    controller: youtubeController,
                    keyboardType: TextInputType.url,
                    validator: Validator.url,
                    autovalidateMode: validateMode.value,
                  ),
                  const SizedBox(height: 16),
                  CommonTextField(
                    labelText: 'その他リンク',
                    controller: otherLinkController,
                    keyboardType: TextInputType.url,
                    validator: Validator.url,
                    autovalidateMode: validateMode.value,
                  ),
                  SizedBox(
                    height: 91 * otherLinkControllers.value.length.toDouble(),
                    child: Column(
                      children: List.generate(
                        otherLinkControllers.value.length,
                        (index) => Stack(
                          alignment: const Alignment(1.06, -1.2),
                          children: [
                            CommonTextField(
                              labelText: 'その他リンク',
                              visibleLabel: false,
                              controller: otherLinkControllers.value[index],
                              keyboardType: TextInputType.url,
                              validator: Validator.url,
                              autovalidateMode: validateMode.value,
                            ),
                            CircleAvatar(
                              radius: 14,
                              backgroundColor: AppColor.greybb,
                              child: IconButton(
                                alignment: Alignment.center,
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                icon: Icon(
                                  Icons.close,
                                  size: 20,
                                  color: AppColor.black33,
                                ),
                                onPressed: () {
                                  otherLinkControllers.value = [
                                    ...otherLinkControllers.value
                                        .sublist(0, index),
                                    ...otherLinkControllers.value
                                        .sublist(index + 1),
                                  ];
                                },
                              ),
                            ),
                          ],
                        ),
                      ).toList(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 120,
                      height: 56,
                      child: CommonButton(
                        onPressed: () {
                          otherLinkControllers.value = [
                            ...otherLinkControllers.value,
                            TextEditingController(),
                          ];
                        },
                        text: '追加',
                        isWhite: false,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CommonButton(
                    onPressed: () {
                      final favoriteComparison = FavoriteData(
                        id: favoriteData.id,
                        createdAt: favoriteData.createdAt,
                        imageUrl: imageUrl.value ?? favoriteData.imageUrl,
                        name: nameController.text,
                        startedLikingDate: startedLikingDate.value ??
                            favoriteData.startedLikingDate,
                        numberOfLiveParticipation: int.parse(
                          numberOfLIveParticipationController.text != ''
                              ? numberOfLIveParticipationController.text
                              : favoriteData.numberOfLiveParticipation
                                  .toString(),
                        ),
                        fanClubId: fanClubIdController.text,
                        contractRenewalDateForFanClub:
                            contractRenewalDateForFanClub.value ??
                                favoriteData.contractRenewalDateForFanClub,
                        amountUsed: int.parse(
                          amountUsedController.text != ''
                              ? amountUsedController.text
                              : favoriteData.amountUsed.toString(),
                        ),
                        favoriteBirthDay: favoriteBirthDay.value ??
                            favoriteData.favoriteBirthDay,
                        instagramLink: instagramController.text,
                        xLink: xController.text,
                        youtubeLink: youtubeController.text,
                        link: otherLinkController.text,
                        otherlinks: otherLinkControllers.value
                            .map((e) => e.text)
                            .toList(),
                      );
                      if (favoriteData != favoriteComparison) {
                        ref.read(favoriteProvider.notifier).edit(
                          favoriteComparison,
                          () {
                            context.pop();
                          },
                        );
                      } else {
                        selectImagePressed.value = null;
                        startedLikingDatePressed.value = null;
                        validateMode.value = AutovalidateMode.onUserInteraction;
                        ref
                            .read(scaffoldMessengerServiceProvider)
                            .showExceptionSnackBar('変更がありません');
                      }
                    },
                    text: '完了',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
