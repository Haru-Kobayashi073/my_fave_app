import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MapPage extends HookConsumerWidget {
  const MapPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('聖地巡礼'),
      ),
      body: const Center(
        child: Text('聖地巡礼'),
      ),
    );
  }
}
