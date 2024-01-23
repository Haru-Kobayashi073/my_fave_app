import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/utils/utils.dart';

class FavoriteLevel extends HookConsumerWidget {
  const FavoriteLevel({super.key, required this.favoriteLevel});
  final int favoriteLevel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: List.generate(
        4,
        (index) => Container(
          width: 25,
          height: 4,
          margin: const EdgeInsets.only(right: 6),
          decoration: BoxDecoration(
            color: judgeColor(favoriteLevel, index),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  Color judgeColor(int level, int index) {
    if (level >= index + 1) {
      return AppColor.green;
    } else {
      return AppColor.grey88;
    }
  }
}
