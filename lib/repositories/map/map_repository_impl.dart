import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_fave_app/models/marker_data.dart';
import 'package:my_fave_app/repositories/map/map_repository.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_repository_impl.g.dart';

@riverpod
MapRepositoryImpl mapRepositoryImpl(MapRepositoryImplRef ref) {
  return MapRepositoryImpl(ref);
}

class MapRepositoryImpl implements MapRepository {
  MapRepositoryImpl(ProviderRef<MapRepository> ref)
      : _auth = ref.read(getFirebaseAuthProvider),
        _firestore = ref.read(getFirebaseFirestoreProvider);

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Future<void> createMarker(MarkerData marker) async {
    final uid = currentUser!.uid;
    final id = returnUuidV4();
    await _firestore
        .collection('users')
        .doc(uid)
        .collection('markers')
        .doc(id)
        .set(
          marker
              .copyWith(
                markerId: id,
                createdAt: DateTime.now(),
              )
              .toJson(),
        );
  }
}
