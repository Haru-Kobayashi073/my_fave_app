import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_fave_app/models/activity_data.dart';
import 'package:my_fave_app/repositories/activity/activity_repository.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'activity_repository_impl.g.dart';

@riverpod
ActivityRepositoryImpl activityRepositoryImpl(ActivityRepositoryImplRef ref) {
  return ActivityRepositoryImpl(ref);
}

class ActivityRepositoryImpl implements ActivityRepository {
  ActivityRepositoryImpl(ProviderRef<ActivityRepository> ref)
      : _auth = ref.read(getFirebaseAuthProvider),
        _firestore = ref.read(getFirebaseFirestoreProvider);

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Future<void> createActivity(ActivityData activity) async {
    final uid = _auth.currentUser!.uid;
    final id = returnUuidV4();
    await _firestore
        .collection('users')
        .doc(uid)
        .collection('activities')
        .doc(id)
        .set(
          activity
              .copyWith(
                id: id,
                createdAt: DateTime.now(),
              )
              .toJson(),
        );
  }
}
