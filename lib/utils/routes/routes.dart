// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_fave_app/models/activity_data.dart';
import 'package:my_fave_app/models/daily_schedule.dart';
import 'package:my_fave_app/models/favorite_data.dart';
import 'package:my_fave_app/models/marker_data.dart';
import 'package:my_fave_app/pages/activity/activity_detail_page.dart';
import 'package:my_fave_app/pages/activity/activity_page.dart';
import 'package:my_fave_app/pages/activity/add_activity_page.dart';
import 'package:my_fave_app/pages/activity/past_activity_page.dart';
import 'package:my_fave_app/pages/add_favorite/add_favorite_page.dart';
import 'package:my_fave_app/pages/add_favorite/add_favorite_photo_page.dart';
import 'package:my_fave_app/pages/authentication/authentication_page.dart';
import 'package:my_fave_app/pages/authentication/confirmation_mail_page.dart';
import 'package:my_fave_app/pages/authentication/login_page.dart';
import 'package:my_fave_app/pages/authentication/reconfiguration_mail_page.dart';
import 'package:my_fave_app/pages/authentication/register_mail_page.dart';
import 'package:my_fave_app/pages/authentication/register_password_page.dart';
import 'package:my_fave_app/pages/calendar/add_schedule_page.dart';
import 'package:my_fave_app/pages/calendar/calendar_detail_page.dart';
import 'package:my_fave_app/pages/calendar/calendar_page.dart';
import 'package:my_fave_app/pages/calendar/edit_schedule_page.dart';
import 'package:my_fave_app/pages/calendar/schedule_detail_page.dart';
import 'package:my_fave_app/pages/edit_favorite/edit_favorite_page.dart';
import 'package:my_fave_app/pages/favorite_detail/favorite_detail_page.dart';
import 'package:my_fave_app/pages/home/home_page.dart';
import 'package:my_fave_app/pages/map/add_marker_information_page.dart';
import 'package:my_fave_app/pages/map/edit_marker_page.dart';
import 'package:my_fave_app/pages/map/map_page.dart';
import 'package:my_fave_app/pages/map/marker_detail_page.dart';
import 'package:my_fave_app/pages/map/take_photo_page.dart';
import 'package:my_fave_app/pages/on_boarding/add_favorite_experience/add_favorite_experience_all_page.dart';
import 'package:my_fave_app/pages/on_boarding/add_favorite_experience/add_favorite_experience_date_page.dart';
import 'package:my_fave_app/pages/on_boarding/add_favorite_experience/add_favorite_experience_introduce_page.dart';
import 'package:my_fave_app/pages/on_boarding/add_favorite_experience/add_favorite_experience_live_page.dart';
import 'package:my_fave_app/pages/on_boarding/add_favorite_experience/add_favorite_experience_name_page.dart';
import 'package:my_fave_app/pages/on_boarding/add_favorite_experience/add_favorite_experience_photo_page.dart';
import 'package:my_fave_app/pages/on_boarding/on_boarding_introduction_page.dart';
import 'package:my_fave_app/pages/on_boarding/on_boarding_page.dart';
import 'package:my_fave_app/pages/register_user_information/complete_registration_page.dart';
import 'package:my_fave_app/pages/register_user_information/register_birthday_page.dart';
import 'package:my_fave_app/pages/register_user_information/register_gender_page.dart';
import 'package:my_fave_app/pages/register_user_information/register_user_name_page.dart';
import 'package:my_fave_app/pages/settings/settings_page.dart';
import 'package:my_fave_app/start_up_page.dart';
import 'package:my_fave_app/widgets/widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// ...略

part 'routes.g.dart';

