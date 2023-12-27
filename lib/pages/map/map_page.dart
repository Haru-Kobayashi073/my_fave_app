import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MapPage extends HookConsumerWidget {
  const MapPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = Completer<GoogleMapController>();

    const kGooglePlex = CameraPosition(
      target: LatLng(35.68126232447219, 139.76712479827628),
      zoom: 15,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('聖地巡礼'),
      ),
      body: Center(
        child: GoogleMap(
          initialCameraPosition: kGooglePlex,
          onMapCreated: controller.complete,
        ),
      ),
    );
  }
}
