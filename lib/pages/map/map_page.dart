import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/google_map_marker/google_map_marker.dart';
import 'package:my_fave_app/pages/map/components/map_components.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

final mapControllerProvider =
    StateProvider<GoogleMapController?>((ref) => null);

final currentSpotProvider = StateProvider<LatLng?>((ref) => null);

final isOpenedTouchedMarkerModalProvider = StateProvider<bool>((ref) => false);

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

    final googleMapMarkerNotifier = ref.watch(googleMapMarkerProvider.notifier);
    final isOpenedPanel = useState(false);

    return Scaffold(
      appBar: CommonAppBar(
        icon: IconButton(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.circleQuestion),
        ),
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder(
        stream: googleMapMarkerNotifier.fetchMarkers(),
        builder: (context, markers) {
          if (markers.hasError) {
            return const Center(
              child: Text('エラーが発生しました'),
            );
          }
          if (markers.connectionState == ConnectionState.waiting &&
              !markers.hasData) {
            return const Loading();
          }

          final (markerList, markerDataList) =
              googleMapMarkerNotifier.generateMarkerList(
            markers,
            context,
          );

          return SlidingUpPanel(
            color: AppColor.black00.withOpacity(0.2),
            boxShadow: const [],
            borderRadius: isOpenedPanel.value
                ? null
                : const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
            maxHeight: context.deviceHeight - 114 - 114 - 72,
            minHeight: 72,
            onPanelSlide: (value) {
              if (value == 1) {
                isOpenedPanel.value = true;
              } else if (value == 0) {
                isOpenedPanel.value = false;
              } else {
                ref.read(isOpenedTouchedMarkerModalProvider.notifier).state =
                    false;
              }
            },
            body: ref.watch(currentSpotProvider) == null
                ? const Loading()
                : Stack(
                    children: [
                      GoogleMap(
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
                        markers: markerList.toSet(),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          color: AppColor.black00,
                          width: context.deviceWidth,
                          height: 72,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            context.push(
                                              AddMarkerInformationPageRoute()
                                                  .location,
                                            );
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
                      ),
                      if (ref.watch(isOpenedTouchedMarkerModalProvider))
                        Positioned(
                          bottom: 300,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: Stack(
                              alignment: const Alignment(1.06, -1.2),
                              children: [
                                MarkerModal(markerData: markerDataList[0]),
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
                                      ref
                                          .read(
                                            isOpenedTouchedMarkerModalProvider
                                                .notifier,
                                          )
                                          .state = false;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
            panel: ClipRRect(
              child: SizedBox(
                width: context.deviceWidth,
                height: context.deviceHeight * 0.6,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 56,
                            height: 4,
                            margin: const EdgeInsets.only(top: 20, bottom: 8),
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        Text(
                          '聖地巡礼地${markerList.length}件',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: CustomScrollView(
                            slivers: [
                              SliverList.builder(
                                itemCount: markerList.length,
                                itemBuilder: (context, index) {
                                  return MarkerModal(
                                    markerData: markerDataList[index],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            collapsed: Container(
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
