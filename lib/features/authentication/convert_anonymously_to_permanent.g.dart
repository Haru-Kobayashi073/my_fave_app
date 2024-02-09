// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'convert_anonymously_to_permanent.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$convertAnonymouslyToPermanentHash() =>
    r'8eecbf19bcce07972ea9555b6aaa43e0919c1be7';

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

/// See also [convertAnonymouslyToPermanent].
@ProviderFor(convertAnonymouslyToPermanent)
const convertAnonymouslyToPermanentProvider =
    ConvertAnonymouslyToPermanentFamily();

/// See also [convertAnonymouslyToPermanent].
class ConvertAnonymouslyToPermanentFamily extends Family<AsyncValue<void>> {
  /// See also [convertAnonymouslyToPermanent].
  const ConvertAnonymouslyToPermanentFamily();

  /// See also [convertAnonymouslyToPermanent].
  ConvertAnonymouslyToPermanentProvider call(
    AuthCredential credential,
    void Function() onSuccess,
  ) {
    return ConvertAnonymouslyToPermanentProvider(
      credential,
      onSuccess,
    );
  }

  @override
  ConvertAnonymouslyToPermanentProvider getProviderOverride(
    covariant ConvertAnonymouslyToPermanentProvider provider,
  ) {
    return call(
      provider.credential,
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
  String? get name => r'convertAnonymouslyToPermanentProvider';
}

/// See also [convertAnonymouslyToPermanent].
class ConvertAnonymouslyToPermanentProvider
    extends AutoDisposeFutureProvider<void> {
  /// See also [convertAnonymouslyToPermanent].
  ConvertAnonymouslyToPermanentProvider(
    AuthCredential credential,
    void Function() onSuccess,
  ) : this._internal(
          (ref) => convertAnonymouslyToPermanent(
            ref as ConvertAnonymouslyToPermanentRef,
            credential,
            onSuccess,
          ),
          from: convertAnonymouslyToPermanentProvider,
          name: r'convertAnonymouslyToPermanentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$convertAnonymouslyToPermanentHash,
          dependencies: ConvertAnonymouslyToPermanentFamily._dependencies,
          allTransitiveDependencies:
              ConvertAnonymouslyToPermanentFamily._allTransitiveDependencies,
          credential: credential,
          onSuccess: onSuccess,
        );

  ConvertAnonymouslyToPermanentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.credential,
    required this.onSuccess,
  }) : super.internal();

  final AuthCredential credential;
  final void Function() onSuccess;

  @override
  Override overrideWith(
    FutureOr<void> Function(ConvertAnonymouslyToPermanentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConvertAnonymouslyToPermanentProvider._internal(
        (ref) => create(ref as ConvertAnonymouslyToPermanentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        credential: credential,
        onSuccess: onSuccess,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ConvertAnonymouslyToPermanentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConvertAnonymouslyToPermanentProvider &&
        other.credential == credential &&
        other.onSuccess == onSuccess;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, credential.hashCode);
    hash = _SystemHash.combine(hash, onSuccess.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ConvertAnonymouslyToPermanentRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `credential` of this provider.
  AuthCredential get credential;

  /// The parameter `onSuccess` of this provider.
  void Function() get onSuccess;
}

class _ConvertAnonymouslyToPermanentProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with ConvertAnonymouslyToPermanentRef {
  _ConvertAnonymouslyToPermanentProviderElement(super.provider);

  @override
  AuthCredential get credential =>
      (origin as ConvertAnonymouslyToPermanentProvider).credential;
  @override
  void Function() get onSuccess =>
      (origin as ConvertAnonymouslyToPermanentProvider).onSuccess;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
