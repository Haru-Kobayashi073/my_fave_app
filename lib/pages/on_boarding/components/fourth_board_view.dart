import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class FourthBoardView extends HookConsumerWidget {
  const FourthBoardView({super.key});
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
              image: AssetImage(Assets.images.fourthViewApp.path),
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
            '聖地巡礼しよう!',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            '推しが言った場所や推しがいる場所に自分自身も行きその記録を思い出にできます。推し度も上がるため。',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '※聖地巡礼機能のは推し度レベル３で解放されます。',
            style: TextStyle(
              fontSize: 14,
              color: AppColor.grey88,
            ),
          ),
          CommonButton(
            onPressed: () {
              context.push(
                const AddFavoriteExperienceIntroducePageRoute().location,
              );
            },
            text: '次へ',
          ),
        ],
      ),
    );
  }
}
