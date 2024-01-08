import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/calendar/event_loader.dart';
import 'package:my_fave_app/models/daily_schedule.dart';
import 'package:my_fave_app/pages/home/components/calendar_daily_card.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class CalendarView extends HookConsumerWidget {
  const CalendarView({super.key, required this.events});
  final Map<DateTime, List<DailySchedule>> events;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    'カレンダー',
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
                        context.push(AddSchedulePageRoute().location);
                      },
                      text: '追加',
                      isWhite: false,
                    ),
                  ),
                ],
              ),
              Text(
                '今後の予定',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.grey88,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 180,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 16,
                mainAxisExtent: 152,
              ),
              itemCount: ref
                  .read(eventLoaderProvider.notifier)
                  .getScheduleForNext31Days(events)
                  .length,
              itemBuilder: (_, index) {
                final schedule = ref
                    .read(eventLoaderProvider.notifier)
                    .getScheduleForNext31Days(events)[index];
                return CalendarDailyCard(schedule: schedule);
              },
            ),
          ),
        ),
      ],
    );
  }
}
