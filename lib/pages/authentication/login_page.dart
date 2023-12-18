import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/authentication/sign_in.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final passwordFocusNode = useFocusNode();
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ログイン',
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
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(passwordFocusNode),
                  autovalidateMode: validateMode.value,
                ),
                const SizedBox(height: 8),
                CommonTextField(
                  labelText: 'パスワード',
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: Validator.password,
                  obscureText: obscureText.value,
                  textInputAction: TextInputAction.done,
                  focusNode: passwordFocusNode,
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
                CommonButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      ref.read(
                        signInProvider(
                          emailController.text,
                          passwordController.text,
                          () => context.go(
                            AppRoutes.home,
                          ),
                        ),
                      );
                    } else {
                      validateMode.value = AutovalidateMode.onUserInteraction;
                    }
                  },
                  text: 'ログイン',
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'パスワードを忘れた方はこちら',
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 184),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
