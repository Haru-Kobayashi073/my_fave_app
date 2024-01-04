import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class ThirdBoardView extends HookConsumerWidget {
  const ThirdBoardView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 320,
            color: AppColor.black33,
          ),
          const Text('Description Text 3'),
          CommonButton(
            onPressed: () {},
            text: '次へ',
          ),
        ],
      ),
    );
  }
}
