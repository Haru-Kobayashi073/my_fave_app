import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_fave_app/models/user_data.dart';
import 'package:my_fave_app/repositories/user/user_repository.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository_impl.g.dart';

@Riverpod(keepAlive: true)
UserRepositoryImpl userRepositoryImpl(UserRepositoryImplRef ref) {
  return UserRepositoryImpl(ref);
}

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(ProviderRef<UserRepository> ref)
      : _auth = ref.read(getFirebaseAuthProvider),
        _firestore = ref.read(getFirebaseFirestoreProvider);

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Future<void> createUser({
    String? userName,
  }) async {
    final uid = _auth.currentUser!.uid;
    final createdAt = Timestamp.fromDate(DateTime.now());
    await _firestore.collection('users').doc(uid).set(
          UserData(
            uid: uid,
            userName: userName,
            createdAt: createdAt,
          ).toJson(),
        );
  }

  @override
  Future<void> deleteUser() async {
    final uid = currentUser?.uid;
    final deleteUserData = {
      'uid': uid,
      'createdAt': Timestamp.now(),
    };
    await _firestore.collection('delete_users').doc(uid).set(deleteUserData);
  }
}