// ********************************************************
// * Entrypoints
// * パスは定数にしてまとめておく
// ********************************************************
class AppRoutes {
  static const root = '/';
  static const authentication = '/authentication';
  static const login = 'login';
  static const registerMail = 'registerMail';
  static const registerPassword = 'registerPassword';
  static const registerUserName = '/registerUserName';
  static const registerBirthday = 'registerBirthday';
  static const reconfigurationMail = '/reconfigurationMail';
  static const confirmationMail = 'confirmationMail';
  static const registerGender = 'registerGender';
  static const completeRegistration = '/completeRegistration';
  static const onBoardingIntroduction = '/onBoardingIntroduction';
  static const home = '/home';
  static const calendar = '/calendar';
  static const activity = '/activity';
  static const map = '/map';
  static const settings = '/settings';
  static const favoriteDetail = '/favoriteDetail';
  static const addFavorite = '/addFavorite';
  static const onBoarding = '/onBoarding';
  static const editFavorite = '/editFavorite';
  static const calendarDetail = '/calendarDetail';
  static const addSchedule = '/addSchedule';
  static const scheduleDetail = '/scheduleDetail';
  static const editSchedule = '/editSchedule';
  static const addActivity = '/addActivity';
  static const pastActivity = '/pastActivity';
  static const activityDetail = '/activityDetail';
  static const addFavoritePhoto = '/addFavoritePhoto';
  static const addMarkerInformation = '/addMarkerInformation';
  static const takePhoto = '/takePhoto';
  static const markerDetail = '/markerDetail';
  static const editMarker = '/editMarker';
  static const addFavoriteExperienceIntroduce =
      '/addFavoriteExperienceIntroduce';
  static const addFavoriteExperiencePhoto = '/addFavoriteExperiencePhoto';
  static const addFavoriteExperienceName = '/addFavoriteExperienceName';
  static const addFavoriteExperienceDate = '/addFavoriteExperienceDate';
  static const addFavoriteExperienceLive = '/addFavoriteExperienceLive';
  static const addFavoriteExperienceAll = '/addFavoriteExperienceAll';
}

final rootNavigatorKey = GlobalKey<NavigatorState>();

final navigatorKeyProvider = Provider(
  (_) => GlobalKey<NavigatorState>(),
);
final homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final calendarNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'calendar');
final activityNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'activity');
final mapNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'map');
final settingsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'settings');

@Riverpod(keepAlive: true)
RouteObserver routeObserver(RouteObserverRef ref) => RouteObserver();

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    routes: $appRoutes,
    navigatorKey: ref.read(navigatorKeyProvider),
    observers: [ref.read(routeObserverProvider)],
    initialLocation: AppRoutes.root,
    debugLogDiagnostics: kDebugMode,
    redirect: (context, state) {
      return null;
    },
  );
}

// ********************************************************
// * RouteData
// * GoRouteDataをそれぞれ設定
// ********************************************************

@TypedStatefulShellRoute<AppShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<HomeBranch>(
      routes: [
        TypedGoRoute<HomePageRoute>(
          path: AppRoutes.home,
        ),
      ],
    ),
    TypedStatefulShellBranch<CalendarBranch>(
      routes: [
        TypedGoRoute<CalendarPageRoute>(
          path: AppRoutes.calendar,
        ),
      ],
    ),
    TypedStatefulShellBranch<ActivityBranch>(
      routes: [
        TypedGoRoute<ActivityPageRoute>(
          path: AppRoutes.activity,
        ),
      ],
    ),
    TypedStatefulShellBranch<MapBranch>(
      routes: [
        TypedGoRoute<MapPageRoute>(
          path: AppRoutes.map,
        ),
      ],
    ),
    TypedStatefulShellBranch<SettingsBranch>(
      routes: [
        TypedGoRoute<SettingsPageRoute>(
          path: AppRoutes.settings,
        ),
      ],
    ),
  ],
)
class AppShellRouteData extends StatefulShellRouteData {
  const AppShellRouteData();

  static final GlobalKey<NavigatorState> $navigatorKey = rootNavigatorKey;

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return CommonNavigationBar(
      navigationShell: navigationShell,
    );
  }
}

class HomeBranch extends StatefulShellBranchData {
  const HomeBranch();

  static final GlobalKey<NavigatorState> $navigatorKey = homeNavigatorKey;
}

class CalendarBranch extends StatefulShellBranchData {
  const CalendarBranch();

  static final GlobalKey<NavigatorState> $navigatorKey = calendarNavigatorKey;
}

class ActivityBranch extends StatefulShellBranchData {
  const ActivityBranch();

  static final GlobalKey<NavigatorState> $navigatorKey = activityNavigatorKey;
}

class MapBranch extends StatefulShellBranchData {
  const MapBranch();

  static final GlobalKey<NavigatorState> $navigatorKey = mapNavigatorKey;
}

class SettingsBranch extends StatefulShellBranchData {
  const SettingsBranch();

  static final GlobalKey<NavigatorState> $navigatorKey = settingsNavigatorKey;
}

// TOPレベルのパスには、@TypedGoRouteをつける
@TypedGoRoute<StartUpPageRoute>(
  path: AppRoutes.root,
)
class StartUpPageRoute extends GoRouteData {
  const StartUpPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StartUpPage();
}

