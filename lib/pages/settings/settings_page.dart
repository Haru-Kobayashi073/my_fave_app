import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/authentication/sign_out.dart';
import 'package:my_fave_app/features/user/delete_user.dart';
import 'package:my_fave_app/utils/constants/constants.dart';
import 'package:my_fave_app/utils/routes/routes.dart';
import 'package:my_fave_app/widgets/widget.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            ListTile(
              contentPadding: EdgeInsets.zero,
              minLeadingWidth: 16,
              leading: Icon(
                Icons.person,
                color: AppColor.white,
              ),
              title: const Text(
                'ログアウト',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: AppColor.white,
              ),
              onTap: () async {
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
