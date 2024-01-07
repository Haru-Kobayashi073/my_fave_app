import 'package:flutter/material.dart';
import 'package:my_fave_app/utils/constants/app_color.dart';

class InputDecorationStyles {
  InputDecorationStyles._();
  static InputDecoration topSemiCircle(String hintText) {
    return InputDecoration(
      fillColor: AppColor.black15,
      filled: true,
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: 16,
        color: AppColor.grey88,
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      contentPadding: const EdgeInsets.all(16),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        borderSide: BorderSide.none,
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        borderSide: BorderSide.none,
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
    );
  }

  static InputDecoration bottomSemiCircle(String hintText) {
    return InputDecoration(
      fillColor: AppColor.black15,
      filled: true,
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: 16,
        color: AppColor.grey88,
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      contentPadding: const EdgeInsets.all(16),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        borderSide: BorderSide.none,
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        borderSide: BorderSide.none,
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
    );
  }
}
