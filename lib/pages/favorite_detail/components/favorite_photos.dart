import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/common_button.dart';

class FavoritePhotos extends HookWidget {
  const FavoritePhotos({super.key});

  @override
  Widget build(BuildContext context) {
    final editing = useToggle(false);

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
                          onPressed: () {},
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
                ),
                itemCount: 20,
                itemBuilder: (_, index) => Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.black15,
                        borderRadius: BorderRadius.circular(16),
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
                          onPressed: () {},
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
