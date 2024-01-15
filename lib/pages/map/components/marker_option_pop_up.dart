import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_fave_app/features/google_map_marker/google_map_marker.dart';
import 'package:my_fave_app/utils/utils.dart';

class MarkerOptionPopUp extends HookConsumerWidget {
  const MarkerOptionPopUp({
    super.key,
    required this.onPressedEdit,
    required this.onPressedDelete,
  });
  final void Function() onPressedEdit;

  final void Function() onPressedDelete;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      icon: Icon(
        Icons.more_horiz_rounded,
        color: AppColor.white,
      ),
      color: AppColor.black33,
      offset: const Offset(50, 40),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            value: MarkerOption.edit,
            onTap: onPressedEdit,
            child: Text(
              MarkerOption.edit.title,
              style: TextStyle(
                fontSize: 16,
                color: AppColor.white,
              ),
            ),
          ),
          const PopupMenuItem<void>(
            padding: EdgeInsets.zero,
            height: 2,
            child: Divider(
              color: Colors.grey,
            ),
          ),
          PopupMenuItem(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            height: 5,
            value: MarkerOption.delete,
            onTap: onPressedDelete,
            child: Text(
              MarkerOption.delete.title,
              style: TextStyle(
                fontSize: 16,
                color: AppColor.red,
              ),
            ),
          ),
        ];
      },
    );
  }
}
