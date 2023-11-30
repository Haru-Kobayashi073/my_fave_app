// routes.dart
// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_fave_app/pages/authentication/authentication_page.dart';
import 'package:my_fave_app/pages/login/login_page.dart';
import 'package:my_fave_app/pages/register_mail/register_mail_page.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// ...略

part 'routes.g.dart';

// ********************************************************
// * Entrypoints
// * パスは定数にしてまとめておく
// ********************************************************
class AppRoutes {
  static const authentication = '/authentication';
  static const login = 'login';
  static const registerMail = 'registerMail';
}

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) => GoRouter(
      routes: $appRoutes,
      navigatorKey: ref.read(navigatorKeyProvider),
      initialLocation: AppRoutes.authentication,
      debugLogDiagnostics: kDebugMode,
    );

// ********************************************************
// * RouteData
// * GoRouteDataをそれぞれ設定
// ********************************************************

// TOPレベルのパスには、@TypedGoRouteをつける
@TypedGoRoute<AuthenticationPageRoute>(
  path: AppRoutes.authentication,
  routes: [
    TypedGoRoute<LoginPageRoute>(
      path: AppRoutes.login,
      routes: [
        TypedGoRoute<RegisterMailPageRoute>(
          path: AppRoutes.registerMail,
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
