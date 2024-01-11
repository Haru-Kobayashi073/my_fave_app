import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

final mapControllerProvider =
    StateProvider<GoogleMapController?>((ref) => null);

final currentSpotProvider = StateProvider<LatLng?>((ref) => null);

class MapPage extends HookConsumerWidget {
  const MapPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late StreamSubscription<Position> positionStream;
    late Position position;
    final watch = ref.watch;

    /// 画面上のGoogleMapを制御
    void onMapCreated(GoogleMapController controller) {
      watch(mapControllerProvider.notifier).state = controller;
    }

    const locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    useEffect(
      () {
        Future(() async {
          // await ref.read(getTrackingTransparencyProvider).call();

          /// 位置情報の許可を確認
          final permission = await Geolocator.checkPermission();
          if (permission == LocationPermission.denied) {
            await Geolocator.requestPermission();
          }

          /// 位置情報を格納
          position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
          );

          /// Providerに位置情報を格納
          watch(currentSpotProvider.notifier).state = LatLng(
            position.latitude,
            position.longitude,
          );
        });

        /// 位置情報の変更を監視
        positionStream =
            Geolocator.getPositionStream(locationSettings: locationSettings)
                .listen((Position? position) {
          debugPrint(
            position == null
                ? 'Unknown'
                : '${position.latitude}, ${position.longitude}',
          );
        });

        return positionStream.cancel;
      },
      [],
    );

    return Scaffold(
      appBar: CommonAppBar(
        icon: IconButton(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.circleQuestion),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '聖地巡礼',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: AppColor.white,
                          ),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          splashRadius: 20,
                        ),
                        const SizedBox(width: 16),
                        SizedBox(
                          width: 120,
                          height: 56,
                          child: CommonButton(
                            onPressed: () {
                              context.push(AddMarkerPhotoPageRoute().location);
                            },
                            text: '聖地を追加',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Expanded(
            child: ref.watch(currentSpotProvider) == null
                ? const Loading()
                : GoogleMap(
                    onMapCreated: onMapCreated,
                    myLocationButtonEnabled: false,
                    myLocationEnabled: true,
                    initialCameraPosition: CameraPosition(
                      target: watch(currentSpotProvider) ??
                          const LatLng(
                            35.658034,
                            139.701636,
                          ),
                      zoom: 14,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
