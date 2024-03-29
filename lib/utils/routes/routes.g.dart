// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $appShellRouteData,
      $startUpPageRoute,
      $authenticationPageRoute,
      $registerUserNamePageRoute,
      $reconfigurationMailPageRoute,
      $completeRegistrationPageRoute,
      $onBoardingIntroductionPageRoute,
      $homePageRoute,
      $calendarPageRoute,
      $activityPageRoute,
      $mapPageRoute,
      $settingsPageRoute,
      $favoriteDetailPageRoute,
      $addFavoritePageRoute,
      $onBoardingPageRoute,
      $editFavoritePageRoute,
      $calendarDetailPageRoute,
      $addSchedulePageRoute,
      $scheduleDetailPageRoute,
      $editSchedulePageRoute,
      $addActivityPageRoute,
      $pastActivityPageRoute,
      $activityDetailPageRoute,
      $addFavoritePhotoPageRoute,
      $addMarkerInformationPageRoute,
      $takePhotoPageRoute,
      $markerDetailPageRoute,
      $editMarkerPageRoute,
      $addFavoriteExperienceIntroducePageRoute,
      $addFavoriteExperiencePhotoPageRoute,
      $addFavoriteExperienceNamePageRoute,
      $addFavoriteExperienceDatePageRoute,
      $addFavoriteExperienceLivePageRoute,
      $addFavoriteExperienceAllPageRoute,
    ];

