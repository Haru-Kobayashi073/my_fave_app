// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_with_anonymously.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signInWithAnonymouslyHash() =>
    r'c172d680aa5fa852084ac42bf4818893c745f1f3';

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

/// See also [signInWithAnonymously].
@ProviderFor(signInWithAnonymously)
const signInWithAnonymouslyProvider = SignInWithAnonymouslyFamily();

/// See also [signInWithAnonymously].
class SignInWithAnonymouslyFamily extends Family<AsyncValue<void>> {
  /// See also [signInWithAnonymously].
  const SignInWithAnonymouslyFamily();

  /// See also [signInWithAnonymously].
  SignInWithAnonymouslyProvider call(
    void Function() onSuccess,
  ) {
    return SignInWithAnonymouslyProvider(
      onSuccess,
    );
  }

  @override
  SignInWithAnonymouslyProvider getProviderOverride(
    covariant SignInWithAnonymouslyProvider provider,
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
  String? get name => r'signInWithAnonymouslyProvider';
}

/// See also [signInWithAnonymously].
class SignInWithAnonymouslyProvider extends AutoDisposeFutureProvider<void> {
  /// See also [signInWithAnonymously].
  SignInWithAnonymouslyProvider(
    void Function() onSuccess,
  ) : this._internal(
          (ref) => signInWithAnonymously(
            ref as SignInWithAnonymouslyRef,
            onSuccess,
          ),
          from: signInWithAnonymouslyProvider,
          name: r'signInWithAnonymouslyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$signInWithAnonymouslyHash,
          dependencies: SignInWithAnonymouslyFamily._dependencies,
          allTransitiveDependencies:
              SignInWithAnonymouslyFamily._allTransitiveDependencies,
          onSuccess: onSuccess,
        );

  SignInWithAnonymouslyProvider._internal(
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
    FutureOr<void> Function(SignInWithAnonymouslyRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SignInWithAnonymouslyProvider._internal(
        (ref) => create(ref as SignInWithAnonymouslyRef),
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
    return _SignInWithAnonymouslyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SignInWithAnonymouslyProvider &&
        other.onSuccess == onSuccess;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, onSuccess.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SignInWithAnonymouslyRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `onSuccess` of this provider.
  void Function() get onSuccess;
}

class _SignInWithAnonymouslyProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with SignInWithAnonymouslyRef {
  _SignInWithAnonymouslyProviderElement(super.provider);

  @override
  void Function() get onSuccess =>
      (origin as SignInWithAnonymouslyProvider).onSuccess;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
