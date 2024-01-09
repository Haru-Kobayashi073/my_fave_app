import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/utils/utils.dart';

class ActivityImage extends HookConsumerWidget {
  const ActivityImage({super.key, this.displayIsLike});
  final bool? displayIsLike;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLike = useToggle(false);

    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://images.unsplash.com/photo-1682687982360-3fbab65f9d50?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '2021/10/17',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColor.grey88,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (displayIsLike == true)
          Container(
            height: 24,
            margin: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: isLike.value,
                    onChanged: (value) {
                      isLike.toggle();
                    },
                    side: BorderSide(
                      color: AppColor.white,
                    ),
                    checkColor: AppColor.black00,
                    activeColor: AppColor.white,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'お気に入りに登録',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
