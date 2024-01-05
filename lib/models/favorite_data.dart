import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_fave_app/utils/date_time_converter.dart';

part 'favorite_data.freezed.dart';
part 'favorite_data.g.dart';

@freezed
abstract class FavoriteData with _$FavoriteData {
  const factory FavoriteData({
    required String id,
    required String imageUrl,
    required String name,
    @DateTimeConverter() DateTime? createdAt,
    int? likingLevel,
    @Default(0) int numberOfLiveParticipation,
    int? postCount,
    @DateTimeConverter() required DateTime startedLikingDate,
    String? fanClubId,
    @DateTimeConverter() DateTime? contractRenewalDateForFanClub,
    @Default(0) int amountUsed,
    @DateTimeConverter() DateTime? favoriteBirthDay,
    String? link,
    String? instagramLink,
    String? xLink,
    String? youtubeLink,
    List<String>? otherlinks,
    List<String>? photosUrlList,
  }) = _FavoriteData;

  factory FavoriteData.fromJson(Map<String, dynamic> json) =>
      _$FavoriteDataFromJson(json);
}
