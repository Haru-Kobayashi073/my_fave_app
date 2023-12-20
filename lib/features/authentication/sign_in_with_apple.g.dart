// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_with_apple.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signInWithAppleHash() => r'44d4146c129a0193a164ff33853d3fa35c9e6e76';

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

/// See also [signInWithApple].
@ProviderFor(signInWithApple)
const signInWithAppleProvider = SignInWithAppleFamily();

/// See also [signInWithApple].
class SignInWithAppleFamily extends Family<AsyncValue<void>> {
  /// See also [signInWithApple].
  const SignInWithAppleFamily();

  /// See also [signInWithApple].
  SignInWithAppleProvider call(
    void Function() onSuccess,
  ) {
    return SignInWithAppleProvider(
      onSuccess,
    );
  }

  @override
  SignInWithAppleProvider getProviderOverride(
    covariant SignInWithAppleProvider provider,
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
  String? get name => r'signInWithAppleProvider';
}

/// See also [signInWithApple].
class SignInWithAppleProvider extends AutoDisposeFutureProvider<void> {
  /// See also [signInWithApple].
  SignInWithAppleProvider(
    void Function() onSuccess,
  ) : this._internal(
          (ref) => signInWithApple(
            ref as SignInWithAppleRef,
            onSuccess,
          ),
          from: signInWithAppleProvider,
          name: r'signInWithAppleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$signInWithAppleHash,
          dependencies: SignInWithAppleFamily._dependencies,
          allTransitiveDependencies:
              SignInWithAppleFamily._allTransitiveDependencies,
          onSuccess: onSuccess,
        );

  SignInWithAppleProvider._internal(
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
    FutureOr<void> Function(SignInWithAppleRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SignInWithAppleProvider._internal(
        (ref) => create(ref as SignInWithAppleRef),
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
    return _SignInWithAppleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SignInWithAppleProvider && other.onSuccess == onSuccess;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, onSuccess.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SignInWithAppleRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `onSuccess` of this provider.
  void Function() get onSuccess;
}

class _SignInWithAppleProviderElement
    extends AutoDisposeFutureProviderElement<void> with SignInWithAppleRef {
  _SignInWithAppleProviderElement(super.provider);

  @override
  void Function() get onSuccess =>
      (origin as SignInWithAppleProvider).onSuccess;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
