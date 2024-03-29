import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  User? get currentUser;

  Stream<User?> authStateChanges();

  Future<String?> signUp({
    required String email,
    required String password,
  });

  Future<void> signIn({
    required String email,
    required String password,
  });

  Future<void> sendPasswordResetEmail({
    required String email,
  });

  Future<void> signOut();

  Future<UserCredential> signInWithGoogle();

  Future<UserCredential> signInWithApple();

  Future<UserCredential> signInWithAnonymously();

  Future<UserCredential?> convertAnonymouslyToPermanent(
    OAuthCredential credential,
  );

  AuthCredential getAuthCredential({
    required String email,
    required String password,
  });
}
