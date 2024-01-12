import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_fave_app/models/marker_data.dart';
import 'package:my_fave_app/repositories/map/map_repository_impl.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'google_map_marker.g.dart';

@riverpod
class GoogleMapMarker extends _$GoogleMapMarker {
  Stream<QuerySnapshot> fetchMarkers() async* {
    final isNetWorkCheck = await isNetworkConnected();
    try {
      final response = ref.read(mapRepositoryImplProvider).fetchMarkers();
      yield* response;
    } on Exception catch (e) {
      if (!isNetWorkCheck) {
        const exception = AppException(
          message: 'Maybe your network is disconnected. Please check yours.',
        );
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

  List<Marker> generateMarkerList(
    AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
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
          ),
        )
        .toList();
    return markerList;
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
        const exception = AppException(
          message: 'Maybe your network is disconnected. Please check yours.',
        );
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
}
