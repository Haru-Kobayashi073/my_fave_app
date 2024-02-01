import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class SecondBoardView extends HookConsumerWidget {
  const SecondBoardView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: context.deviceWidth * 0.8,
            child: Image(
              image: AssetImage(Assets.images.secondViewApp.path),
            ),
          ),
          const Text(
            '機能紹介',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'LIVEの予定管理や推しの詳細で推しの情報を整理！',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          CommonButton(
            onPressed: () {
              pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
            text: '次へ',
          ),
        ],
      ),
    );
  }
}