@TypedGoRoute<AuthenticationPageRoute>(
  path: AppRoutes.authentication,
  routes: [
    TypedGoRoute<LoginPageRoute>(
      path: AppRoutes.login,
    ),
    TypedGoRoute<RegisterMailPageRoute>(
      path: AppRoutes.registerMail,
      routes: [
        TypedGoRoute<RegisterPasswordPageRoute>(
          path: AppRoutes.registerPassword,
        ),
      ],
    ),
  ],
)
class AuthenticationPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AuthenticationPage();
}

@immutable
class LoginPageRoute extends GoRouteData {
  const LoginPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginPage();
}

@immutable
class RegisterMailPageRoute extends GoRouteData {
  const RegisterMailPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const RegisterMailPage();
}

@immutable
class RegisterPasswordPageRoute extends GoRouteData {
  const RegisterPasswordPageRoute({required this.email});
  final String email;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      RegisterPasswordPage(email: email);
}

@TypedGoRoute<RegisterUserNamePageRoute>(
  path: AppRoutes.registerUserName,
  routes: [
    TypedGoRoute<RegisterBirthdayPageRoute>(
      path: AppRoutes.registerBirthday,
      routes: [
        TypedGoRoute<RegisterGenderPageRoute>(
          path: AppRoutes.registerGender,
        ),
      ],
    ),
  ],
)
class RegisterUserNamePageRoute extends GoRouteData {
  const RegisterUserNamePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const RegisterUserNamePage();
}

@immutable
class RegisterBirthdayPageRoute extends GoRouteData {
  const RegisterBirthdayPageRoute({
    required this.userName,
  });
  final String userName;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      RegisterBirthDayPage(userName: userName);
}

@TypedGoRoute<ReconfigurationMailPageRoute>(
  path: AppRoutes.reconfigurationMail,
  routes: [
    TypedGoRoute<ConfirmationMailPageRoute>(path: AppRoutes.confirmationMail),
  ],
)
class ReconfigurationMailPageRoute extends GoRouteData {
  const ReconfigurationMailPageRoute({
    this.isReconfigurationForCertifier = false,
  });
  final bool isReconfigurationForCertifier;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ReconfigurationMailPage(
        isReconfigurationForCertifier: isReconfigurationForCertifier,
      );
}

@immutable
class ConfirmationMailPageRoute extends GoRouteData {
  const ConfirmationMailPageRoute({
    required this.email,
    this.isReconfigurationForCertifier = false,
  });

  final String email;
  final bool isReconfigurationForCertifier;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ConfirmationMailPage(
        email: email,
        isReconfigurationForCertifier: isReconfigurationForCertifier,
      );
}

@immutable
class RegisterGenderPageRoute extends GoRouteData {
  const RegisterGenderPageRoute({
    required this.userName,
    required this.birthDay,
  });
  final String userName;
  final DateTime birthDay;

  @override
  Widget build(BuildContext context, GoRouterState state) => RegisterGenderPage(
        userName: userName,
        birthDay: birthDay,
      );
}

@TypedGoRoute<CompleteRegistrationPageRoute>(
  path: AppRoutes.completeRegistration,
)
class CompleteRegistrationPageRoute extends GoRouteData {
  const CompleteRegistrationPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CompleteRegistrationPage();
}

@TypedGoRoute<OnBoardingIntroductionPageRoute>(
  path: AppRoutes.onBoardingIntroduction,
)
class OnBoardingIntroductionPageRoute extends GoRouteData {
  const OnBoardingIntroductionPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const OnBoardingIntroductionPage();
}

@TypedGoRoute<HomePageRoute>(
  path: AppRoutes.home,
)
class HomePageRoute extends GoRouteData {
  const HomePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

@TypedGoRoute<CalendarPageRoute>(
  path: AppRoutes.calendar,
)
class CalendarPageRoute extends GoRouteData {
  const CalendarPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CalendarPage();
}

@TypedGoRoute<ActivityPageRoute>(
  path: AppRoutes.activity,
)
class ActivityPageRoute extends GoRouteData {
  const ActivityPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ActivityPage();
}

@TypedGoRoute<MapPageRoute>(
  path: AppRoutes.map,
)
class MapPageRoute extends GoRouteData {
  const MapPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const MapPage();
}

@TypedGoRoute<SettingsPageRoute>(
  path: AppRoutes.settings,
)
class SettingsPageRoute extends GoRouteData {
  const SettingsPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsPage();
}

@TypedGoRoute<FavoriteDetailPageRoute>(
  path: AppRoutes.favoriteDetail,
)
class FavoriteDetailPageRoute extends GoRouteData {
  const FavoriteDetailPageRoute({required this.favoriteIndex});
  final int favoriteIndex;

