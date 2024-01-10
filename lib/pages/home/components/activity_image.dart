import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:my_fave_app/models/activity_data.dart';
import 'package:my_fave_app/utils/utils.dart';

class ActivityImage extends HookConsumerWidget {
  const ActivityImage({
    super.key,
    this.displayIsLike,
    required this.activityData,
  });
  final bool? displayIsLike;
  final ActivityData activityData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLike = useToggle(false);

    return Column(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: CachedNetworkImage(
                    imageUrl: activityData.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                DateFormat('yyyy/MM/dd').format(activityData.createdAt!),
                style: TextStyle(
                  fontSize: 12,
                  color: AppColor.grey88,
                ),
              ),
            ],
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
                    value: activityData.isLiked,
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