RouteBase get $appShellRouteData => StatefulShellRouteData.$route(
      factory: $AppShellRouteDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          navigatorKey: HomeBranch.$navigatorKey,
          routes: [
            GoRouteData.$route(
              path: '/home',
              factory: $HomePageRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: CalendarBranch.$navigatorKey,
          routes: [
            GoRouteData.$route(
              path: '/calendar',
              factory: $CalendarPageRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: ActivityBranch.$navigatorKey,
          routes: [
            GoRouteData.$route(
              path: '/activity',
              factory: $ActivityPageRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: MapBranch.$navigatorKey,
          routes: [
            GoRouteData.$route(
              path: '/map',
              factory: $MapPageRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: SettingsBranch.$navigatorKey,
          routes: [
            GoRouteData.$route(
              path: '/settings',
              factory: $SettingsPageRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $AppShellRouteDataExtension on AppShellRouteData {
  static AppShellRouteData _fromState(GoRouterState state) =>
      const AppShellRouteData();
}

extension $HomePageRouteExtension on HomePageRoute {
  static HomePageRoute _fromState(GoRouterState state) => const HomePageRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CalendarPageRouteExtension on CalendarPageRoute {
  static CalendarPageRoute _fromState(GoRouterState state) =>
      const CalendarPageRoute();

  String get location => GoRouteData.$location(
        '/calendar',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ActivityPageRouteExtension on ActivityPageRoute {
  static ActivityPageRoute _fromState(GoRouterState state) =>
      const ActivityPageRoute();

  String get location => GoRouteData.$location(
        '/activity',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MapPageRouteExtension on MapPageRoute {
  static MapPageRoute _fromState(GoRouterState state) => const MapPageRoute();

  String get location => GoRouteData.$location(
        '/map',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsPageRouteExtension on SettingsPageRoute {
  static SettingsPageRoute _fromState(GoRouterState state) =>
      const SettingsPageRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $startUpPageRoute => GoRouteData.$route(
      path: '/',
      factory: $StartUpPageRouteExtension._fromState,
    );

extension $StartUpPageRouteExtension on StartUpPageRoute {
  static StartUpPageRoute _fromState(GoRouterState state) =>
      const StartUpPageRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $authenticationPageRoute => GoRouteData.$route(
      path: '/authentication',
      factory: $AuthenticationPageRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'login',
          factory: $LoginPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'registerMail',
          factory: $RegisterMailPageRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'registerPassword',
              factory: $RegisterPasswordPageRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $AuthenticationPageRouteExtension on AuthenticationPageRoute {
  static AuthenticationPageRoute _fromState(GoRouterState state) =>
      AuthenticationPageRoute();

  String get location => GoRouteData.$location(
        '/authentication',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LoginPageRouteExtension on LoginPageRoute {
  static LoginPageRoute _fromState(GoRouterState state) =>
      const LoginPageRoute();

  String get location => GoRouteData.$location(
        '/authentication/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $RegisterMailPageRouteExtension on RegisterMailPageRoute {
  static RegisterMailPageRoute _fromState(GoRouterState state) =>
      const RegisterMailPageRoute();

  String get location => GoRouteData.$location(
        '/authentication/registerMail',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $RegisterPasswordPageRouteExtension on RegisterPasswordPageRoute {
  static RegisterPasswordPageRoute _fromState(GoRouterState state) =>
      RegisterPasswordPageRoute(
        email: state.uri.queryParameters['email']!,
      );

  String get location => GoRouteData.$location(
        '/authentication/registerMail/registerPassword',
        queryParams: {
          'email': email,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registerUserNamePageRoute => GoRouteData.$route(
      path: '/registerUserName',
      factory: $RegisterUserNamePageRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'registerBirthday',
          factory: $RegisterBirthdayPageRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'registerGender',
              factory: $RegisterGenderPageRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $RegisterUserNamePageRouteExtension on RegisterUserNamePageRoute {
  static RegisterUserNamePageRoute _fromState(GoRouterState state) =>
      const RegisterUserNamePageRoute();

  String get location => GoRouteData.$location(
        '/registerUserName',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $RegisterBirthdayPageRouteExtension on RegisterBirthdayPageRoute {
  static RegisterBirthdayPageRoute _fromState(GoRouterState state) =>
      RegisterBirthdayPageRoute(
        userName: state.uri.queryParameters['user-name']!,
      );

  String get location => GoRouteData.$location(
        '/registerUserName/registerBirthday',
        queryParams: {
          'user-name': userName,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $RegisterGenderPageRouteExtension on RegisterGenderPageRoute {
  static RegisterGenderPageRoute _fromState(GoRouterState state) =>
      RegisterGenderPageRoute(
        userName: state.uri.queryParameters['user-name']!,
        birthDay: DateTime.parse(state.uri.queryParameters['birth-day']!),
      );

  String get location => GoRouteData.$location(
        '/registerUserName/registerBirthday/registerGender',
        queryParams: {
          'user-name': userName,
          'birth-day': birthDay.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $reconfigurationMailPageRoute => GoRouteData.$route(
      path: '/reconfigurationMail',
      factory: $ReconfigurationMailPageRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'confirmationMail',
          factory: $ConfirmationMailPageRouteExtension._fromState,
        ),
      ],
    );

extension $ReconfigurationMailPageRouteExtension
    on ReconfigurationMailPageRoute {
  static ReconfigurationMailPageRoute _fromState(GoRouterState state) =>
      ReconfigurationMailPageRoute(
        isReconfigurationForCertifier: _$convertMapValue(
                'is-reconfiguration-for-certifier',
                state.uri.queryParameters,
                _$boolConverter) ??
            false,
      );

  String get location => GoRouteData.$location(
        '/reconfigurationMail',
        queryParams: {
          if (isReconfigurationForCertifier != false)
            'is-reconfiguration-for-certifier':
                isReconfigurationForCertifier.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ConfirmationMailPageRouteExtension on ConfirmationMailPageRoute {
  static ConfirmationMailPageRoute _fromState(GoRouterState state) =>
      ConfirmationMailPageRoute(
        email: state.uri.queryParameters['email']!,
        isReconfigurationForCertifier: _$convertMapValue(
                'is-reconfiguration-for-certifier',
                state.uri.queryParameters,
                _$boolConverter) ??
            false,
      );

  String get location => GoRouteData.$location(
        '/reconfigurationMail/confirmationMail',
        queryParams: {
          'email': email,
          if (isReconfigurationForCertifier != false)
            'is-reconfiguration-for-certifier':
                isReconfigurationForCertifier.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

bool _$boolConverter(String value) {
  switch (value) {
    case 'true':
      return true;
    case 'false':
      return false;
    default:
      throw UnsupportedError('Cannot convert "$value" into a bool.');
  }
}

RouteBase get $completeRegistrationPageRoute => GoRouteData.$route(
      path: '/completeRegistration',
      factory: $CompleteRegistrationPageRouteExtension._fromState,
    );

extension $CompleteRegistrationPageRouteExtension
    on CompleteRegistrationPageRoute {
  static CompleteRegistrationPageRoute _fromState(GoRouterState state) =>
      const CompleteRegistrationPageRoute();

  String get location => GoRouteData.$location(
        '/completeRegistration',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $onBoardingIntroductionPageRoute => GoRouteData.$route(
      path: '/onBoardingIntroduction',
      factory: $OnBoardingIntroductionPageRouteExtension._fromState,
    );

extension $OnBoardingIntroductionPageRouteExtension
    on OnBoardingIntroductionPageRoute {
  static OnBoardingIntroductionPageRoute _fromState(GoRouterState state) =>
      const OnBoardingIntroductionPageRoute();

  String get location => GoRouteData.$location(
        '/onBoardingIntroduction',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homePageRoute => GoRouteData.$route(
      path: '/home',
      factory: $HomePageRouteExtension._fromState,
    );

RouteBase get $calendarPageRoute => GoRouteData.$route(
      path: '/calendar',
      factory: $CalendarPageRouteExtension._fromState,
    );

RouteBase get $activityPageRoute => GoRouteData.$route(
      path: '/activity',
      factory: $ActivityPageRouteExtension._fromState,
    );

RouteBase get $mapPageRoute => GoRouteData.$route(
      path: '/map',
      factory: $MapPageRouteExtension._fromState,
    );

RouteBase get $settingsPageRoute => GoRouteData.$route(
      path: '/settings',
      factory: $SettingsPageRouteExtension._fromState,
    );

RouteBase get $favoriteDetailPageRoute => GoRouteData.$route(
      path: '/favoriteDetail',
      factory: $FavoriteDetailPageRouteExtension._fromState,
    );

extension $FavoriteDetailPageRouteExtension on FavoriteDetailPageRoute {
  static FavoriteDetailPageRoute _fromState(GoRouterState state) =>
      FavoriteDetailPageRoute(
        favoriteIndex: int.parse(state.uri.queryParameters['favorite-index']!),
      );

  String get location => GoRouteData.$location(
        '/favoriteDetail',
        queryParams: {
          'favorite-index': favoriteIndex.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $addFavoritePageRoute => GoRouteData.$route(
      path: '/addFavorite',
      factory: $AddFavoritePageRouteExtension._fromState,
    );

extension $AddFavoritePageRouteExtension on AddFavoritePageRoute {
  static AddFavoritePageRoute _fromState(GoRouterState state) =>
      const AddFavoritePageRoute();

  String get location => GoRouteData.$location(
        '/addFavorite',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $onBoardingPageRoute => GoRouteData.$route(
      path: '/onBoarding',
      factory: $OnBoardingPageRouteExtension._fromState,
    );

extension $OnBoardingPageRouteExtension on OnBoardingPageRoute {
  static OnBoardingPageRoute _fromState(GoRouterState state) =>
      const OnBoardingPageRoute();

  String get location => GoRouteData.$location(
        '/onBoarding',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $editFavoritePageRoute => GoRouteData.$route(
      path: '/editFavorite',
      factory: $EditFavoritePageRouteExtension._fromState,
    );

extension $EditFavoritePageRouteExtension on EditFavoritePageRoute {
  static EditFavoritePageRoute _fromState(GoRouterState state) =>
      EditFavoritePageRoute(
        $extra: state.extra as FavoriteData,
      );

  String get location => GoRouteData.$location(
        '/editFavorite',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $calendarDetailPageRoute => GoRouteData.$route(
      path: '/calendarDetail',
      factory: $CalendarDetailPageRouteExtension._fromState,
    );

extension $CalendarDetailPageRouteExtension on CalendarDetailPageRoute {
  static CalendarDetailPageRoute _fromState(GoRouterState state) =>
      CalendarDetailPageRoute(
        selectedDate:
            DateTime.parse(state.uri.queryParameters['selected-date']!),
        $extra: state.extra as List<DailySchedule>,
      );

  String get location => GoRouteData.$location(
        '/calendarDetail',
        queryParams: {
          'selected-date': selectedDate.toString(),
        },
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $addSchedulePageRoute => GoRouteData.$route(
      path: '/addSchedule',
      factory: $AddSchedulePageRouteExtension._fromState,
    );

extension $AddSchedulePageRouteExtension on AddSchedulePageRoute {
  static AddSchedulePageRoute _fromState(GoRouterState state) =>
      AddSchedulePageRoute(
        selectedDate: _$convertMapValue(
            'selected-date', state.uri.queryParameters, DateTime.parse),
      );

  String get location => GoRouteData.$location(
        '/addSchedule',
        queryParams: {
          if (selectedDate != null) 'selected-date': selectedDate!.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $scheduleDetailPageRoute => GoRouteData.$route(
      path: '/scheduleDetail',
      factory: $ScheduleDetailPageRouteExtension._fromState,
    );

extension $ScheduleDetailPageRouteExtension on ScheduleDetailPageRoute {
  static ScheduleDetailPageRoute _fromState(GoRouterState state) =>
      ScheduleDetailPageRoute(
        $extra: state.extra as DailySchedule,
      );

  String get location => GoRouteData.$location(
        '/scheduleDetail',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $editSchedulePageRoute => GoRouteData.$route(
      path: '/editSchedule',
      factory: $EditSchedulePageRouteExtension._fromState,
    );

extension $EditSchedulePageRouteExtension on EditSchedulePageRoute {
  static EditSchedulePageRoute _fromState(GoRouterState state) =>
      EditSchedulePageRoute(
        $extra: state.extra as DailySchedule,
      );

  String get location => GoRouteData.$location(
        '/editSchedule',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $addActivityPageRoute => GoRouteData.$route(
      path: '/addActivity',
      factory: $AddActivityPageRouteExtension._fromState,
    );

extension $AddActivityPageRouteExtension on AddActivityPageRoute {
  static AddActivityPageRoute _fromState(GoRouterState state) =>
      AddActivityPageRoute();

  String get location => GoRouteData.$location(
        '/addActivity',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $pastActivityPageRoute => GoRouteData.$route(
      path: '/pastActivity',
      factory: $PastActivityPageRouteExtension._fromState,
    );

extension $PastActivityPageRouteExtension on PastActivityPageRoute {
  static PastActivityPageRoute _fromState(GoRouterState state) =>
      const PastActivityPageRoute();

  String get location => GoRouteData.$location(
        '/pastActivity',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $activityDetailPageRoute => GoRouteData.$route(
      path: '/activityDetail',
      factory: $ActivityDetailPageRouteExtension._fromState,
    );

extension $ActivityDetailPageRouteExtension on ActivityDetailPageRoute {
  static ActivityDetailPageRoute _fromState(GoRouterState state) =>
      ActivityDetailPageRoute(
        selectedDay: DateTime.parse(state.uri.queryParameters['selected-day']!),
        $extra: state.extra as List<ActivityData>,
      );

  String get location => GoRouteData.$location(
        '/activityDetail',
        queryParams: {
          'selected-day': selectedDay.toString(),
        },
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $addFavoritePhotoPageRoute => GoRouteData.$route(
      path: '/addFavoritePhoto',
      factory: $AddFavoritePhotoPageRouteExtension._fromState,
    );

extension $AddFavoritePhotoPageRouteExtension on AddFavoritePhotoPageRoute {
  static AddFavoritePhotoPageRoute _fromState(GoRouterState state) =>
      AddFavoritePhotoPageRoute(
        id: state.uri.queryParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/addFavoritePhoto',
        queryParams: {
          'id': id,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $addMarkerInformationPageRoute => GoRouteData.$route(
      path: '/addMarkerInformation',
      factory: $AddMarkerInformationPageRouteExtension._fromState,
    );

extension $AddMarkerInformationPageRouteExtension
    on AddMarkerInformationPageRoute {
  static AddMarkerInformationPageRoute _fromState(GoRouterState state) =>
      AddMarkerInformationPageRoute();

  String get location => GoRouteData.$location(
        '/addMarkerInformation',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $takePhotoPageRoute => GoRouteData.$route(
      path: '/takePhoto',
      factory: $TakePhotoPageRouteExtension._fromState,
    );

extension $TakePhotoPageRouteExtension on TakePhotoPageRoute {
  static TakePhotoPageRoute _fromState(GoRouterState state) =>
      TakePhotoPageRoute();

  String get location => GoRouteData.$location(
        '/takePhoto',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $markerDetailPageRoute => GoRouteData.$route(
      path: '/markerDetail',
      factory: $MarkerDetailPageRouteExtension._fromState,
    );

extension $MarkerDetailPageRouteExtension on MarkerDetailPageRoute {
  static MarkerDetailPageRoute _fromState(GoRouterState state) =>
      MarkerDetailPageRoute(
        $extra: state.extra as MarkerData,
      );

  String get location => GoRouteData.$location(
        '/markerDetail',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $editMarkerPageRoute => GoRouteData.$route(
      path: '/editMarker',
      factory: $EditMarkerPageRouteExtension._fromState,
    );

extension $EditMarkerPageRouteExtension on EditMarkerPageRoute {
  static EditMarkerPageRoute _fromState(GoRouterState state) =>
      EditMarkerPageRoute(
        $extra: state.extra as MarkerData,
      );

  String get location => GoRouteData.$location(
        '/editMarker',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $addFavoriteExperienceIntroducePageRoute => GoRouteData.$route(
      path: '/addFavoriteExperienceIntroduce',
      factory: $AddFavoriteExperienceIntroducePageRouteExtension._fromState,
    );

extension $AddFavoriteExperienceIntroducePageRouteExtension
    on AddFavoriteExperienceIntroducePageRoute {
  static AddFavoriteExperienceIntroducePageRoute _fromState(
          GoRouterState state) =>
      const AddFavoriteExperienceIntroducePageRoute();

  String get location => GoRouteData.$location(
        '/addFavoriteExperienceIntroduce',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $addFavoriteExperiencePhotoPageRoute => GoRouteData.$route(
      path: '/addFavoriteExperiencePhoto',
      factory: $AddFavoriteExperiencePhotoPageRouteExtension._fromState,
    );

extension $AddFavoriteExperiencePhotoPageRouteExtension
    on AddFavoriteExperiencePhotoPageRoute {
  static AddFavoriteExperiencePhotoPageRoute _fromState(GoRouterState state) =>
      const AddFavoriteExperiencePhotoPageRoute();

  String get location => GoRouteData.$location(
        '/addFavoriteExperiencePhoto',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $addFavoriteExperienceNamePageRoute => GoRouteData.$route(
      path: '/addFavoriteExperienceName',
      factory: $AddFavoriteExperienceNamePageRouteExtension._fromState,
    );

extension $AddFavoriteExperienceNamePageRouteExtension
    on AddFavoriteExperienceNamePageRoute {
  static AddFavoriteExperienceNamePageRoute _fromState(GoRouterState state) =>
      AddFavoriteExperienceNamePageRoute(
        imageUrl: state.uri.queryParameters['image-url']!,
      );

  String get location => GoRouteData.$location(
        '/addFavoriteExperienceName',
        queryParams: {
          'image-url': imageUrl,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $addFavoriteExperienceDatePageRoute => GoRouteData.$route(
      path: '/addFavoriteExperienceDate',
      factory: $AddFavoriteExperienceDatePageRouteExtension._fromState,
    );

extension $AddFavoriteExperienceDatePageRouteExtension
    on AddFavoriteExperienceDatePageRoute {
  static AddFavoriteExperienceDatePageRoute _fromState(GoRouterState state) =>
      AddFavoriteExperienceDatePageRoute(
        imageUrl: state.uri.queryParameters['image-url']!,
        name: state.uri.queryParameters['name']!,
      );

  String get location => GoRouteData.$location(
        '/addFavoriteExperienceDate',
        queryParams: {
          'image-url': imageUrl,
          'name': name,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $addFavoriteExperienceLivePageRoute => GoRouteData.$route(
      path: '/addFavoriteExperienceLive',
      factory: $AddFavoriteExperienceLivePageRouteExtension._fromState,
    );

extension $AddFavoriteExperienceLivePageRouteExtension
    on AddFavoriteExperienceLivePageRoute {
  static AddFavoriteExperienceLivePageRoute _fromState(GoRouterState state) =>
      AddFavoriteExperienceLivePageRoute(
        imageUrl: state.uri.queryParameters['image-url']!,
        name: state.uri.queryParameters['name']!,
        startedLikingDate:
            DateTime.parse(state.uri.queryParameters['started-liking-date']!),
      );

  String get location => GoRouteData.$location(
        '/addFavoriteExperienceLive',
        queryParams: {
          'image-url': imageUrl,
          'name': name,
          'started-liking-date': startedLikingDate.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $addFavoriteExperienceAllPageRoute => GoRouteData.$route(
      path: '/addFavoriteExperienceAll',
      factory: $AddFavoriteExperienceAllPageRouteExtension._fromState,
    );

extension $AddFavoriteExperienceAllPageRouteExtension
    on AddFavoriteExperienceAllPageRoute {
  static AddFavoriteExperienceAllPageRoute _fromState(GoRouterState state) =>
      AddFavoriteExperienceAllPageRoute(
        imageUrl: state.uri.queryParameters['image-url']!,
        name: state.uri.queryParameters['name']!,
        startedLikingDate:
            DateTime.parse(state.uri.queryParameters['started-liking-date']!),
        numberOfLiveParticipation: int.parse(
            state.uri.queryParameters['number-of-live-participation']!),
      );

  String get location => GoRouteData.$location(
        '/addFavoriteExperienceAll',
        queryParams: {
          'image-url': imageUrl,
          'name': name,
          'started-liking-date': startedLikingDate.toString(),
          'number-of-live-participation': numberOfLiveParticipation.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routeObserverHash() => r'9c96d7dcf6a4c5317b9b7a42ec68d7bf72d6a877';

/// See also [routeObserver].
@ProviderFor(routeObserver)
final routeObserverProvider = Provider<RouteObserver>.internal(
  routeObserver,
  name: r'routeObserverProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$routeObserverHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RouteObserverRef = ProviderRef<RouteObserver>;
String _$goRouterHash() => r'2229b89c732bbaa50d4f937183ef0e90c3e88f5c';

/// See also [goRouter].
@ProviderFor(goRouter)
final goRouterProvider = Provider<GoRouter>.internal(
  goRouter,
  name: r'goRouterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$goRouterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GoRouterRef = ProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
