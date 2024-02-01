import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class FirstBoardView extends HookConsumerWidget {
  const FirstBoardView({super.key, required this.pageController});
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
              image: AssetImage(Assets.images.firstViewApp.path),
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
            '推しのいる生活をを最大限Enjoyしよう！',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            '推しの情報を綺麗に整理して、自分だけの推しページを作ろう！ \n 写真やメモなど便利機能がいっぱい！',
            style: TextStyle(
              fontSize: 14,
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
