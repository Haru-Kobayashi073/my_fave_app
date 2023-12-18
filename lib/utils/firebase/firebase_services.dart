import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_services.g.dart';

@riverpod
FirebaseAuth getFirebaseAuth(GetFirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}
