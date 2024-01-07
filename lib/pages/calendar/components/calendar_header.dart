import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/calendar/event_loader.dart';
import 'package:my_fave_app/models/daily_schedule.dart';
import 'package:my_fave_app/utils/utils.dart';

class CalendarHeader extends HookConsumerWidget {
  const CalendarHeader({
    super.key,
    required this.yearMonthText,
    required this.events,
  });
  final String yearMonthText;
  final List<DailySchedule> events;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dsiplayEventsLatest = useToggle(false);
    final controller = useState<PersistentBottomSheetController<void>?>(null);

    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 0, 14, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            yearMonthText,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
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
                          .showLatestEventsView(context, events);
                    } else {
                      controller.value?.close();
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
                  context.push(AddSchedulePageRoute().location);
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
    );
  }
}
