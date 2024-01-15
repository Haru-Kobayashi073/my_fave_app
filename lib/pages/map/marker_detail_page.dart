// ignore_for_file: lines_longer_than_80_chars

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/google_map_marker/google_map_marker.dart';
import 'package:my_fave_app/models/marker_data.dart';
import 'package:my_fave_app/pages/map/components/map_components.dart';
import 'package:my_fave_app/pages/map/map_page.dart';

import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class MarkerDetailPage extends HookConsumerWidget {
  const MarkerDetailPage({super.key, required this.marker});
  final MarkerData marker;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleMapMarkerNotifier = ref.read(googleMapMarkerProvider.notifier);

    return Scaffold(
      appBar: CommonAppBar(
        icon: IconButton(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.circleQuestion),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: marker.imageUrl,
                      fit: BoxFit.cover,
                      width: context.deviceWidth,
                      height: context.deviceWidth - 32,
                      progressIndicatorBuilder: (_, __, ___) => const Loading(),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 300,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColor.black15,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${marker.createdAt!.year}/${marker.createdAt!.month}/${marker.createdAt!.day} ${'${'日月火水木金土'[marker.createdAt!.weekday]}曜日'}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            MarkerOptionPopUp(
                              onPressedEdit: () {
                                EditMarkerPageRoute($extra: marker)
                                    .push<void>(context);
                              },
                              onPressedDelete: () async {
                                if (ref.read(
                                  isOpenedTouchedMarkerModalProvider,
                                )) {
                                  ref
                                      .read(
                                        isOpenedTouchedMarkerModalProvider
                                            .notifier,
                                      )
                                      .state = false;
                                }
                                await googleMapMarkerNotifier.delete(
                                  marker,
                                  () {
                                    context.pop();
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          marker.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColor.white,
                            ),
                            Text(
                              marker.location,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Text(
                          marker.memo ??
                              'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 56),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CircleAvatar(
              radius: 18,
              backgroundColor: AppColor.greybb,
              child: IconButton(
                splashRadius: 1,
                alignment: Alignment.center,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(
                  Icons.close,
                  size: 22,
                  color: AppColor.black33,
                ),
                onPressed: () {
                  context.pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
