import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class ReconfigurationMailPage extends HookConsumerWidget {
  const ReconfigurationMailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final formKey = useFormStateKey();
    final validateMode = useState<AutovalidateMode>(AutovalidateMode.disabled);
    return Scaffold(
      appBar: const CommonAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 24,
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'パスワードの再設定',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                CommonTextField(
                  labelText: 'メールアドレス',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validator.email,
                  autovalidateMode: validateMode.value,
                ),
                const SizedBox(height: 8),
                Text(
                  'こちらのメールアドレスにパスワードの再設定メールを送信します。',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColor.grey88,
                  ),
                ),
                const SizedBox(height: 24),
                CommonButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.push(
                        ConfirmationMailPageRoute(
                          email: emailController.text,
                        ).location,
                      );
                    } else {
                      validateMode.value = AutovalidateMode.onUserInteraction;
                    }
                  },
                  text: '送信',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
