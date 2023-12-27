import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/widgets/widget.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('プロフィール'),
            CommonButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              text: 'サインアウト',
            ),
          ],
        ),
      ),
    );
  }
}
