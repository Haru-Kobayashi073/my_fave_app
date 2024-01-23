import 'package:firebase_auth/firebase_auth.dart';

abstract class FavoriteLevelingRepository {
  User? get currentUser;

  Future<List<int?>> fetchFavoriteLevelList();
}
