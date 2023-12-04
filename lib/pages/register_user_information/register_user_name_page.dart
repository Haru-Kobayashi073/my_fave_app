import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/pages/register_user_information/components/register_user_information_components.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class RegisterUserNamePage extends HookConsumerWidget {
  const RegisterUserNamePage({
    super.key,
    required this.email,
    required this.password,
  });
  final String email;
  final String password;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNameController = useTextEditingController();
    final formKey = useFormStateKey();
    final validateMode = useState<AutovalidateMode>(AutovalidateMode.disabled);

    return Scaffold(
      appBar: const CommonAppBar(
        icon: SkipButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const StatusBar(phaseIndex: 3),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  'あなたの名前を教えて！',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CommonTextField(
                labelText: '名前(ニックネーム)',
                controller: userNameController,
                keyboardType: TextInputType.name,
                validator: Validator.common,
                textInputAction: TextInputAction.done,
                autovalidateMode: validateMode.value,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: CommonButton(
                  text: '次へ',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                    } else {
                      validateMode.value = AutovalidateMode.onUserInteraction;
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
