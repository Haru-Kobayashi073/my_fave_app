import 'package:flutter/material.dart';
import 'package:my_fave_app/utils/utils.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isWhite = true,
  });
  final void Function()? onPressed;
  final String text;
  final bool isWhite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isWhite ? AppColor.white : AppColor.black00,
          fixedSize: const Size(double.maxFinite, 50),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          side: BorderSide(
            color: AppColor.white,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isWhite ? AppColor.black00 : AppColor.white,
          ),
        ),
      ),
    );
  }
}
