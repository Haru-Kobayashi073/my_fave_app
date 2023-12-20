import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/user/create_user.dart';
import 'package:my_fave_app/pages/register_user_information/components/register_user_information_components.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class RegisterGenderPage extends HookConsumerWidget {
  const RegisterGenderPage({
    super.key,
    required this.userName,
    required this.birthDay,
  });
  final String userName;
  final DateTime birthDay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectGender = useState<String?>(null);
    final pressed = useState<bool?>(false);

    return Scaffold(
      appBar: CommonAppBar(
        icon: SkipButton(
          onPressed: () {
            ref.read(
              createUserProvider(
                userName: userName,
                birthDay: birthDay,
                onSuccess: () {
                  pressed.value = false;
                  context.go(
                    const CompleteRegistrationPageRoute().location,
                  );
                },
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StatusBar(phaseIndex: 5),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Text(
                '性別を教えて！',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            PopUpButton(
              labelText: '性別',
              visibleError: pressed.value ?? selectGender.value == null,
              child: Text(
                selectGender.value == null ? '選択してください' : selectGender.value!,
                style: TextStyle(
                  color: selectGender.value == null
                      ? AppColor.grey88
                      : AppColor.white,
                  fontSize: 16,
                ),
              ),
              onPressed: () async {
                await showCupertinoModalPopup<void>(
                  context: context,
                  builder: (_) => DatePickerWrapper(
                    child: CupertinoPicker(
                      itemExtent: 32,
                      onSelectedItemChanged: (gender) {
                        selectGender.value = genderList[gender];
                      },
                      children: genderList
                          .map(
                            (gender) => Text(
                              gender,
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColor.white,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            CommonButton(
              onPressed: () {
                if (selectGender.value != null) {
                  ref.read(
                    createUserProvider(
                      userName: userName,
                      birthDay: birthDay,
                      gender: selectGender.value,
                      onSuccess: () {
                        pressed.value = false;
                        context.go(
                          const CompleteRegistrationPageRoute().location,
                        );
                      },
                    ),
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
