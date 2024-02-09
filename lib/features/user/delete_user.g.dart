// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_user.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$delteUserHash() => r'2c55818fdd22f33152637902ddbc6b26c6685a88';

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

/// See also [delteUser].
@ProviderFor(delteUser)
const delteUserProvider = DelteUserFamily();

/// See also [delteUser].
class DelteUserFamily extends Family<AsyncValue<void>> {
  /// See also [delteUser].
  const DelteUserFamily();

  /// See also [delteUser].
  DelteUserProvider call(
    void Function() onSuccess,
  ) {
    return DelteUserProvider(
      onSuccess,
    );
  }

  @override
  DelteUserProvider getProviderOverride(
    covariant DelteUserProvider provider,
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
  String? get name => r'delteUserProvider';
}

/// See also [delteUser].
class DelteUserProvider extends AutoDisposeFutureProvider<void> {
  /// See also [delteUser].
  DelteUserProvider(
    void Function() onSuccess,
  ) : this._internal(
          (ref) => delteUser(
            ref as DelteUserRef,
            onSuccess,
          ),
          from: delteUserProvider,
          name: r'delteUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$delteUserHash,
          dependencies: DelteUserFamily._dependencies,
          allTransitiveDependencies: DelteUserFamily._allTransitiveDependencies,
          onSuccess: onSuccess,
        );

  DelteUserProvider._internal(
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
    FutureOr<void> Function(DelteUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DelteUserProvider._internal(
        (ref) => create(ref as DelteUserRef),
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
    return _DelteUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DelteUserProvider && other.onSuccess == onSuccess;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, onSuccess.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DelteUserRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `onSuccess` of this provider.
  void Function() get onSuccess;
}

class _DelteUserProviderElement extends AutoDisposeFutureProviderElement<void>
    with DelteUserRef {
  _DelteUserProviderElement(super.provider);

  @override
  void Function() get onSuccess => (origin as DelteUserProvider).onSuccess;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
