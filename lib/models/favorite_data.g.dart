// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavoriteDataImpl _$$FavoriteDataImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteDataImpl(
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String,
      name: json['name'] as String,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
      likingLevel: json['likingLevel'] as int?,
      numberOfLiveParticipation: json['numberOfLiveParticipation'] as int? ?? 0,
      postCount: json['postCount'] as int?,
      startedLikingDate: json['startedLikingDate'],
      fanClubId: json['fanClubId'] as String?,
      contractRenewalDateForFanClub: json['contractRenewalDateForFanClub'],
      amountUsed: json['amountUsed'] as int? ?? 0,
      link: json['link'] as String?,
      instagramLink: json['instagramLink'] as String?,
      xLink: json['xLink'] as String?,
      youtubeLink: json['youtubeLink'] as String?,
      otherlinks: (json['otherlinks'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      photosUrlList: (json['photosUrlList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$FavoriteDataImplToJson(_$FavoriteDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'createdAt': _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const DateTimeConverter().toJson),
      'likingLevel': instance.likingLevel,
      'numberOfLiveParticipation': instance.numberOfLiveParticipation,
      'postCount': instance.postCount,
      'startedLikingDate': instance.startedLikingDate,
      'fanClubId': instance.fanClubId,
      'contractRenewalDateForFanClub': instance.contractRenewalDateForFanClub,
      'amountUsed': instance.amountUsed,
      'link': instance.link,
      'instagramLink': instance.instagramLink,
      'xLink': instance.xLink,
      'youtubeLink': instance.youtubeLink,
      'otherlinks': instance.otherlinks,
      'photosUrlList': instance.photosUrlList,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
