import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/favorite/favorite.dart';
import 'package:my_fave_app/models/favorite_data.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/common_button.dart';

class FavoritePhotos extends HookConsumerWidget {
  const FavoritePhotos({super.key, required this.favoriteData});
  final FavoriteData favoriteData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editing = useToggle(false);
    final imageUrlList = favoriteData.photosUrlList;

    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        color: AppColor.black00,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'フォト',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: editing.toggle,
                      child: Text(
                        editing.value ? 'キャンセル' : '編集',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                    if (!editing.value)
                      Container(
                        width: 120,
                        height: 56,
                        padding: const EdgeInsets.only(left: 8),
                        child: CommonButton(
                          onPressed: () {
                            AddFavoritePhotoPageRoute(id: favoriteData.id)
                                .push<void>(context);
                          },
                          text: '追加',
                          isWhite: false,
                        ),
                      ),
                  ],
                ),
              ],
            ),
            Text(
              '推しの写真でいっぱいにしよう',
              style: TextStyle(
                fontSize: 14,
                color: AppColor.grey88,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 440,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 3,
                  mainAxisExtent: 160,
                ),
                itemCount: imageUrlList?.length ?? 0,
                itemBuilder: (_, index) => imageUrlList != null
                    ? Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            height: 200,
                            margin: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 8,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: CachedNetworkImage(
                                imageUrl: imageUrlList[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          if (editing.value)
                            CircleAvatar(
                              radius: 14,
                              backgroundColor: AppColor.greybb,
                              child: IconButton(
                                alignment: Alignment.center,
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                icon: Icon(
                                  Icons.close,
                                  size: 20,
                                  color: AppColor.black33,
                                ),
                                onPressed: () {
                                  ref
                                      .read(favoriteProvider.notifier)
                                      .deletePhoto(
                                        favoriteData.id,
                                        imageUrlList[index],
                                      );
                                },
                              ),
                            ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
