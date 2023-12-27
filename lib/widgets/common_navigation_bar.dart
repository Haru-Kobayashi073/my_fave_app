import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_fave_app/utils/utils.dart';

class CommonNavigationBar extends StatelessWidget {
  const CommonNavigationBar({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.home,
              color: AppColor.white,
            ),
            label: 'ホーム',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.calendar_today,
              color: AppColor.white,
            ),
            label: 'カレンダー',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.favorite_border,
              color: AppColor.white,
            ),
            label: '推し活',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.map_outlined,
              color: AppColor.white,
            ),
            label: '聖地巡礼',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person,
              color: AppColor.white,
            ),
            label: 'プロフィール',
          ),
        ],
        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        elevation: 0,
        backgroundColor: AppColor.black00,
        indicatorColor: AppColor.white.withOpacity(0.2),
      ),
    );
  }
}
