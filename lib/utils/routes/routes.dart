// routes.dart
// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_fave_app/pages/authentication/authentication_page.dart';
import 'package:my_fave_app/pages/authentication/confirmation_mail_page.dart';
import 'package:my_fave_app/pages/authentication/login_page.dart';
import 'package:my_fave_app/pages/authentication/reconfiguration_mail_page.dart';
import 'package:my_fave_app/pages/authentication/register_mail_page.dart';
import 'package:my_fave_app/pages/authentication/register_password_page.dart';
import 'package:my_fave_app/pages/home/home_page.dart';
import 'package:my_fave_app/pages/on_boarding/on_boarding_introduction_page.dart';
import 'package:my_fave_app/pages/register_user_information/complete_registration_page.dart';
import 'package:my_fave_app/pages/register_user_information/register_birthday_page.dart';
import 'package:my_fave_app/pages/register_user_information/register_gender_page.dart';
import 'package:my_fave_app/pages/register_user_information/register_user_name_page.dart';
import 'package:my_fave_app/start_up_page.dart';
import 'package:my_fave_app/utils/utils.dart';
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
}

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) => GoRouter(
      routes: $appRoutes,
      navigatorKey: ref.read(navigatorKeyProvider),
      initialLocation: AppRoutes.root,
      debugLogDiagnostics: kDebugMode,
    );

// ********************************************************
// * RouteData
// * GoRouteDataをそれぞれ設定
// ********************************************************

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
  Widget build(BuildContext context, GoRouterState state) =>
      const MyHomePage(title: '');
}
