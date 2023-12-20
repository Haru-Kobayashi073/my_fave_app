import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/authentication/sign_in_with_apple.dart';
import 'package:my_fave_app/features/authentication/sign_in_with_google.dart';
import 'package:my_fave_app/pages/authentication/components/authetication_components.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class AuthenticationPage extends HookConsumerWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 160),
            SvgPicture.asset(Assets.icons.myFaveLogo),
            Column(
              children: [
                CommonButton(
                  onPressed: () =>
                      context.push(const LoginPageRoute().location),
                  text: 'ログイン',
                ),
                CommonButton(
                  onPressed: () =>
                      context.push(const RegisterMailPageRoute().location),
                  text: 'メールアドレスで登録',
                  isWhite: false,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 10,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(color: AppColor.white),
                      ),
                      Text(
                        ' または ',
                        style: TextStyle(
                          color: AppColor.grey88,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Divider(color: AppColor.white),
                      ),
                    ],
                  ),
                ),
                if (context.isIOS)
                  SocialLoginButton(
                    onPressed: () {
                      ref.read(
                        signInWithAppleProvider(() {}),
                      );
                    },
                    icon: Assets.icons.appleIcon,
                    text: 'Appleでログイン',
                  ),
                SocialLoginButton(
                  onPressed: () {
                    ref.read(
                      signInWithGoogleProvider(() {}),
                    );
                  },
                  icon: Assets.icons.googleIcon,
                  text: 'Googleでログイン',
                ),
                SocialLoginButton(
                  onPressed: () {},
                  icon: Assets.icons.xTwitterIcon,
                  text: 'Xでログイン',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
