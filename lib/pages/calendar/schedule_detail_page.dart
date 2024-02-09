// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/models/daily_schedule.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class ScheduleDetailPage extends HookConsumerWidget {
  const ScheduleDetailPage({super.key, required this.schedule});
  final DailySchedule schedule;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CommonAppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColor.black15,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        schedule.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          EditSchedulePageRoute($extra: schedule)
                              .push<void>(context);
                        },
                        icon: Icon(
                          Icons.more_horiz_rounded,
                          color: AppColor.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${formatDateTimeForWeekDay(schedule.start)} ${schedule.start.hour}:${schedule.start.minute}~${schedule.end?.hour}:${schedule.end?.minute}',
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: AppColor.white,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        schedule.location,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'URL',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.grey88,
                    ),
                  ),
                  Text(
                    schedule.url ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'メモ',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.grey88,
                    ),
                  ),
                  Text(
                    schedule.memo ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            CircleAvatar(
              radius: 18,
              backgroundColor: AppColor.greybb,
              child: IconButton(
                splashRadius: 1,
                alignment: Alignment.center,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(
                  Icons.close,
                  size: 22,
                  color: AppColor.black33,
                ),
                onPressed: () {
                  context.pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
