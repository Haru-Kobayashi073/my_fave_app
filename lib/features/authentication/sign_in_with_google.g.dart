// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_with_google.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signInWithGoogleHash() => r'2b7217608ba71f8f478dd6c91653567097801e84';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [signInWithGoogle].
@ProviderFor(signInWithGoogle)
const signInWithGoogleProvider = SignInWithGoogleFamily();

/// See also [signInWithGoogle].
class SignInWithGoogleFamily extends Family<AsyncValue<void>> {
  /// See also [signInWithGoogle].
  const SignInWithGoogleFamily();

  /// See also [signInWithGoogle].
  SignInWithGoogleProvider call(
    void Function() onSuccess,
  ) {
    return SignInWithGoogleProvider(
      onSuccess,
    );
  }

  @override
  SignInWithGoogleProvider getProviderOverride(
    covariant SignInWithGoogleProvider provider,
  ) {
    return call(
      provider.onSuccess,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'signInWithGoogleProvider';
}

/// See also [signInWithGoogle].
class SignInWithGoogleProvider extends AutoDisposeFutureProvider<void> {
  /// See also [signInWithGoogle].
  SignInWithGoogleProvider(
    void Function() onSuccess,
  ) : this._internal(
          (ref) => signInWithGoogle(
            ref as SignInWithGoogleRef,
            onSuccess,
          ),
          from: signInWithGoogleProvider,
          name: r'signInWithGoogleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$signInWithGoogleHash,
          dependencies: SignInWithGoogleFamily._dependencies,
          allTransitiveDependencies:
              SignInWithGoogleFamily._allTransitiveDependencies,
          onSuccess: onSuccess,
        );

  SignInWithGoogleProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.onSuccess,
  }) : super.internal();

  final void Function() onSuccess;

  @override
  Override overrideWith(
    FutureOr<void> Function(SignInWithGoogleRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SignInWithGoogleProvider._internal(
        (ref) => create(ref as SignInWithGoogleRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        onSuccess: onSuccess,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SignInWithGoogleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SignInWithGoogleProvider && other.onSuccess == onSuccess;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, onSuccess.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SignInWithGoogleRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `onSuccess` of this provider.
  void Function() get onSuccess;
}

class _SignInWithGoogleProviderElement
    extends AutoDisposeFutureProviderElement<void> with SignInWithGoogleRef {
  _SignInWithGoogleProviderElement(super.provider);

  @override
  void Function() get onSuccess =>
      (origin as SignInWithGoogleProvider).onSuccess;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
