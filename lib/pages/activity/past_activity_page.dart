// ignore_for_file: lines_longer_than_80_chars

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:my_fave_app/features/activity/activity.dart';
import 'package:my_fave_app/features/calendar/calendar.dart';
import 'package:my_fave_app/models/activity_data.dart';
import 'package:my_fave_app/pages/activity/components/activity_components.dart';
import 'package:my_fave_app/pages/home/components/home_components.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';
import 'package:table_calendar/table_calendar.dart';

class PastActivityPage extends HookConsumerWidget {
  const PastActivityPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(calendarProvider);
    final calendarNotifier = ref.watch(calendarProvider.notifier);
    final activityNotifier = ref.watch(activityProvider.notifier);

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
            final map = activityNotifier.generateActivityMap(activity);
            final likedActivityList =
                activityNotifier.generateLikedActivityList(activity);
            return CustomScrollView(
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
                          const Text(
                            '過去の投稿',
                            style: TextStyle(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32),
                      const Text(
                        'お気に入り',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 244,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 16,
                            mainAxisExtent: 190,
                          ),
                          itemCount: likedActivityList.length,
                          itemBuilder: (_, index) {
                            return ActivityImage(
                              displayIsLike: true,
                              activityData: likedActivityList[index],
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColor.black15,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TableCalendar<ActivityData>(
                      focusedDay: selectedDay,
                      firstDay: DateTime(DateTime.now().year - 30),
                      lastDay: DateTime(DateTime.now().year + 5),
                      selectedDayPredicate: (day) {
                        return isSameDay(selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        final date = DateTime(
                          selectedDay.year,
                          selectedDay.month,
                          selectedDay.day,
                          9,
                        );
                        ref
                            .read(calendarProvider.notifier)
                            .selectedDate(selectedDay);
                        if (map[date] == null) {
                          return;
                        }
                        ActivityDetailPageRoute(
                          $extra: map[date]!,
                          selectedDay: selectedDay,
                        ).push<void>(context);
                      },
                      eventLoader: (date) {
                        final formattedDate = date.toLocal();
                        return map[formattedDate] ?? [];
                      },
                      onPageChanged: (focusedDay) {
                        if (focusedDay != selectedDay) {
                          focusedDay.isBefore(selectedDay)
                              ? calendarNotifier.switchToPreviousMonth()
                              : calendarNotifier.switchToNextMonth();
                        }
                      },
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                        leftChevronVisible: false,
                        rightChevronVisible: false,
                      ),
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                        weekendStyle: TextStyle(
                          color: AppColor.grey88,
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                      rowHeight: 72,
                      calendarBuilders: CalendarBuilders(
                        headerTitleBuilder: (_, date) {
                          final text = const HeaderStyle()
                                  .titleTextFormatter
                                  ?.call(date, 'en') ??
                              DateFormat.yMMMM('en').format(date);
                          return ActivityCalendarHeader(
                            yearMonthText: text,
                          );
                        },
                        todayBuilder: (_, date, focusedDay) {
                          return Center(
                            child: CircleAvatar(
                              backgroundColor: AppColor.white,
                              child: Text(
                                date.day.toString(),
                                style: TextStyle(
                                  color: AppColor.black00,
                                ),
                              ),
                            ),
                          );
                        },
                        selectedBuilder: (_, date, focusedDay) {
                          return Center(
                            child: isSameDay(
                              DateTime.now(),
                              date,
                            )
                                ? CircleAvatar(
                                    backgroundColor: AppColor.white,
                                    child: Text(
                                      date.day.toString(),
                                      style: TextStyle(
                                        color: AppColor.black00,
                                      ),
                                    ),
                                  )
                                : Text(
                                    date.day.toString(),
                                  ),
                          );
                        },
                        markerBuilder: (_, date, events) {
                          return events.isNotEmpty &&
                                  !isSameDay(date, DateTime.now())
                              ? Center(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: AppColor.white,
                                          ),
                                          image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                              events[0].imageUrl,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        date.day.toString(),
                                        style: TextStyle(
                                          color: AppColor.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox();
                        },
                      ),
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
