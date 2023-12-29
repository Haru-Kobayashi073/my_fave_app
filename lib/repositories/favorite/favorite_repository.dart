import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_fave_app/models/favorite_data.dart';

abstract class FavoriteRepository {
  User? get currentUser;

  Future<void> createFavorite(FavoriteData favoriteData);
}
