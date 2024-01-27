import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_fave_app/models/favorite_data.dart';
import 'package:my_fave_app/repositories/favorite_leveling/favorite_leveling_repository.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_leveling_repository_impl.g.dart';

@riverpod
FavoriteLevelingRepositoryImpl favoriteLevelingRepositoryImpl(
  FavoriteLevelingRepositoryImplRef ref,
) {
  return FavoriteLevelingRepositoryImpl(ref);
}

class FavoriteLevelingRepositoryImpl implements FavoriteLevelingRepository {
  FavoriteLevelingRepositoryImpl(ProviderRef<FavoriteLevelingRepository> ref)
      : _auth = ref.read(getFirebaseAuthProvider),
        _firestore = ref.read(getFirebaseFirestoreProvider);

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Future<List<int?>> fetchFavoriteLevelList() async {
    final uid = _auth.currentUser!.uid;
    final snapshot = await _firestore
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .get();
    final favoriteList = snapshot.docs
        .map(
          (e) => FavoriteData.fromJson(
            e.data(),
          ),
        )
        .toList();
    final favoriteLevelList = favoriteList.map((e) => e.likingLevel).toList();
    return favoriteLevelList;
  }

  @override
  Future<void> updateFavoriteLevel(
    String favoriteId,
    LevelAlgorithm levelAlgorithm,
  ) async {
    final uid = _auth.currentUser!.uid;
    await _firestore
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .doc(favoriteId)
        .update(
      {
        'likingLevel': FieldValue.increment(levelAlgorithm.point),
      },
    );
  }
}
