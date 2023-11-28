import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.black00,
        title: SvgPicture.asset(
          Assets.icons.myFaveLogo,
          width: 100,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
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
            ),
            const SizedBox(height: 8),
            CommonTextField(
              labelText: 'パスワード',
              controller: passwordController,
            ),
            CommonButton(
              onPressed: () {},
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
    );
  }
}
