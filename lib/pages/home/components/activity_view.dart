import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/activity/activity.dart';
import 'package:my_fave_app/models/activity_data.dart';
import 'package:my_fave_app/pages/home/components/home_components.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class ActivityView extends HookConsumerWidget {
  const ActivityView({super.key, required this.activityList});
  final List<ActivityData> activityList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activityNotifier = ref.watch(activityProvider.notifier);

    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '推し活',
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
                        AddActivityPageRoute().push<void>(context);
                      },
                      text: '追加',
                      isWhite: false,
                    ),
                  ),
                ],
              ),
              Text(
                '推し活動の記録',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.grey88,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '過去2週間の投稿',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColor.white,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 150,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 16,
                mainAxisExtent: 128,
              ),
              itemCount: activityList.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    final selectedDay = activityList[index].createdAt;
                    final selectedDateActivityList =
                        activityNotifier.generateSelectedDayActivityList(
                      activityList,
                      selectedDay!,
                    );
                    ActivityDetailPageRoute(
                      $extra: selectedDateActivityList,
                      selectedDay: selectedDay,
                    ).push<void>(context);
                  },
                  child: ActivityImage(
                    activityData: activityList[index],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
