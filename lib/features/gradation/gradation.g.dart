// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gradation.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gradationHash() => r'234db1767f4cfa1926cd8f132d03cd30c5295831';

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

/// See also [gradation].
@ProviderFor(gradation)
const gradationProvider = GradationFamily();

/// See also [gradation].
class GradationFamily extends Family<AsyncValue<ImageAndGradient>> {
  /// See also [gradation].
  const GradationFamily();

  /// See also [gradation].
  GradationProvider call(
    String imgUrl,
  ) {
    return GradationProvider(
      imgUrl,
    );
  }

  @override
  GradationProvider getProviderOverride(
    covariant GradationProvider provider,
  ) {
    return call(
      provider.imgUrl,
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
  String? get name => r'gradationProvider';
}

/// See also [gradation].
class GradationProvider extends AutoDisposeFutureProvider<ImageAndGradient> {
  /// See also [gradation].
  GradationProvider(
    String imgUrl,
  ) : this._internal(
          (ref) => gradation(
            ref as GradationRef,
            imgUrl,
          ),
          from: gradationProvider,
          name: r'gradationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$gradationHash,
          dependencies: GradationFamily._dependencies,
          allTransitiveDependencies: GradationFamily._allTransitiveDependencies,
          imgUrl: imgUrl,
        );

  GradationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.imgUrl,
  }) : super.internal();

  final String imgUrl;

  @override
  Override overrideWith(
    FutureOr<ImageAndGradient> Function(GradationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GradationProvider._internal(
        (ref) => create(ref as GradationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        imgUrl: imgUrl,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ImageAndGradient> createElement() {
    return _GradationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GradationProvider && other.imgUrl == imgUrl;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, imgUrl.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GradationRef on AutoDisposeFutureProviderRef<ImageAndGradient> {
  /// The parameter `imgUrl` of this provider.
  String get imgUrl;
}

class _GradationProviderElement
    extends AutoDisposeFutureProviderElement<ImageAndGradient>
    with GradationRef {
  _GradationProviderElement(super.provider);

  @override
  String get imgUrl => (origin as GradationProvider).imgUrl;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
