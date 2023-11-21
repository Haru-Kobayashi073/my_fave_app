import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/app.dart';

Future<void> main() async {
  runApp(const ProviderScope(child: App()));
}
