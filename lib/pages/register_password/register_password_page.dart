// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class RegisterPasswordPage extends HookConsumerWidget {
  const RegisterPasswordPage({
    super.key,
    required this.email,
  });
  final String email;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final obscureText = useToggle(true);
    final formKey = useFormStateKey();
    final validateMode = useState<AutovalidateMode>(AutovalidateMode.disabled);

    return Scaffold(
      appBar: const CommonAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const StatusBar(phaseIndex: 2),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    '新規のパスワードを設定しよう！',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CommonTextField(
                  labelText: 'パスワード',
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: Validator.password,
                  obscureText: obscureText.value,
                  autovalidateMode: validateMode.value,
                  icon: IconButton(
                    icon: Icon(
                      obscureText.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColor.white,
                    ),
                    splashRadius: 1,
                    onPressed: obscureText.toggle,
                  ),
                ),
                CommonTextField(
                  labelText: 'パスワード(確認用)',
                  controller: confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) => Validator.passwordConfirmation(
                    value,
                    passwordController.text,
                  ),
                  obscureText: obscureText.value,
                  autovalidateMode: validateMode.value,
                  icon: IconButton(
                    icon: Icon(
                      obscureText.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColor.white,
                    ),
                    splashRadius: 1,
                    onPressed: obscureText.toggle,
                  ),
                ),
                Text(
                  '※パスワードは少なくとも8文字以上である必要があります。\n ※大文字、小文字、数字、および特殊文字を含めてください。例: !@#\$%^&*()',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColor.grey88,
                  ),
                ),
                const SizedBox(height: 24),
                CommonButton(
                  text: '次へ',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                    } else {
                      validateMode.value = AutovalidateMode.onUserInteraction;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
