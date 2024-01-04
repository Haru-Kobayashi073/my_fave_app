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
      $profilePageRoute,
      $favoriteDetailPageRoute,
      $addFavoritePageRoute,
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
          navigatorKey: ProfileBranch.$navigatorKey,
          routes: [
            GoRouteData.$route(
              path: '/profile',
              factory: $ProfilePageRouteExtension._fromState,
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

extension $ProfilePageRouteExtension on ProfilePageRoute {
  static ProfilePageRoute _fromState(GoRouterState state) =>
      const ProfilePageRoute();

  String get location => GoRouteData.$location(
        '/profile',
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
      const ReconfigurationMailPageRoute();

  String get location => GoRouteData.$location(
        '/reconfigurationMail',
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
      );

  String get location => GoRouteData.$location(
        '/reconfigurationMail/confirmationMail',
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

RouteBase get $profilePageRoute => GoRouteData.$route(
      path: '/profile',
      factory: $ProfilePageRouteExtension._fromState,
    );

RouteBase get $favoriteDetailPageRoute => GoRouteData.$route(
      path: '/favoriteDetail',
      factory: $FavoriteDetailPageRouteExtension._fromState,
    );

extension $FavoriteDetailPageRouteExtension on FavoriteDetailPageRoute {
  static FavoriteDetailPageRoute _fromState(GoRouterState state) =>
      FavoriteDetailPageRoute(
        imgUrl: state.uri.queryParameters['img-url']!,
      );

  String get location => GoRouteData.$location(
        '/favoriteDetail',
        queryParams: {
          'img-url': imgUrl,
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

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$goRouterHash() => r'cbcb9140dab18bcc86d1e72d4a6152b2c46f8561';

/// See also [goRouter].
@ProviderFor(goRouter)
final goRouterProvider = AutoDisposeProvider<GoRouter>.internal(
  goRouter,
  name: r'goRouterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$goRouterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GoRouterRef = AutoDisposeProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
