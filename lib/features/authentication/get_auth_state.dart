import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_fave_app/repositories/authentication/auth_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_auth_state.g.dart';

@riverpod
Stream<User?> getAuthState(GetAuthStateRef ref) =>
    ref.watch(authRepositoryImplProvider).authStateChanges();
