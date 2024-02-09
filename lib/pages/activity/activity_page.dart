import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/activity/activity.dart';
import 'package:my_fave_app/pages/home/components/home_components.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class ActivityPage extends HookConsumerWidget {
  const ActivityPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activityNotifier = ref.watch(activityProvider.notifier);

    return Scaffold(
      appBar: const CommonAppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: StreamBuilder<QuerySnapshot>(
          stream: activityNotifier.fetchActivities(),
          builder: (context, activity) {
            if (activity.connectionState == ConnectionState.waiting) {
              return const Loading();
            }
            if (activity.hasError) {
              return const Center(
                child: Text('推し活の取得に失敗しました'),
              );
            }
            final todayActivityList =
                activityNotifier.generateTodayActivityList(activity);
            final twoWeeksActivityList =
                activityNotifier.generateTwoWeeksActivityList(activity);

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              text: '推し活投稿',
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
                      const SizedBox(height: 16),
                      const Text(
                        '今日の推し活',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 288,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 16,
                        mainAxisExtent: 272,
                      ),
                      itemCount: todayActivityList.length,
                      itemBuilder: (_, index) {
                        final activityData = todayActivityList[index];
                        return InkWell(
                          onTap: () {
                            ActivityDetailPageRoute(
                              $extra: todayActivityList,
                              selectedDay: DateTime.now(),
                            ).push<void>(context);
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            child: CachedNetworkImage(
                              imageUrl: activityData.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '過去2週間の投稿',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            height: 56,
                            child: CommonButton(
                              onPressed: () {
                                context.push(
                                  const PastActivityPageRoute().location,
                                );
                              },
                              text: '過去の投稿',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 150,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 16,
                        mainAxisExtent: 128,
                      ),
                      itemCount: twoWeeksActivityList.length,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {
                            final selectedDay =
                                twoWeeksActivityList[index].createdAt;
                            final selectedDateActivityList = activityNotifier
                                .generateSelectedDayActivityList(
                              twoWeeksActivityList,
                              selectedDay!,
                            );
                            ActivityDetailPageRoute(
                              $extra: selectedDateActivityList,
                              selectedDay: selectedDay,
                            ).push<void>(context);
                          },
                          child: ActivityImage(
                            activityData: twoWeeksActivityList[index],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
