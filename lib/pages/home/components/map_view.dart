import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class MapView extends HookConsumerWidget {
  const MapView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          Text(
            '聖地巡礼',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColor.white,
            ),
          ),
          Text(
            '推しのめぐった場所を巡礼して写真を撮ろう',
            style: TextStyle(
              fontSize: 14,
              color: AppColor.grey88,
            ),
          ),
          const SizedBox(height: 8),
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: Image.asset(
                  Assets.images.mapViewImage.path,
                  fit: BoxFit.cover,
                  opacity: const AlwaysStoppedAnimation(.5),
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 80),
                  const Text(
                    '聖地巡礼 \n レベル3以上解放',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  SizedBox(
                    width: 160,
                    height: 56,
                    child: CommonButton(
                      onPressed: () {},
                      text: '追加',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
