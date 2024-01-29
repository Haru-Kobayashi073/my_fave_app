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
  Future<List<FavoriteData>> fetchFavoriteListAsFuture() async {
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
    return favoriteList;
  }

  @override
  Future<FavoriteData> fetchFavoriteFromId(String id) async {
    final uid = _auth.currentUser!.uid;
    final snapshot = await _firestore
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .doc(id)
        .get();
    final favoriteData = FavoriteData.fromJson(
      snapshot.data()!,
    );
    return favoriteData;
  }

  @override
  Stream<QuerySnapshot> fetchFavoriteList() {
    final uid = _auth.currentUser!.uid;
    final snapshot = _firestore
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .snapshots();
    return snapshot;
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

  @override
  Future<void> addFavoritePhoto(String id, String imageUrl) async {
    final uid = _auth.currentUser!.uid;
    await _firestore
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .doc(id)
        .update(
      {
        'photosUrlList': FieldValue.arrayUnion([imageUrl]),
      },
    );
  }

  @override
  Future<void> deleteFavoritePhoto(String id, String imageUrl) async {
    final uid = _auth.currentUser!.uid;
    await _firestore
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .doc(id)
        .update(
      {
        'photosUrlList': FieldValue.arrayRemove([imageUrl]),
      },
    );
  }
}
