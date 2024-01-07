import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_fave_app/models/daily_schedule.dart';
import 'package:my_fave_app/repositories/calendar/calendar_repository.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar_repository_impl.g.dart';

@riverpod
CalendarRepositoryImpl calendarRepositoryImpl(CalendarRepositoryImplRef ref) {
  return CalendarRepositoryImpl(ref);
}

class CalendarRepositoryImpl implements CalendarRepository {
  CalendarRepositoryImpl(ProviderRef<CalendarRepository> ref)
      : _auth = ref.read(getFirebaseAuthProvider),
        _firestore = ref.read(getFirebaseFirestoreProvider);

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Future<void> createSchedule(DailySchedule schedule) async {
    final uid = _auth.currentUser!.uid;
    final id = returnUuidV4();
    await _firestore
        .collection('users')
        .doc(uid)
        .collection('schedules')
        .doc(id)
        .set(
          schedule
              .copyWith(
                id: id,
                createdAt: DateTime.now(),
              )
              .toJson(),
        );
  }
}
