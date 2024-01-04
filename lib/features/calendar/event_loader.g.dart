// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_loader.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cacheEventsHash() => r'71c6cf3a44a4be3fe6bcfc09528153e7ba6a6520';

/// See also [cacheEvents].
@ProviderFor(cacheEvents)
final cacheEventsProvider = Provider<List<DailySchedule>>.internal(
  cacheEvents,
  name: r'cacheEventsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cacheEventsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CacheEventsRef = ProviderRef<List<DailySchedule>>;
String _$eventLoaderHash() => r'aa31d20ba3f1e815802cfb05f0e2832c8b054a82';

/// See also [EventLoader].
@ProviderFor(EventLoader)
final eventLoaderProvider = AsyncNotifierProvider<EventLoader,
    Map<DateTime, List<DailySchedule>>>.internal(
  EventLoader.new,
  name: r'eventLoaderProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$eventLoaderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EventLoader = AsyncNotifier<Map<DateTime, List<DailySchedule>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member