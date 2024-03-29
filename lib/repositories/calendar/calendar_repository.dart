import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_fave_app/models/daily_schedule.dart';

abstract class CalendarRepository {
  User? get currentUser;

  Future<void> createSchedule(DailySchedule schedule);

  Stream<QuerySnapshot> fetchScheduleList();

  Future<void> editSchedule(DailySchedule schedule);
}
