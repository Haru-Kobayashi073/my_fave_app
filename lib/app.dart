import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/pages/login/login_page.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      navigatorKey: ref.watch(navigatorKeyProvider),
      scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyProvider),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.black00,
        primaryTextTheme: Typography(platform: TargetPlatform.iOS).white,
        textTheme: Typography(platform: TargetPlatform.iOS).white,
        useMaterial3: false,
      ),
      home: const LoginPage(),
      builder: (BuildContext context, Widget? child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.noScaling),
            child: Stack(
              children: [
                if (child != null) child,
                const OverlayLoading(),
              ],
            ),
          ),
        );
      },
    );
  }
}
