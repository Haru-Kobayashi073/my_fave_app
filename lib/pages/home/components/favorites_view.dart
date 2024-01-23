import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/favorite_leveling/favorite_leveling.dart';
import 'package:my_fave_app/models/favorite_data.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class FavoritesView extends HookConsumerWidget {
  const FavoritesView({
    super.key,
    required this.favoriteDataList,
  });
  final List<FavoriteData> favoriteDataList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteLevelingNotifier =
        ref.watch(favoriteLevelingProvider.notifier);

    return favoriteDataList != <FavoriteData>[] || favoriteDataList.isNotEmpty
        ? SliverMainAxisGroup(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '推し',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      height: 56,
                      child: CommonButton(
                        onPressed: () {
                          context.push(
                            const AddFavoritePageRoute().location,
                          );
                        },
                        text: '追加',
                      ),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 8,
                ),
              ),
              SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 5,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: favoriteDataList.length,
                itemBuilder: (_, index) => InkWell(
                  onTap: () => FavoriteDetailPageRoute(favoriteIndex: index)
                      .push<void>(context),
                  borderRadius: BorderRadius.circular(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ),
                          child: AspectRatio(
                            aspectRatio: 3.3 / 4,
                            child: CachedNetworkImage(
                              imageUrl: favoriteDataList[index].imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        favoriteDataList[index].name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        '推し度',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 14),
                      FavoriteLevel(
                        favoriteLevel: favoriteLevelingNotifier.calculateLevel(
                          favoriteDataList[index].likingLevel,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        : const SliverToBoxAdapter(
            child: SizedBox(height: 8),
          );
  }
}
