import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/authentication/get_auth_state.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class StartUpPage extends HookConsumerWidget {
  const StartUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(getAuthStateProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      user.when(
        data: (user) {
          if (user != null) {
            context.go(const HomePageRoute().location);
          } else {
            context.go(AuthenticationPageRoute().location);
          }
        },
        error: (e, s) => const SizedBox(),
        loading: () => const Loading(),
      );
    });

    return const Scaffold(
      body: Loading(),
    );
  }
}
