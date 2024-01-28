import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_fave_app/models/favorite_data.dart';

abstract class FavoriteRepository {
  User? get currentUser;

  Future<void> createFavorite(FavoriteData favoriteData);

  Stream<QuerySnapshot> fetchFavoriteList();

  Future<List<FavoriteData>> fetchFavoriteListAsFuture();

  Future<FavoriteData> fetchFavoriteFromId(String id);

  Future<void> editFavorite(FavoriteData favoriteData);

  Future<void> addFavoritePhoto(String id, String imageUrl);

  Future<void> deleteFavoritePhoto(String id, String imageUrl);
}
