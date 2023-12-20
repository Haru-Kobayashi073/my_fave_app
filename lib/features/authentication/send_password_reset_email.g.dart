// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_password_reset_email.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendPasswordResetEmailHash() =>
    r'4a8a443d77f147a3996c3fcefc4b3a571a7fe7ee';

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

/// See also [sendPasswordResetEmail].
@ProviderFor(sendPasswordResetEmail)
const sendPasswordResetEmailProvider = SendPasswordResetEmailFamily();

/// See also [sendPasswordResetEmail].
class SendPasswordResetEmailFamily extends Family<AsyncValue<void>> {
  /// See also [sendPasswordResetEmail].
  const SendPasswordResetEmailFamily();

  /// See also [sendPasswordResetEmail].
  SendPasswordResetEmailProvider call({
    required String email,
    required void Function() onSuccess,
  }) {
    return SendPasswordResetEmailProvider(
      email: email,
      onSuccess: onSuccess,
    );
  }

  @override
  SendPasswordResetEmailProvider getProviderOverride(
    covariant SendPasswordResetEmailProvider provider,
  ) {
    return call(
      email: provider.email,
      onSuccess: provider.onSuccess,
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
  String? get name => r'sendPasswordResetEmailProvider';
}

/// See also [sendPasswordResetEmail].
class SendPasswordResetEmailProvider extends AutoDisposeFutureProvider<void> {
  /// See also [sendPasswordResetEmail].
  SendPasswordResetEmailProvider({
    required String email,
    required void Function() onSuccess,
  }) : this._internal(
          (ref) => sendPasswordResetEmail(
            ref as SendPasswordResetEmailRef,
            email: email,
            onSuccess: onSuccess,
          ),
          from: sendPasswordResetEmailProvider,
          name: r'sendPasswordResetEmailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendPasswordResetEmailHash,
          dependencies: SendPasswordResetEmailFamily._dependencies,
          allTransitiveDependencies:
              SendPasswordResetEmailFamily._allTransitiveDependencies,
          email: email,
          onSuccess: onSuccess,
        );

  SendPasswordResetEmailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
    required this.onSuccess,
  }) : super.internal();

  final String email;
  final void Function() onSuccess;

  @override
  Override overrideWith(
    FutureOr<void> Function(SendPasswordResetEmailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendPasswordResetEmailProvider._internal(
        (ref) => create(ref as SendPasswordResetEmailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
        onSuccess: onSuccess,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SendPasswordResetEmailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendPasswordResetEmailProvider &&
        other.email == email &&
        other.onSuccess == onSuccess;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, onSuccess.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendPasswordResetEmailRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `onSuccess` of this provider.
  void Function() get onSuccess;
}

class _SendPasswordResetEmailProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with SendPasswordResetEmailRef {
  _SendPasswordResetEmailProviderElement(super.provider);

  @override
  String get email => (origin as SendPasswordResetEmailProvider).email;
  @override
  void Function() get onSuccess =>
      (origin as SendPasswordResetEmailProvider).onSuccess;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
