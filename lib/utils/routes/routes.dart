// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_fave_app/pages/activity/activity_page.dart';
import 'package:my_fave_app/pages/add_favorite/add_favorite_page.dart';
import 'package:my_fave_app/pages/authentication/authentication_page.dart';
import 'package:my_fave_app/pages/authentication/confirmation_mail_page.dart';
import 'package:my_fave_app/pages/authentication/login_page.dart';
import 'package:my_fave_app/pages/authentication/reconfiguration_mail_page.dart';
import 'package:my_fave_app/pages/authentication/register_mail_page.dart';
import 'package:my_fave_app/pages/authentication/register_password_page.dart';
import 'package:my_fave_app/pages/calendar/calendar_page.dart';
import 'package:my_fave_app/pages/favorite_detail/favorite_detail_page.dart';
import 'package:my_fave_app/pages/home/home_page.dart';
import 'package:my_fave_app/pages/map/map_page.dart';
import 'package:my_fave_app/pages/on_boarding/on_boarding_introduction_page.dart';
import 'package:my_fave_app/pages/profile/profile_page.dart';
import 'package:my_fave_app/pages/register_user_information/complete_registration_page.dart';
import 'package:my_fave_app/pages/register_user_information/register_birthday_page.dart';
import 'package:my_fave_app/pages/register_user_information/register_gender_page.dart';
import 'package:my_fave_app/pages/register_user_information/register_user_name_page.dart';
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
  static const profile = '/profile';
  static const favoriteDetail = '/favoriteDetail';
  static const addFavorite = '/addFavorite';
}

final rootNavigatorKey = GlobalKey<NavigatorState>();
final homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final calendarNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'calendar');
final activityNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'activity');
final mapNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'map');
final profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    routes: $appRoutes,
    navigatorKey: rootNavigatorKey,
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
    TypedStatefulShellBranch<ProfileBranch>(
      routes: [
        TypedGoRoute<ProfilePageRoute>(
          path: AppRoutes.profile,
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

class ProfileBranch extends StatefulShellBranchData {
  const ProfileBranch();

  static final GlobalKey<NavigatorState> $navigatorKey = profileNavigatorKey;
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
  const ReconfigurationMailPageRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ReconfigurationMailPage();
}

@immutable
class ConfirmationMailPageRoute extends GoRouteData {
  const ConfirmationMailPageRoute({required this.email});

  final String email;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ConfirmationMailPage(email: email);
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
      const OnBoardignIntroductionPage();
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

@TypedGoRoute<ProfilePageRoute>(
  path: AppRoutes.profile,
)
class ProfilePageRoute extends GoRouteData {
  const ProfilePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProfilePage();
}

@TypedGoRoute<FavoriteDetailPageRoute>(
  path: AppRoutes.favoriteDetail,
)
class FavoriteDetailPageRoute extends GoRouteData {
  const FavoriteDetailPageRoute({required this.imgUrl});
  final String imgUrl;

  @override
  Widget build(BuildContext context, GoRouterState state) => FavoriteDetailPage(
        imgUrl: imgUrl,
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
