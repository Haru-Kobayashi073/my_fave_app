import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_services.g.dart';

@riverpod
FirebaseAuth getFirebaseAuth(GetFirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}

@riverpod
FirebaseFirestore getFirebaseFirestore(GetFirebaseFirestoreRef ref) {
  return FirebaseFirestore.instance;
}
