import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/favorite_leveling/favorite_leveling.dart';
import 'package:my_fave_app/pages/map/map_page.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class MapView extends HookConsumerWidget {
  const MapView({super.key, required this.markerList});
  final List<Marker> markerList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late StreamSubscription<Position> positionStream;
    late Position position;
    final watch = ref.watch;
    final isAlreadyLiberating = useState<bool?>(null);

    /// 画面上のGoogleMapを制御
    void onMapCreated(GoogleMapController controller) {
      watch(mapControllerProvider.notifier).state = controller;
    }

    Future<bool> isLiberating() async {
      final favoriteLevelingNotifier =
          ref.read(favoriteLevelingProvider.notifier);
      final favoriteLevels =
          await favoriteLevelingNotifier.fetchFavoriteLevelList();
      if (favoriteLevels.isNotEmpty) {
        final calculateLevels = favoriteLevels
            .map(favoriteLevelingNotifier.calculateLevel)
            .toList();
        for (final number in calculateLevels) {
          if (number >= 1) {
            return true; // レベル1以上が見つかった場合、trueを返す
          }
        }
        return false;
      }
      return false;
    }

    const locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      isAlreadyLiberating.value = await isLiberating();
    });

    useEffect(
      () {
        Future(() async {
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
          SizedBox(
            height: 280,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: GoogleMap(
                    onMapCreated: onMapCreated,
                    myLocationButtonEnabled: false,
                    myLocationEnabled: true,
                    initialCameraPosition: CameraPosition(
                      target: ref.watch(currentSpotProvider) ??
                          const LatLng(
                            35.658034,
                            139.701636,
                          ),
                      zoom: 14,
                    ),
                    markers: markerList.toSet(),
                  ),
                ),
                isAlreadyLiberating.value != null
                    ? !isAlreadyLiberating.value!
                        ? Container(
                            alignment: Alignment.center,
                            width: context.deviceWidth,
                            height: context.deviceHeight,
                            color: AppColor.black00.withOpacity(0.8),
                            child: const Text(
                              '推し度\nレベル1以上解放',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : const SizedBox()
                    : const Loading(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
