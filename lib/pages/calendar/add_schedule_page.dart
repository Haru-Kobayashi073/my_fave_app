import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/pages/register_user_information/components/date_picker_wrapper.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class AddSchedulePage extends HookConsumerWidget {
  const AddSchedulePage({super.key, this.selectedDate});
  final DateTime? selectedDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAllDay = useToggle(false);
    final startDate =
        useState(selectedDate ?? DateTime.now().add(const Duration(hours: 1)));
    final endDate =
        useState(selectedDate ?? DateTime.now().add(const Duration(hours: 2)));
    final locationFocusNode = useFocusNode();
    final urlFocusNode = useFocusNode();
    final memoFocusNode = useFocusNode();
    final titleController = useTextEditingController();
    final locationController = useTextEditingController();
    final urlController = useTextEditingController();
    final memoController = useTextEditingController();

    useEffect(
      () {
        endDate.value = startDate.value.add(const Duration(hours: 1));
        return null;
      },
      [startDate.value],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.black00,
        elevation: 0,
        title: const Text(
          '新規予定',
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
            width: 120,
            height: 56,
            margin: const EdgeInsets.only(right: 16),
            child: CommonButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    locationController.text.isNotEmpty) {
                  context.pop();
                } else {
                  ref
                      .read(scaffoldMessengerServiceProvider)
                      .showExceptionSnackBar(
                        '必ずタイトルと場所を入力してください',
                      );
                }
              },
              text: '追加',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                cursorColor: AppColor.white,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(locationFocusNode),
                decoration: InputDecorationStyles.topSemiCircle('タイトル※'),
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
                textInputAction: TextInputAction.next,
                focusNode: locationFocusNode,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(urlFocusNode),
                decoration: InputDecorationStyles.bottomSemiCircle('場所を追加※'),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 32),
              Container(
                width: double.infinity,
                height: 56,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColor.black15,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '終日',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    CupertinoSwitch(
                      value: isAllDay.value,
                      onChanged: (value) {
                        isAllDay.toggle();
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: context.deviceWidth - 34,
                height: 1,
                color: AppColor.black33,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColor.black15,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await showCupertinoModalPopup<void>(
                          context: context,
                          builder: (_) => DatePickerWrapper(
                            child: CupertinoDatePicker(
                              initialDateTime: startDate.value,
                              mode: isAllDay.value
                                  ? CupertinoDatePickerMode.date
                                  : CupertinoDatePickerMode.dateAndTime,
                              onDateTimeChanged: (dateTime) {
                                startDate.value = dateTime;
                              },
                              maximumYear: DateTime.now().year + 1,
                              backgroundColor: AppColor.black15,
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formatDateTime(startDate.value).$1,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          if (!isAllDay.value)
                            Text(
                              formatDateTime(startDate.value).$2,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () async {
                        await showCupertinoModalPopup<void>(
                          context: context,
                          builder: (_) => DatePickerWrapper(
                            child: CupertinoDatePicker(
                              initialDateTime: endDate.value,
                              mode: isAllDay.value
                                  ? CupertinoDatePickerMode.date
                                  : CupertinoDatePickerMode.dateAndTime,
                              onDateTimeChanged: (dateTime) {
                                endDate.value = dateTime;
                              },
                              maximumYear: DateTime.now().year + 1,
                              backgroundColor: AppColor.black15,
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formatDateTime(endDate.value).$1,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          if (!isAllDay.value)
                            Text(
                              formatDateTime(endDate.value).$2,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: urlController,
                cursorColor: AppColor.white,
                textInputAction: TextInputAction.next,
                focusNode: urlFocusNode,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(memoFocusNode),
                decoration: InputDecorationStyles.topSemiCircle('URL'),
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
                maxLines: null,
                cursorColor: AppColor.white,
                textInputAction: TextInputAction.done,
                focusNode: memoFocusNode,
                decoration: InputDecorationStyles.bottomSemiCircle('メモ'),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
