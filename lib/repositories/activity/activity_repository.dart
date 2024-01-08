import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_fave_app/models/activity_data.dart';

abstract class ActivityRepository {
  User? get currentUser;

  Future<void> createActivity(ActivityData activity);
}
