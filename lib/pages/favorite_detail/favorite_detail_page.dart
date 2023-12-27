import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/gradation/gradation.dart';
import 'package:my_fave_app/pages/favorite_detail/components/favorite_detail_components.dart';
import 'package:my_fave_app/pages/favorite_detail/components/favorite_photos.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class FavoriteDetailPage extends HookConsumerWidget {
  const FavoriteDetailPage({super.key, required this.imgUrl});
  final String imgUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(gradationProvider(imgUrl)).when(
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
                  const FavoritePhotos(),
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
  }
}
