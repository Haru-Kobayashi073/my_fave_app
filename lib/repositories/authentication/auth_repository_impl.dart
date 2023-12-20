import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_fave_app/repositories/authentication/auth_repository.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_impl.g.dart';

@Riverpod(keepAlive: true)
AuthRepositoryImpl authRepositoryImpl(AuthRepositoryImplRef ref) {
  return AuthRepositoryImpl(ref);
}

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(ProviderRef<AuthRepository> ref)
      : _auth = ref.read(getFirebaseAuthProvider);

  final FirebaseAuth _auth;

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Stream<User?> authStateChanges() => _auth.authStateChanges();

  @override
  Future<String?> signUp({
    required String email,
    required String password,
  }) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user?.uid;
  }

  @override
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    // 認証フローのトリガー
    final googleUser = await GoogleSignIn(
      scopes: [
        'email',
      ],
    ).signIn();
    // リクエストから、認証情報を取得
    final googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return FirebaseAuth.instance.signInWithCredential(credential);
  }
}
