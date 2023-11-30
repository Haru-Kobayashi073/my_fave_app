import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class RegisterMailPage extends HookWidget {
  const RegisterMailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final isValidMail = useState<bool?>(false);

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
          children: [
            const StatusBar(phaseIndex: 1),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Text(
                'あなたのメールアドレスを教えて！',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CommonTextField(
              labelText: 'メールアドレス',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (enterdMail) {
                isValidMail.value = Validator.email(enterdMail);
              },
              icon: Icon(
                Icons.check,
                color: isValidMail.value != null && isValidMail.value!
                    ? AppColor.green
                    : AppColor.grey88,
              ),
            ),
            Text(
              'こちらのメールアドレスに確認メールを送信しますのでご確認ください',
              style: TextStyle(
                fontSize: 12,
                color: AppColor.grey88,
              ),
            ),
            const SizedBox(height: 24),
            CommonButton(
              onPressed: () {},
              text: '次へ',
            ),
          ],
        ),
      ),
    );
  }
}
