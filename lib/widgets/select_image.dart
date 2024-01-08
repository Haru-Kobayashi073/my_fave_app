import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class SelectImage extends HookConsumerWidget {
  const SelectImage({
    super.key,
    required this.onTap,
    required this.imageUrl,
  });
  final void Function() onTap;
  final String? imageUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          child: imageUrl != null
              ? CachedNetworkImage(
                  imageUrl: imageUrl!,
                  fit: BoxFit.cover,
                  width: context.deviceWidth,
                  height: context.deviceWidth - 32,
                  progressIndicatorBuilder: (_, __, ___) => const Loading(),
                )
              : Container(
                  color: AppColor.black15,
                  width: context.deviceWidth,
                  height: context.deviceWidth - 32,
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: AppColor.grey88,
                      radius: 20,
                      child: Icon(
                        Icons.add,
                        color: AppColor.white,
                        size: 36,
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
