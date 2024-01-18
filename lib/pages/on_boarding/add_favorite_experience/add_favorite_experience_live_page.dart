import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class AddFavoriteExperienceLivePage extends HookConsumerWidget {
  const AddFavoriteExperienceLivePage({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.startedLikingDate,
  });
  final String imageUrl;
  final String name;
  final DateTime startedLikingDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final formKey = useFormStateKey();
    final validateMode = useState<AutovalidateMode>(AutovalidateMode.disabled);

    return Scaffold(
      appBar: const CommonAppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '推しを追加',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: context.deviceWidth - 64,
                    height: context.deviceWidth - 64,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 24),
                CommonTextField(
                  labelText: 'LIVEに参加した回数を教えてください',
                  controller: controller,
                  validator: Validator.common,
                  keyboardType: TextInputType.number,
                  autovalidateMode: validateMode.value,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(height: 16),
                CommonButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.push(
                        AddFavoriteExperienceAllPageRoute(
                          imageUrl: imageUrl,
                          name: name,
                          startedLikingDate: startedLikingDate,
                          numberOfLiveParticipation: int.parse(controller.text),
                        ).location,
                      );
                    } else {
                      validateMode.value = AutovalidateMode.onUserInteraction;
                    }
                  },
                  text: '次へ',
                ),
                CommonButton(
                  onPressed: () {
                    context.pop();
                  },
                  text: '戻る',
                  isWhite: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
