import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class ThirdBoardView extends HookConsumerWidget {
  const ThirdBoardView({super.key, required this.pageController});
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
            '推し度をあげよう！',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            '推し度とは、推し活、聖地巡礼を行うと上がるポイントです。\n 推しのためにMaxを目指そう！',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '※アプリのログイン回数が減少すると貯めた推し度も減少します。',
            style: TextStyle(
              fontSize: 14,
              color: AppColor.grey88,
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
