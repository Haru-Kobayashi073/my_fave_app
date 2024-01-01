import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class FavoritesView extends HookConsumerWidget {
  const FavoritesView({super.key, required this.imgUrlList});
  final List<String> imgUrlList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverMainAxisGroup(
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
          itemCount: 4,
          itemBuilder: (_, index) => InkWell(
            onTap: () => context.push(
              FavoriteDetailPageRoute(
                imgUrl: imgUrlList[index],
              ).location,
            ),
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
                        imageUrl: imgUrlList[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'New Jeans',
                  style: TextStyle(
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
                Row(
                  children: List.generate(
                    4,
                    (index) => Container(
                      width: 25,
                      height: 4,
                      margin: const EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                        color: index == 0 ? AppColor.green : AppColor.grey88,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
