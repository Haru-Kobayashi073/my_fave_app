import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_fave_app/utils/date_time_converter.dart';

part 'daily_schedule.freezed.dart';
part 'daily_schedule.g.dart';

@freezed
abstract class DailySchedule with _$DailySchedule {
  const factory DailySchedule({
    required String id,
    required String title,
    required String location,
    bool? isAllDay,
    @DateTimeConverter() required DateTime start,
    @DateTimeConverter() DateTime? end,
    String? url,
    String? memo,
    @DateTimeConverter() DateTime? createdAt,
  }) = _DailySchedule;

  factory DailySchedule.fromJson(Map<String, dynamic> json) =>
      _$DailyScheduleFromJson(json);
}
