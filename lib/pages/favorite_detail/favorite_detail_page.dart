import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/gradation/gradation.dart';
import 'package:my_fave_app/pages/favorite_detail/components/favorite_detail_components.dart';
import 'package:my_fave_app/widgets/widget.dart';

class FavoriteDetailPage extends HookConsumerWidget {
  const FavoriteDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(gradationProvider).when(
          data: (imageAndGradient) => DecoratedBox(
            decoration: BoxDecoration(gradient: imageAndGradient.gradient),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    titleSpacing: 0,
                    elevation: 0,
                    pinned: true,
                    automaticallyImplyLeading: false,
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: IconButton(
                        onPressed: () => context.pop(),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                    ),
                  ),
                  FavoriteMainDetailCard(image: imageAndGradient.image),
                ],
              ),
            ),
          ),
          loading: () => const Loading(),
          error: (e, s) {
            return Scaffold(
              body: Center(
                child: Text(e.toString()),
              ),
            );
          },
        );
  }
}
