// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/calendar/event_loader.dart';
import 'package:my_fave_app/models/daily_schedule.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarDetailPage extends HookConsumerWidget {
  const CalendarDetailPage({
    super.key,
    required this.events,
    required this.selectedDate,
  });
  final List<DailySchedule> events;
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dsiplayEventsLatest = useToggle(false);
    final controller = useState<PersistentBottomSheetController<void>?>(null);

    useEffect(
      () {
        if (ref.read(displayLatestEventsViewProvider.notifier).state) {
          controller.value?.closed.then((value) {
            ref.read(displayLatestEventsViewProvider.notifier).state = false;
          });
        }
        return null;
      },
      [controller.value],
    );

    return Scaffold(
      appBar: const CommonAppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                      '${selectedDate.month}月${selectedDate.day}日',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: dsiplayEventsLatest.value
                          ? AppColor.white
                          : AppColor.black00,
                      child: IconButton(
                        onPressed: () {
                          dsiplayEventsLatest.toggle();
                          if (dsiplayEventsLatest.value) {
                            controller.value = ref
                                .read(eventLoaderProvider.notifier)
                                .showLatestEventsView(
                                  context,
                                  events,
                                );
                            ref
                                .read(displayLatestEventsViewProvider.notifier)
                                .state = true;
                          } else {
                            controller.value?.close();
                            ref
                                .read(displayLatestEventsViewProvider.notifier)
                                .state = false;
                          }
                        },
                        icon: Icon(
                          Icons.article_outlined,
                          color: dsiplayEventsLatest.value
                              ? AppColor.black00
                              : AppColor.white,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        splashRadius: 20,
                      ),
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: AppColor.white,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      splashRadius: 20,
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      onPressed: () {
                        context.push(
                          AddSchedulePageRoute(
                            selectedDate: DateTime.utc(
                              selectedDate.year,
                              selectedDate.month,
                              selectedDate.day,
                            ),
                          ).location,
                        );
                      },
                      icon: Icon(
                        Icons.add,
                        color: AppColor.white,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      splashRadius: 20,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: events
                    .where((element) => isSameDay(element.start, selectedDate))
                    .length,
                itemBuilder: (context, index) {
                  final event = events
                      .where(
                        (element) => isSameDay(element.start, selectedDate),
                      )
                      .toList()[index];
                  final startDate = event.start;
                  final endDate = event.end ?? event.start;
                  return InkWell(
                    onTap: () {
                      ScheduleDetailPageRoute($extra: event)
                          .push<void>(context);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 152,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 24),
                      decoration: BoxDecoration(
                        color: AppColor.black15,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text(
                            event.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${formatDateTimeForWeekDay(startDate)} ${startDate.hour}:${startDate.minute}~${endDate.hour}:${endDate.minute}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
