import 'package:flutter/material.dart';
import 'package:my_fave_app/utils/utils.dart';

class PopUpButton extends StatelessWidget {
  const PopUpButton({
    super.key,
    required this.labelText,
    required this.child,
    required this.onPressed,
    this.visibleError = false,
  });
  final String labelText;
  final Widget child;
  final void Function() onPressed;
  final bool visibleError;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.black15,
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                side: BorderSide(
                  color: visibleError ? Colors.red : AppColor.grey88,
                ),
              ),
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 48,
                  alignment: Alignment.center,
                  child: child,
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColor.grey88,
                ),
              ],
            ),
          ),
        ),
        if (visibleError)
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              '生年月日を選択してください',
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
