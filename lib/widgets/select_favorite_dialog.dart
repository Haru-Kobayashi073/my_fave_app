import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/models/favorite_data.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class SelectFavoriteDialog extends HookConsumerWidget {
  const SelectFavoriteDialog({super.key, required this.favoriteDataList});
  final List<FavoriteData> favoriteDataList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedValue = useState<int?>(null);

    return AlertDialog(
      backgroundColor: AppColor.black15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: const EdgeInsets.all(16),
      title: const Text(
        '誰の推し活ですか？',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      content: SizedBox(
        width: double.maxFinite,
        height: 336,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 16,
                  childAspectRatio: 3 / 5,
                  mainAxisExtent: 148,
                ),
                itemCount: favoriteDataList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16),
                        ),
                        child: Image(
                          image: CachedNetworkImageProvider(
                            favoriteDataList[index].imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      RadioListTile(
                        value: index,
                        groupValue: selectedValue.value,
                        onChanged: (value) {
                          selectedValue.value = value;
                        },
                        fillColor: MaterialStateProperty.all(
                          AppColor.white,
                        ),
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          favoriteDataList[index].name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            CommonButton(
              onPressed: () {
                if (selectedValue.value != null) {
                  context.pop(favoriteDataList[selectedValue.value!].id);
                } else {
                  ref
                      .read(scaffoldMessengerServiceProvider)
                      .showExceptionSnackBar('推しを選択してください');
                }
              },
              text: '投稿する',
            ),
            CommonButton(
              onPressed: () {
                context.pop();
              },
              text: '戻る',
              isWhite: false,
            ),
          ],
        ),
      ),
    );
  }
}
