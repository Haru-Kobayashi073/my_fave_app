import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_fave_app/models/marker_data.dart';

abstract class MapRepository {
  User? get currentUser;

  Future<void> createMarker(MarkerData marker);

  Stream<QuerySnapshot> fetchMarkers();

  Future<void> editMarker(MarkerData marker);

  Future<void> deleteMarker(MarkerData marker);
}
