import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/favorite/favorite.dart';
import 'package:my_fave_app/features/gradation/gradation.dart';
import 'package:my_fave_app/pages/favorite_detail/components/favorite_detail_components.dart';
import 'package:my_fave_app/pages/favorite_detail/components/favorite_photos.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class FavoriteDetailPage extends HookConsumerWidget {
  const FavoriteDetailPage({super.key, required this.favoriteIndex});
  final int favoriteIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteNotifier = ref.watch(favoriteProvider.notifier);

    return StreamBuilder(
      stream: favoriteNotifier.fetch(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            !snapshot.hasData) {
          return const Loading();
        }
        final favoriteList =
            favoriteNotifier.convertToFavoriteDataList(snapshot);
        return ref
            .watch(gradationProvider(favoriteList[favoriteIndex].imageUrl))
            .when(
              data: (gradient) => DecoratedBox(
                decoration: BoxDecoration(gradient: gradient),
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
                      FavoriteMainDetailCard(
                        favoriteData: favoriteList[favoriteIndex],
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          width: double.infinity,
                          height: context.deviceHeight * 0.1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                AppColor.black00,
                              ],
                              stops: const [
                                0.1,
                                1.0,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                      FavoritePhotos(favoriteData: favoriteList[favoriteIndex]),
                      SliverToBoxAdapter(
                        child: Container(
                          width: double.infinity,
                          height: context.deviceHeight * 0.1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                AppColor.black00,
                              ],
                              stops: const [
                                0.0,
                                0.9,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ),
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
      },
    );
  }
}
