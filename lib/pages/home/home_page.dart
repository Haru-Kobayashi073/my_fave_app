import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/activity/activity.dart';
import 'package:my_fave_app/features/calendar/event_loader.dart';
import 'package:my_fave_app/features/favorite/favorite.dart';
import 'package:my_fave_app/pages/home/components/home_components.dart';
import 'package:my_fave_app/widgets/widget.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteNotifier = ref.watch(favoriteProvider.notifier);
    final activityNotifier = ref.watch(activityProvider.notifier);
    final eventLoaderNotifer = ref.watch(eventLoaderProvider.notifier);

    return Scaffold(
      appBar: CommonAppBar(
        icon: IconButton(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.circleQuestion),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            StreamBuilder(
              stream: favoriteNotifier.fetch(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting &&
                    !snapshot.hasData) {
                  return const SliverToBoxAdapter(
                    child: Loading(),
                  );
                }
                final favoriteList =
                    favoriteNotifier.convertToFavoriteDataList(snapshot);
                return FavoritesView(
                  favoriteDataList: favoriteList,
                );
              },
            ),
            StreamBuilder<QuerySnapshot>(
              stream: activityNotifier.fetchActivities(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SliverToBoxAdapter(
                    child: Loading(),
                  );
                }
                if (snapshot.hasError) {
                  return const SliverToBoxAdapter(
                    child: Text('推し活の取得に失敗しました'),
                  );
                }
                final twoWeeksActivityList =
                    activityNotifier.generateTwoWeeksActivityList(snapshot);
                return ActivityView(activityList: twoWeeksActivityList);
              },
            ),
            StreamBuilder(
              stream: eventLoaderNotifer.fetch(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting &&
                    !snapshot.hasData) {
                  return const SliverToBoxAdapter(
                    child: Loading(),
                  );
                }
                final events = eventLoaderNotifer.convertToKeyValue(snapshot);
                return CalendarView(events: events);
              },
            ),
            const MapView(),
          ],
        ),
      ),
    );
  }
}
