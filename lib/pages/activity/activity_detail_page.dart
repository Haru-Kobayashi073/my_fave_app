// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/models/activity_data.dart';
import 'package:my_fave_app/pages/activity/components/activity_main_image.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class AcctivityDetailPage extends HookConsumerWidget {
  const AcctivityDetailPage({
    super.key,
    required this.activityDataList,
    required this.selectedDay,
  });
  final List<ActivityData> activityDataList;
  final DateTime selectedDay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CommonAppBar(
        icon: IconButton(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.circleQuestion),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColor.white,
                        ),
                        splashRadius: 20,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${selectedDay.month}/${selectedDay.day} (${'日月火水木金土'[selectedDay.weekday]})',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 120,
                    height: 56,
                    child: CommonButton(
                      onPressed: () {
                        AddActivityPageRoute().push<void>(context);
                      },
                      text: '推し活投稿',
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 320,
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 16,
                    mainAxisExtent: 272,
                  ),
                  itemCount: activityDataList.length,
                  itemBuilder: (_, index) => ActivityMainImage(
                    activityData: activityDataList[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
