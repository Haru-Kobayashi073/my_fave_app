// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FavoriteData _$FavoriteDataFromJson(Map<String, dynamic> json) {
  return _FavoriteData.fromJson(json);
}

/// @nodoc
mixin _$FavoriteData {
  String get id => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  int? get likingLevel => throw _privateConstructorUsedError;
  int get numberOfLiveParticipation => throw _privateConstructorUsedError;
  int get postCount => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get startedLikingDate => throw _privateConstructorUsedError;
  String? get fanClubId => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get contractRenewalDateForFanClub =>
      throw _privateConstructorUsedError;
  int get amountUsed => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get favoriteBirthDay => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;
  String? get instagramLink => throw _privateConstructorUsedError;
  String? get xLink => throw _privateConstructorUsedError;
  String? get youtubeLink => throw _privateConstructorUsedError;
  List<String>? get otherlinks => throw _privateConstructorUsedError;
  List<String>? get photosUrlList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteDataCopyWith<FavoriteData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteDataCopyWith<$Res> {
  factory $FavoriteDataCopyWith(
          FavoriteData value, $Res Function(FavoriteData) then) =
      _$FavoriteDataCopyWithImpl<$Res, FavoriteData>;
  @useResult
  $Res call(
      {String id,
      String imageUrl,
      String name,
      @DateTimeConverter() DateTime? createdAt,
      int? likingLevel,
      int numberOfLiveParticipation,
      int postCount,
      @DateTimeConverter() DateTime startedLikingDate,
      String? fanClubId,
      @DateTimeConverter() DateTime? contractRenewalDateForFanClub,
      int amountUsed,
      @DateTimeConverter() DateTime? favoriteBirthDay,
      String? link,
      String? instagramLink,
      String? xLink,
      String? youtubeLink,
      List<String>? otherlinks,
      List<String>? photosUrlList});
}

/// @nodoc
class _$FavoriteDataCopyWithImpl<$Res, $Val extends FavoriteData>
    implements $FavoriteDataCopyWith<$Res> {
  _$FavoriteDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? name = null,
    Object? createdAt = freezed,
    Object? likingLevel = freezed,
    Object? numberOfLiveParticipation = null,
    Object? postCount = null,
    Object? startedLikingDate = null,
    Object? fanClubId = freezed,
    Object? contractRenewalDateForFanClub = freezed,
    Object? amountUsed = null,
    Object? favoriteBirthDay = freezed,
    Object? link = freezed,
    Object? instagramLink = freezed,
    Object? xLink = freezed,
    Object? youtubeLink = freezed,
    Object? otherlinks = freezed,
    Object? photosUrlList = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      likingLevel: freezed == likingLevel
          ? _value.likingLevel
          : likingLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      numberOfLiveParticipation: null == numberOfLiveParticipation
          ? _value.numberOfLiveParticipation
          : numberOfLiveParticipation // ignore: cast_nullable_to_non_nullable
              as int,
      postCount: null == postCount
          ? _value.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as int,
      startedLikingDate: null == startedLikingDate
          ? _value.startedLikingDate
          : startedLikingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fanClubId: freezed == fanClubId
          ? _value.fanClubId
          : fanClubId // ignore: cast_nullable_to_non_nullable
              as String?,
      contractRenewalDateForFanClub: freezed == contractRenewalDateForFanClub
          ? _value.contractRenewalDateForFanClub
          : contractRenewalDateForFanClub // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      amountUsed: null == amountUsed
          ? _value.amountUsed
          : amountUsed // ignore: cast_nullable_to_non_nullable
              as int,
      favoriteBirthDay: freezed == favoriteBirthDay
          ? _value.favoriteBirthDay
          : favoriteBirthDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      instagramLink: freezed == instagramLink
          ? _value.instagramLink
          : instagramLink // ignore: cast_nullable_to_non_nullable
              as String?,
      xLink: freezed == xLink
          ? _value.xLink
          : xLink // ignore: cast_nullable_to_non_nullable
              as String?,
      youtubeLink: freezed == youtubeLink
          ? _value.youtubeLink
          : youtubeLink // ignore: cast_nullable_to_non_nullable
              as String?,
      otherlinks: freezed == otherlinks
          ? _value.otherlinks
          : otherlinks // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      photosUrlList: freezed == photosUrlList
          ? _value.photosUrlList
          : photosUrlList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteDataImplCopyWith<$Res>
    implements $FavoriteDataCopyWith<$Res> {
  factory _$$FavoriteDataImplCopyWith(
          _$FavoriteDataImpl value, $Res Function(_$FavoriteDataImpl) then) =
      __$$FavoriteDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String imageUrl,
      String name,
      @DateTimeConverter() DateTime? createdAt,
      int? likingLevel,
      int numberOfLiveParticipation,
      int postCount,
      @DateTimeConverter() DateTime startedLikingDate,
      String? fanClubId,
      @DateTimeConverter() DateTime? contractRenewalDateForFanClub,
      int amountUsed,
      @DateTimeConverter() DateTime? favoriteBirthDay,
      String? link,
      String? instagramLink,
      String? xLink,
      String? youtubeLink,
      List<String>? otherlinks,
      List<String>? photosUrlList});
}

