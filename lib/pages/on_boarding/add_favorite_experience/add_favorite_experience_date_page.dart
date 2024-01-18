// ignore_for_file: lines_longer_than_80_chars

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/pages/register_user_information/components/date_picker_wrapper.dart';
import 'package:my_fave_app/pages/register_user_information/components/pop_up_button.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class AddFavoriteExperienceDatePage extends HookConsumerWidget {
  const AddFavoriteExperienceDatePage({
    super.key,
    required this.imageUrl,
    required this.name,
  });
  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startedLikingDate = useState<DateTime?>(null);
    final startedLikingDatePressed = useState<bool?>(false);

    return Scaffold(
      appBar: const CommonAppBar(
        automaticallyImplyLeading: false,
      ),
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
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: context.deviceWidth - 64,
                  height: context.deviceWidth - 64,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),
              PopUpButton(
                labelText: '推し始めたのはいつ頃ですか？',
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
              CommonButton(
                onPressed: () {
                  if (startedLikingDate.value != null) {
                    context.push(
                      AddFavoriteExperienceLivePageRoute(
                        imageUrl: imageUrl,
                        name: name,
                        startedLikingDate: startedLikingDate.value!,
                      ).location,
                    );
                  } else {
                    startedLikingDatePressed.value = null;
                    ref
                        .read(scaffoldMessengerServiceProvider)
                        .showExceptionSnackBar('いつ頃か選択してください');
                  }
                },
                text: '次へ',
              ),
              CommonButton(
                onPressed: () {
                  context.pop();
                },
                text: '戻る',
                isWhite: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
