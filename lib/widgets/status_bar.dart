import 'package:flutter/material.dart';
import 'package:my_fave_app/utils/utils.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({super.key, required this.phaseIndex});
  final int phaseIndex;

  @override
  Widget build(BuildContext context) {
    final contentWidth = context.deviceWidth - 32 * 2;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            height: 3,
            width: contentWidth / 8 * phaseIndex,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColor.white,
            ),
          ),
          Expanded(
            child: Container(
              height: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColor.grey88,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
