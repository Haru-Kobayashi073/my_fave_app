import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_fave_app/utils/date_time_converter.dart';

part 'activity_data.freezed.dart';
part 'activity_data.g.dart';

@freezed
abstract class ActivityData with _$ActivityData {
  const factory ActivityData({
    required String id,
    required String imageUrl,
    @DateTimeConverter() DateTime? createdAt,
  }) = _ActivityData;

  factory ActivityData.fromJson(Map<String, dynamic> json) =>
      _$ActivityDataFromJson(json);
}
