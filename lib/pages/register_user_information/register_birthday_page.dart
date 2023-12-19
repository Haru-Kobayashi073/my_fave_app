// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:my_fave_app/pages/register_user_information/components/register_user_information_components.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class RegisterBirthDayPage extends HookWidget {
  const RegisterBirthDayPage({
    super.key,
    required this.userName,
  });
  final String userName;

  @override
  Widget build(BuildContext context) {
    final selectDate = useState<DateTime?>(null);
    final pressed = useState<bool?>(false);

    return Scaffold(
      appBar: const CommonAppBar(
        icon: SkipButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Column(
          children: [
            const StatusBar(phaseIndex: 4),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Text(
                '生年月日を追加しよう！',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            PopUpButton(
              labelText: '生年月日',
              visibleError: pressed.value ?? selectDate.value == null,
              child: Text(
                selectDate.value == null
                    ? '選択してください'
                    : '${selectDate.value!.year}年${selectDate.value!.month}月${selectDate.value!.day}日',
                style: TextStyle(
                  color: selectDate.value == null
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
                      initialDateTime: selectDate.value,
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (dateTime) {
                        selectDate.value = dateTime;
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
                if (selectDate.value != null) {
                  pressed.value = false;
                  context.push(
                    RegisterGenderPageRoute(
                      userName: userName,
                      birthDay: selectDate.value!,
                    ).location,
                  );
                } else {
                  pressed.value = null;
                }
              },
              text: '次へ',
            ),
          ],
        ),
      ),
    );
  }
}
