import 'package:flutter/material.dart';
import 'package:my_fave_app/utils/utils.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        'スキップ',
        style: TextStyle(
          fontSize: 14,
          color: AppColor.white,
        ),
      ),
    );
  }
}