/// @nodoc
class __$$FavoriteDataImplCopyWithImpl<$Res>
    extends _$FavoriteDataCopyWithImpl<$Res, _$FavoriteDataImpl>
    implements _$$FavoriteDataImplCopyWith<$Res> {
  __$$FavoriteDataImplCopyWithImpl(
      _$FavoriteDataImpl _value, $Res Function(_$FavoriteDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? name = null,
    Object? createdAt = freezed,
    Object? likingLevel = freezed,
    Object? numberOfLiveParticipation = null,
    Object? postCount = null,
    Object? startedLikingDate = null,
    Object? fanClubId = freezed,
    Object? contractRenewalDateForFanClub = freezed,
    Object? amountUsed = null,
    Object? favoriteBirthDay = freezed,
    Object? link = freezed,
    Object? instagramLink = freezed,
    Object? xLink = freezed,
    Object? youtubeLink = freezed,
    Object? otherlinks = freezed,
    Object? photosUrlList = freezed,
  }) {
    return _then(_$FavoriteDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      likingLevel: freezed == likingLevel
          ? _value.likingLevel
          : likingLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      numberOfLiveParticipation: null == numberOfLiveParticipation
          ? _value.numberOfLiveParticipation
          : numberOfLiveParticipation // ignore: cast_nullable_to_non_nullable
              as int,
      postCount: null == postCount
          ? _value.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as int,
      startedLikingDate: null == startedLikingDate
          ? _value.startedLikingDate
          : startedLikingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fanClubId: freezed == fanClubId
          ? _value.fanClubId
          : fanClubId // ignore: cast_nullable_to_non_nullable
              as String?,
      contractRenewalDateForFanClub: freezed == contractRenewalDateForFanClub
          ? _value.contractRenewalDateForFanClub
          : contractRenewalDateForFanClub // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      amountUsed: null == amountUsed
          ? _value.amountUsed
          : amountUsed // ignore: cast_nullable_to_non_nullable
              as int,
      favoriteBirthDay: freezed == favoriteBirthDay
          ? _value.favoriteBirthDay
          : favoriteBirthDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      instagramLink: freezed == instagramLink
          ? _value.instagramLink
          : instagramLink // ignore: cast_nullable_to_non_nullable
              as String?,
      xLink: freezed == xLink
          ? _value.xLink
          : xLink // ignore: cast_nullable_to_non_nullable
              as String?,
      youtubeLink: freezed == youtubeLink
          ? _value.youtubeLink
          : youtubeLink // ignore: cast_nullable_to_non_nullable
              as String?,
      otherlinks: freezed == otherlinks
          ? _value._otherlinks
          : otherlinks // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      photosUrlList: freezed == photosUrlList
          ? _value._photosUrlList
          : photosUrlList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoriteDataImpl implements _FavoriteData {
  const _$FavoriteDataImpl(
      {required this.id,
      required this.imageUrl,
      required this.name,
      @DateTimeConverter() this.createdAt,
      this.likingLevel,
      this.numberOfLiveParticipation = 0,
      this.postCount = 0,
      @DateTimeConverter() required this.startedLikingDate,
      this.fanClubId,
      @DateTimeConverter() this.contractRenewalDateForFanClub,
      this.amountUsed = 0,
      @DateTimeConverter() this.favoriteBirthDay,
      this.link,
      this.instagramLink,
      this.xLink,
      this.youtubeLink,
      final List<String>? otherlinks,
      final List<String>? photosUrlList})
      : _otherlinks = otherlinks,
        _photosUrlList = photosUrlList;

  factory _$FavoriteDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteDataImplFromJson(json);

  @override
  final String id;
  @override
  final String imageUrl;
  @override
  final String name;
  @override
  @DateTimeConverter()
  final DateTime? createdAt;
  @override
  final int? likingLevel;
  @override
  @JsonKey()
  final int numberOfLiveParticipation;
  @override
  @JsonKey()
  final int postCount;
  @override
  @DateTimeConverter()
  final DateTime startedLikingDate;
  @override
  final String? fanClubId;
  @override
  @DateTimeConverter()
  final DateTime? contractRenewalDateForFanClub;
  @override
  @JsonKey()
  final int amountUsed;
  @override
  @DateTimeConverter()
  final DateTime? favoriteBirthDay;
  @override
  final String? link;
  @override
  final String? instagramLink;
  @override
  final String? xLink;
  @override
  final String? youtubeLink;
  final List<String>? _otherlinks;
  @override
  List<String>? get otherlinks {
    final value = _otherlinks;
    if (value == null) return null;
    if (_otherlinks is EqualUnmodifiableListView) return _otherlinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _photosUrlList;
  @override
  List<String>? get photosUrlList {
    final value = _photosUrlList;
    if (value == null) return null;
    if (_photosUrlList is EqualUnmodifiableListView) return _photosUrlList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FavoriteData(id: $id, imageUrl: $imageUrl, name: $name, createdAt: $createdAt, likingLevel: $likingLevel, numberOfLiveParticipation: $numberOfLiveParticipation, postCount: $postCount, startedLikingDate: $startedLikingDate, fanClubId: $fanClubId, contractRenewalDateForFanClub: $contractRenewalDateForFanClub, amountUsed: $amountUsed, favoriteBirthDay: $favoriteBirthDay, link: $link, instagramLink: $instagramLink, xLink: $xLink, youtubeLink: $youtubeLink, otherlinks: $otherlinks, photosUrlList: $photosUrlList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.likingLevel, likingLevel) ||
                other.likingLevel == likingLevel) &&
            (identical(other.numberOfLiveParticipation,
                    numberOfLiveParticipation) ||
                other.numberOfLiveParticipation == numberOfLiveParticipation) &&
            (identical(other.postCount, postCount) ||
                other.postCount == postCount) &&
            (identical(other.startedLikingDate, startedLikingDate) ||
                other.startedLikingDate == startedLikingDate) &&
            (identical(other.fanClubId, fanClubId) ||
                other.fanClubId == fanClubId) &&
            (identical(other.contractRenewalDateForFanClub,
                    contractRenewalDateForFanClub) ||
                other.contractRenewalDateForFanClub ==
                    contractRenewalDateForFanClub) &&
            (identical(other.amountUsed, amountUsed) ||
                other.amountUsed == amountUsed) &&
            (identical(other.favoriteBirthDay, favoriteBirthDay) ||
                other.favoriteBirthDay == favoriteBirthDay) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.instagramLink, instagramLink) ||
                other.instagramLink == instagramLink) &&
            (identical(other.xLink, xLink) || other.xLink == xLink) &&
            (identical(other.youtubeLink, youtubeLink) ||
                other.youtubeLink == youtubeLink) &&
            const DeepCollectionEquality()
                .equals(other._otherlinks, _otherlinks) &&
            const DeepCollectionEquality()
                .equals(other._photosUrlList, _photosUrlList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      imageUrl,
      name,
      createdAt,
      likingLevel,
      numberOfLiveParticipation,
      postCount,
      startedLikingDate,
      fanClubId,
      contractRenewalDateForFanClub,
      amountUsed,
      favoriteBirthDay,
      link,
      instagramLink,
      xLink,
      youtubeLink,
      const DeepCollectionEquality().hash(_otherlinks),
      const DeepCollectionEquality().hash(_photosUrlList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteDataImplCopyWith<_$FavoriteDataImpl> get copyWith =>
      __$$FavoriteDataImplCopyWithImpl<_$FavoriteDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteDataImplToJson(
      this,
    );
  }
}

abstract class _FavoriteData implements FavoriteData {
  const factory _FavoriteData(
      {required final String id,
      required final String imageUrl,
      required final String name,
      @DateTimeConverter() final DateTime? createdAt,
      final int? likingLevel,
      final int numberOfLiveParticipation,
      final int postCount,
      @DateTimeConverter() required final DateTime startedLikingDate,
      final String? fanClubId,
      @DateTimeConverter() final DateTime? contractRenewalDateForFanClub,
      final int amountUsed,
      @DateTimeConverter() final DateTime? favoriteBirthDay,
      final String? link,
      final String? instagramLink,
      final String? xLink,
      final String? youtubeLink,
      final List<String>? otherlinks,
      final List<String>? photosUrlList}) = _$FavoriteDataImpl;

  factory _FavoriteData.fromJson(Map<String, dynamic> json) =
      _$FavoriteDataImpl.fromJson;

  @override
  String get id;
  @override
  String get imageUrl;
  @override
  String get name;
  @override
  @DateTimeConverter()
  DateTime? get createdAt;
  @override
  int? get likingLevel;
  @override
  int get numberOfLiveParticipation;
  @override
  int get postCount;
  @override
  @DateTimeConverter()
  DateTime get startedLikingDate;
  @override
  String? get fanClubId;
  @override
  @DateTimeConverter()
  DateTime? get contractRenewalDateForFanClub;
  @override
  int get amountUsed;
  @override
  @DateTimeConverter()
  DateTime? get favoriteBirthDay;
  @override
  String? get link;
  @override
  String? get instagramLink;
  @override
  String? get xLink;
  @override
  String? get youtubeLink;
  @override
  List<String>? get otherlinks;
  @override
  List<String>? get photosUrlList;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteDataImplCopyWith<_$FavoriteDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
