import 'package:flutter/material.dart';
import 'package:my_fave_app/utils/utils.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith(
          (states) => Colors.white.withOpacity(0.1),
        ),
      ),
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
