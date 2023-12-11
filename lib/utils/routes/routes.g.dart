// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $authenticationPageRoute,
      $completeRegistrationPageRoute,
    ];

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
              routes: [
                GoRouteData.$route(
                  path: 'registerUserName',
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
                ),
              ],
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

extension $RegisterUserNamePageRouteExtension on RegisterUserNamePageRoute {
  static RegisterUserNamePageRoute _fromState(GoRouterState state) =>
      RegisterUserNamePageRoute(
        email: state.uri.queryParameters['email']!,
        password: state.uri.queryParameters['password']!,
      );

  String get location => GoRouteData.$location(
        '/authentication/registerMail/registerPassword/registerUserName',
        queryParams: {
          'email': email,
          'password': password,
        },
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
        email: state.uri.queryParameters['email']!,
        password: state.uri.queryParameters['password']!,
        userName: state.uri.queryParameters['user-name']!,
      );

  String get location => GoRouteData.$location(
        '/authentication/registerMail/registerPassword/registerUserName/registerBirthday',
        queryParams: {
          'email': email,
          'password': password,
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
        email: state.uri.queryParameters['email']!,
        password: state.uri.queryParameters['password']!,
        userName: state.uri.queryParameters['user-name']!,
        birthDay: DateTime.parse(state.uri.queryParameters['birth-day']!),
      );

  String get location => GoRouteData.$location(
        '/authentication/registerMail/registerPassword/registerUserName/registerBirthday/registerGender',
        queryParams: {
          'email': email,
          'password': password,
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

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$goRouterHash() => r'4368ff8ab99ea46c977298163ba7e87c2afff647';

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