  @override
  Widget build(BuildContext context, GoRouterState state) => FavoriteDetailPage(
        favoriteIndex: favoriteIndex,
      );
}

@TypedGoRoute<AddFavoritePageRoute>(
  path: AppRoutes.addFavorite,
)
class AddFavoritePageRoute extends GoRouteData {
  const AddFavoritePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AddFavoritePage();
}

@TypedGoRoute<OnBoardingPageRoute>(
  path: AppRoutes.onBoarding,
)
class OnBoardingPageRoute extends GoRouteData {
  const OnBoardingPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const OnBoardingPage();
}

@TypedGoRoute<EditFavoritePageRoute>(
  path: AppRoutes.editFavorite,
)
class EditFavoritePageRoute extends GoRouteData {
  const EditFavoritePageRoute({required this.$extra});
  final FavoriteData $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) => EditFavoritePage(
        favoriteData: $extra,
      );
}

@TypedGoRoute<CalendarDetailPageRoute>(
  path: AppRoutes.calendarDetail,
)
class CalendarDetailPageRoute extends GoRouteData {
  const CalendarDetailPageRoute({
    required this.$extra,
    required this.selectedDate,
  });
  final List<DailySchedule> $extra;
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context, GoRouterState state) => CalendarDetailPage(
        events: $extra,
        selectedDate: selectedDate,
      );
}

@TypedGoRoute<AddSchedulePageRoute>(
  path: AppRoutes.addSchedule,
)
class AddSchedulePageRoute extends GoRouteData {
  AddSchedulePageRoute({this.selectedDate});
  final DateTime? selectedDate;

  @override
  MaterialPage<void> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage<void>(
        fullscreenDialog: true,
        child: AddSchedulePage(
          selectedDate: selectedDate,
        ),
      );
}

@TypedGoRoute<ScheduleDetailPageRoute>(
  path: AppRoutes.scheduleDetail,
)
class ScheduleDetailPageRoute extends GoRouteData {
  ScheduleDetailPageRoute({required this.$extra});
  final DailySchedule $extra;

  @override
  MaterialPage<void> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage<void>(
        fullscreenDialog: true,
        child: ScheduleDetailPage(
          schedule: $extra,
        ),
      );
}

@TypedGoRoute<EditSchedulePageRoute>(
  path: AppRoutes.editSchedule,
)
class EditSchedulePageRoute extends GoRouteData {
  EditSchedulePageRoute({required this.$extra});
  final DailySchedule $extra;

  @override
  MaterialPage<void> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage<void>(
        fullscreenDialog: true,
        child: EditSchedulePage(
          schedule: $extra,
        ),
      );
}

@TypedGoRoute<AddActivityPageRoute>(
  path: AppRoutes.addActivity,
)
class AddActivityPageRoute extends GoRouteData {
  AddActivityPageRoute();

  @override
  MaterialPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const MaterialPage<void>(
        fullscreenDialog: true,
        child: AddActivityPage(),
      );
}

@TypedGoRoute<PastActivityPageRoute>(
  path: AppRoutes.pastActivity,
)
class PastActivityPageRoute extends GoRouteData {
  const PastActivityPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const PastActivityPage();
}

@TypedGoRoute<ActivityDetailPageRoute>(
  path: AppRoutes.activityDetail,
)
class ActivityDetailPageRoute extends GoRouteData {
  ActivityDetailPageRoute({
    required this.$extra,
    required this.selectedDay,
  });
  final List<ActivityData> $extra;
  final DateTime selectedDay;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      AcctivityDetailPage(
        activityDataList: $extra,
        selectedDay: selectedDay,
      );
}

@TypedGoRoute<AddFavoritePhotoPageRoute>(
  path: AppRoutes.addFavoritePhoto,
)
class AddFavoritePhotoPageRoute extends GoRouteData {
  AddFavoritePhotoPageRoute({required this.id});
  final String id;

  @override
  MaterialPage<void> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage<void>(
        fullscreenDialog: true,
        child: AddFavoritePhotoPage(
          id: id,
        ),
      );
}

