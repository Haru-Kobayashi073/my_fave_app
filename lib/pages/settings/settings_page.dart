import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/authentication/sign_out.dart';
import 'package:my_fave_app/features/user/delete_user.dart';
import 'package:my_fave_app/utils/utils.dart';
import 'package:my_fave_app/widgets/widget.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(getFirebaseAuthProvider).currentUser!;

    return Scaffold(
      appBar: const CommonAppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '設定',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            if (!user.isAnonymous)
              ListTile(
                contentPadding: EdgeInsets.zero,
                minLeadingWidth: 16,
                leading: Icon(
                  Icons.key_rounded,
                  color: AppColor.white,
                ),
                title: const Text(
                  'アカウントの再設定',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.white,
                ),
                onTap: () {
                  context.push(
                    const ReconfigurationMailPageRoute(
                      isReconfigurationForCertifier: true,
                    ).location,
                  );
                },
              ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              minLeadingWidth: 16,
              leading: Icon(
                Icons.person,
                color: AppColor.white,
              ),
              title: Text(
                user.isAnonymous ? '登録' : 'ログアウト',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: AppColor.white,
              ),
              onTap: () async {
                if (user.isAnonymous) {
                  final willNavigate = await showDialog<bool>(
                    context: context,
                    builder: (_) => const CancelModal(
                      title: '未ログインの状態で作成したデータも引き継がれます\n登録画面に移動しますか？',
                    ),
                  );
                  if (willNavigate != true) {
                    return;
                  }
                  if (!context.mounted) {
                    return;
                  }
                  await context.push(
                    const RegisterMailPageRoute().location,
                  );
                  return;
                }
                final willLogout = await showDialog<bool>(
                  context: context,
                  builder: (_) => const CancelModal(
                    title: 'ログアウトしますか？',
                  ),
                );
                if (willLogout != true) {
                  return;
                }
                ref.read(
                  signOutProvider(
                    () {
                      context.go(AuthenticationPageRoute().location);
                    },
                  ),
                );
              },
            ),
            if (!user.isAnonymous)
              ListTile(
                contentPadding: EdgeInsets.zero,
                minLeadingWidth: 16,
                leading: Icon(
                  Icons.delete,
                  color: AppColor.white,
                ),
                title: const Text(
                  'アカウントの削除',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.white,
                ),
                onTap: () async {
                  final willdelete = await showDialog<bool>(
                    context: context,
                    builder: (_) => const CancelModal(
                      title: 'アカウントを削除しますか？',
                    ),
                  );
                  if (willdelete != true) {
                    return;
                  }
                  ref.read(
                    delteUserProvider(
                      () {
                        ref.read(
                          signOutProvider(
                            () {
                              context.go(AuthenticationPageRoute().location);
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
