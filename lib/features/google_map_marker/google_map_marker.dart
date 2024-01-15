import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_fave_app/models/marker_data.dart';
import 'package:my_fave_app/pages/map/map_page.dart';
import 'package:my_fave_app/repositories/map/map_repository_impl.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'google_map_marker.g.dart';

enum MarkerOption {
  edit(title: '編集'),
  delete(title: '削除');

  const MarkerOption({
    required this.title,
  });

  final String title;
}

@riverpod
class GoogleMapMarker extends _$GoogleMapMarker {
  AppException get exception => const AppException(
        message: 'Maybe your network is disconnected. Please check yours.',
      );

  Stream<QuerySnapshot> fetchMarkers() async* {
    final isNetWorkCheck = await isNetworkConnected();
    try {
      final response = ref.read(mapRepositoryImplProvider).fetchMarkers();
      yield* response;
    } on Exception catch (e) {
      if (!isNetWorkCheck) {
        throw exception;
      }
      debugPrint('マーカーの取得エラー: $e');
      ref
          .read(scaffoldMessengerServiceProvider)
          .showExceptionSnackBar('マーカーの取得に失敗しました');
    }
  }

  @override
  FutureOr<void> build() {
    return null;
  }

  (List<Marker>, List<MarkerData>) generateMarkerList(
    AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
    BuildContext context,
  ) {
    final markerDataList = snapshot.data!.docs
        .map(
          (doc) => MarkerData.fromJson(doc.data()! as Map<String, dynamic>),
        )
        .toList();
    final markerList = markerDataList
        .map(
          (markerData) => Marker(
            markerId: MarkerId(markerData.markerId),
            position: LatLng(
              markerData.latitude,
              markerData.longitude,
            ),
            infoWindow: InfoWindow(
              title: markerData.title,
            ),
            consumeTapEvents: true,
            onTap: () {
              ref.read(isOpenedTouchedMarkerModalProvider.notifier).state =
                  true;
            },
          ),
        )
        .toList();
    return (markerList, markerDataList);
  }

  Future<void> create(
    MarkerData markerData,
    VoidCallback onSuccess,
  ) async {
    final isNetWorkCheck = await isNetworkConnected();
    try {
      ref.read(overlayLoadingWidgetProvider.notifier).update((state) => true);
      await ref.read(mapRepositoryImplProvider).createMarker(markerData);
      onSuccess();
    } on Exception catch (e) {
      if (!isNetWorkCheck) {
        throw exception;
      }
      debugPrint('マーカー作成エラー: $e');
      ref
          .read(scaffoldMessengerServiceProvider)
          .showExceptionSnackBar('マーカー作成に失敗しました');
    } finally {
      ref.read(overlayLoadingWidgetProvider.notifier).update((state) => false);
    }
  }

  Future<void> edit(
    MarkerData markerData,
    VoidCallback onSuccess,
  ) async {
    final isNetWorkCheck = await isNetworkConnected();
    try {
      ref.read(overlayLoadingWidgetProvider.notifier).update((state) => true);
      await ref.read(mapRepositoryImplProvider).editMarker(markerData);
      onSuccess();
    } on Exception catch (e) {
      if (!isNetWorkCheck) {
        throw exception;
      }
      debugPrint('マーカー編集エラー: $e');
      ref
          .read(scaffoldMessengerServiceProvider)
          .showExceptionSnackBar('マーカー編集に失敗しました');
    } finally {
      ref.read(overlayLoadingWidgetProvider.notifier).update((state) => false);
    }
  }

  Future<void> delete(
    MarkerData markerData,
    VoidCallback onSuccess,
  ) async {
    final isNetWorkCheck = await isNetworkConnected();
    try {
      ref.read(overlayLoadingWidgetProvider.notifier).update((state) => true);
      await ref.read(mapRepositoryImplProvider).deleteMarker(markerData);
      onSuccess();
    } on Exception catch (e) {
      if (!isNetWorkCheck) {
        throw exception;
      }
      debugPrint('マーカー削除エラー: $e');
      ref
          .read(scaffoldMessengerServiceProvider)
          .showExceptionSnackBar('マーカー削除に失敗しました');
    } finally {
      ref.read(overlayLoadingWidgetProvider.notifier).update((state) => false);
    }
  }
}