@TypedGoRoute<AddMarkerInformationPageRoute>(
  path: AppRoutes.addMarkerInformation,
)
class AddMarkerInformationPageRoute extends GoRouteData {
  AddMarkerInformationPageRoute();

  @override
  MaterialPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const MaterialPage<void>(
        fullscreenDialog: true,
        child: AddMarkerInformationPage(),
      );
}

@TypedGoRoute<TakePhotoPageRoute>(
  path: AppRoutes.takePhoto,
)
class TakePhotoPageRoute extends GoRouteData {
  TakePhotoPageRoute();

  @override
  MaterialPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const MaterialPage<XFile?>(
        fullscreenDialog: true,
        child: TakePhotoPage(),
      );
}

@TypedGoRoute<MarkerDetailPageRoute>(
  path: AppRoutes.markerDetail,
)
class MarkerDetailPageRoute extends GoRouteData {
  const MarkerDetailPageRoute({required this.$extra});
  final MarkerData $extra;

  @override
  MaterialPage<void> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage<void>(
        fullscreenDialog: true,
        child: MarkerDetailPage(
          marker: $extra,
        ),
      );
}

@TypedGoRoute<EditMarkerPageRoute>(
  path: AppRoutes.editMarker,
)
class EditMarkerPageRoute extends GoRouteData {
  EditMarkerPageRoute({required this.$extra});
  final MarkerData $extra;

  @override
  MaterialPage<void> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage<void>(
        fullscreenDialog: true,
        child: EditMarkerPage(
          marker: $extra,
        ),
      );
}

@TypedGoRoute<AddFavoriteExperienceIntroducePageRoute>(
  path: AppRoutes.addFavoriteExperienceIntroduce,
)
class AddFavoriteExperienceIntroducePageRoute extends GoRouteData {
  const AddFavoriteExperienceIntroducePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AddFavoriteExperienceIntroducePage();
}

@TypedGoRoute<AddFavoriteExperiencePhotoPageRoute>(
  path: AppRoutes.addFavoriteExperiencePhoto,
)
class AddFavoriteExperiencePhotoPageRoute extends GoRouteData {
  const AddFavoriteExperiencePhotoPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AddFavoriteExperiencePhotoPage();
}

@TypedGoRoute<AddFavoriteExperienceNamePageRoute>(
  path: AppRoutes.addFavoriteExperienceName,
)
class AddFavoriteExperienceNamePageRoute extends GoRouteData {
  AddFavoriteExperienceNamePageRoute({required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      AddFavoriteExperienceNamePage(
        imageUrl: imageUrl,
      );
}

@TypedGoRoute<AddFavoriteExperienceDatePageRoute>(
  path: AppRoutes.addFavoriteExperienceDate,
)
class AddFavoriteExperienceDatePageRoute extends GoRouteData {
  AddFavoriteExperienceDatePageRoute({
    required this.imageUrl,
    required this.name,
  });
  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      AddFavoriteExperienceDatePage(
        imageUrl: imageUrl,
        name: name,
      );
}

@TypedGoRoute<AddFavoriteExperienceLivePageRoute>(
  path: AppRoutes.addFavoriteExperienceLive,
)
class AddFavoriteExperienceLivePageRoute extends GoRouteData {
  AddFavoriteExperienceLivePageRoute({
    required this.imageUrl,
    required this.name,
    required this.startedLikingDate,
  });
  final String imageUrl;
  final String name;
  final DateTime startedLikingDate;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      AddFavoriteExperienceLivePage(
        imageUrl: imageUrl,
        name: name,
        startedLikingDate: startedLikingDate,
      );
}

@TypedGoRoute<AddFavoriteExperienceAllPageRoute>(
  path: AppRoutes.addFavoriteExperienceAll,
)
class AddFavoriteExperienceAllPageRoute extends GoRouteData {
  AddFavoriteExperienceAllPageRoute({
    required this.imageUrl,
    required this.name,
    required this.startedLikingDate,
    required this.numberOfLiveParticipation,
  });
  final String imageUrl;
  final String name;
  final DateTime startedLikingDate;
  final int numberOfLiveParticipation;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      AddFavoriteExperienceAllPage(
        imageUrl: imageUrl,
        name: name,
        startedLikingDate: startedLikingDate,
        numberOfLiveParticipation: numberOfLiveParticipation,
      );
}
