// ignore_for_file: avoid_positional_boolean_parameters

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/models/activity_data.dart';
import 'package:my_fave_app/utils/utils.dart';

class ActivityMainImage extends HookConsumerWidget {
  const ActivityMainImage({
    super.key,
    required this.activityData,
    required this.onTap,
  });
  final ActivityData activityData;
  final void Function(bool?) onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: CachedNetworkImage(
              width: double.infinity,
              imageUrl: activityData.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
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
                  onChanged: onTap,
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
