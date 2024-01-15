// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_out.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signOutHash() => r'd0df7f965d5827dd90c96638ec92fc6a0879f43b';

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

/// See also [signOut].
@ProviderFor(signOut)
const signOutProvider = SignOutFamily();

/// See also [signOut].
class SignOutFamily extends Family<AsyncValue<void>> {
  /// See also [signOut].
  const SignOutFamily();

  /// See also [signOut].
  SignOutProvider call(
    void Function() onSuccess,
  ) {
    return SignOutProvider(
      onSuccess,
    );
  }

  @override
  SignOutProvider getProviderOverride(
    covariant SignOutProvider provider,
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
  String? get name => r'signOutProvider';
}

/// See also [signOut].
class SignOutProvider extends AutoDisposeFutureProvider<void> {
  /// See also [signOut].
  SignOutProvider(
    void Function() onSuccess,
  ) : this._internal(
          (ref) => signOut(
            ref as SignOutRef,
            onSuccess,
          ),
          from: signOutProvider,
          name: r'signOutProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$signOutHash,
          dependencies: SignOutFamily._dependencies,
          allTransitiveDependencies: SignOutFamily._allTransitiveDependencies,
          onSuccess: onSuccess,
        );

  SignOutProvider._internal(
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
    FutureOr<void> Function(SignOutRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SignOutProvider._internal(
        (ref) => create(ref as SignOutRef),
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
    return _SignOutProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SignOutProvider && other.onSuccess == onSuccess;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, onSuccess.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SignOutRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `onSuccess` of this provider.
  void Function() get onSuccess;
}

class _SignOutProviderElement extends AutoDisposeFutureProviderElement<void>
    with SignOutRef {
  _SignOutProviderElement(super.provider);

  @override
  void Function() get onSuccess => (origin as SignOutProvider).onSuccess;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
