import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  User? get currentUser;

  Future<void> createUser({
    String? userName,
    DateTime? birthDay,
    String? gender,
  });
}
