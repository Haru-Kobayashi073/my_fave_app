import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_fave_app/models/favorite_data.dart';
import 'package:my_fave_app/repositories/favorite/favorite_repository.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_repository_impl.g.dart';

@riverpod
FavoriteRepositoryImpl favoriteRepositoryImpl(FavoriteRepositoryImplRef ref) {
  return FavoriteRepositoryImpl(ref);
}

class FavoriteRepositoryImpl implements FavoriteRepository {
  FavoriteRepositoryImpl(ProviderRef<FavoriteRepository> ref)
      : _auth = ref.read(getFirebaseAuthProvider),
        _firestore = ref.read(getFirebaseFirestoreProvider);

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Future<void> createFavorite(FavoriteData favoriteData) async {
    final uid = _auth.currentUser!.uid;
    final id = returnUuidV4();
    await _firestore
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .doc(id)
        .set(
          favoriteData
              .copyWith(
                id: id,
                createdAt: DateTime.now(),
              )
              .toJson(),
        );
  }

  @override
  Future<List<FavoriteData>> fetchFavoriteList() async {
    final uid = _auth.currentUser!.uid;
    final snapshot = await _firestore
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .orderBy('createdAt', descending: true)
        .get();
    return snapshot.docs
        .map(
          (doc) => FavoriteData.fromJson(doc.data()),
        )
        .toList();
  }

  @override
  Future<void> editFavorite(FavoriteData favoriteData) async {
    final uid = _auth.currentUser!.uid;
    await _firestore
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .doc(favoriteData.id)
        .set(
          favoriteData.toJson(),
        );
  }
}
