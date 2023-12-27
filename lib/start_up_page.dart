import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/authentication/get_auth_state.dart';
import 'package:my_fave_app/pages/authentication/authentication_page.dart';
import 'package:my_fave_app/pages/home/home_page.dart';
import 'package:my_fave_app/widgets/widget.dart';

class StartUpPage extends ConsumerWidget {
  const StartUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(getAuthStateProvider);

    return Scaffold(
      body: user.when(
        data: (user) => user != null
            ? const HomePage()
            : const AuthenticationPage(),
        error: (_, stackTrace) => const SizedBox(),
        loading: () => const Loading(),
      ),
    );
  }

  // Future<void> switchPage(WidgetRef ref, BuildContext context) async {
  //   // ignore: deprecated_member_use
  //   final user = ref.watch(getAuthStateProvider.stream).next();
  //   await user.then((user) async {
  //     if (user != null) {
  //       if (!context.mounted) {
  //         return;
  //       }
  //       await NoAnimationRoute.pushReplacement<void>(
  //         context,
  //         const MyHomePage(title: ''),
  //       );
  //     } else {
  //       if (!context.mounted) {
  //         return;
  //       }
  //       await NoAnimationRoute.pushReplacement<void>(
  //         context,
  //         const AuthenticationPage(),
  //       );
  //     }
  //   });
  // }
}
