import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_fave_app/utils/utils.dart';

abstract class FavoriteLevelingRepository {
  User? get currentUser;

  Future<List<int?>> fetchFavoriteLevelList();

  Future<void> updateFavoriteLevel(
    String favoriteId,
    LevelAlgorithm levelAlgorithm,
  );
}
