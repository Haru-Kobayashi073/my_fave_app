import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/models/marker_data.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class MarkerModal extends HookConsumerWidget {
  const MarkerModal({super.key, required this.markerData});
  final MarkerData markerData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        MarkerDetailPageRoute(
          $extra: markerData,
        ).push<void>(context);
      },
      child: Container(
        width: context.deviceWidth - 32,
        height: 152,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: AppColor.black15,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: markerData.imageUrl,
                fit: BoxFit.cover,
                width: 136,
                height: 136,
                progressIndicatorBuilder: (_, __, ___) => const Loading(),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${markerData.createdAt!.year}/${markerData.createdAt!.month}/${markerData.createdAt!.day} ${'${'日月火水木金土'[markerData.createdAt!.weekday]}曜日'}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  markerData.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppColor.white,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      markerData.location,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  markerData.memo ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColor.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
