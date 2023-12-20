// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$createUserHash() => r'eb9ef0726b6aa2cfc7614345d2bfe40411dbf2c8';

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

/// See also [createUser].
@ProviderFor(createUser)
const createUserProvider = CreateUserFamily();

/// See also [createUser].
class CreateUserFamily extends Family<AsyncValue<void>> {
  /// See also [createUser].
  const CreateUserFamily();

  /// See also [createUser].
  CreateUserProvider call({
    String? userName,
    DateTime? birthDay,
    String? gender,
    required void Function() onSuccess,
  }) {
    return CreateUserProvider(
      userName: userName,
      birthDay: birthDay,
      gender: gender,
      onSuccess: onSuccess,
    );
  }

  @override
  CreateUserProvider getProviderOverride(
    covariant CreateUserProvider provider,
  ) {
    return call(
      userName: provider.userName,
      birthDay: provider.birthDay,
      gender: provider.gender,
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
  String? get name => r'createUserProvider';
}

/// See also [createUser].
class CreateUserProvider extends AutoDisposeFutureProvider<void> {
  /// See also [createUser].
  CreateUserProvider({
    String? userName,
    DateTime? birthDay,
    String? gender,
    required void Function() onSuccess,
  }) : this._internal(
          (ref) => createUser(
            ref as CreateUserRef,
            userName: userName,
            birthDay: birthDay,
            gender: gender,
            onSuccess: onSuccess,
          ),
          from: createUserProvider,
          name: r'createUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createUserHash,
          dependencies: CreateUserFamily._dependencies,
          allTransitiveDependencies:
              CreateUserFamily._allTransitiveDependencies,
          userName: userName,
          birthDay: birthDay,
          gender: gender,
          onSuccess: onSuccess,
        );

  CreateUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userName,
    required this.birthDay,
    required this.gender,
    required this.onSuccess,
  }) : super.internal();

  final String? userName;
  final DateTime? birthDay;
  final String? gender;
  final void Function() onSuccess;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateUserProvider._internal(
        (ref) => create(ref as CreateUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userName: userName,
        birthDay: birthDay,
        gender: gender,
        onSuccess: onSuccess,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreateUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateUserProvider &&
        other.userName == userName &&
        other.birthDay == birthDay &&
        other.gender == gender &&
        other.onSuccess == onSuccess;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userName.hashCode);
    hash = _SystemHash.combine(hash, birthDay.hashCode);
    hash = _SystemHash.combine(hash, gender.hashCode);
    hash = _SystemHash.combine(hash, onSuccess.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateUserRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `userName` of this provider.
  String? get userName;

  /// The parameter `birthDay` of this provider.
  DateTime? get birthDay;

  /// The parameter `gender` of this provider.
  String? get gender;

  /// The parameter `onSuccess` of this provider.
  void Function() get onSuccess;
}

class _CreateUserProviderElement extends AutoDisposeFutureProviderElement<void>
    with CreateUserRef {
  _CreateUserProviderElement(super.provider);

  @override
  String? get userName => (origin as CreateUserProvider).userName;
  @override
  DateTime? get birthDay => (origin as CreateUserProvider).birthDay;
  @override
  String? get gender => (origin as CreateUserProvider).gender;
  @override
  void Function() get onSuccess => (origin as CreateUserProvider).onSuccess;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
