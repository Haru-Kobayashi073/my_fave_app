import 'package:flutter/material.dart';
import 'package:my_fave_app/utils/constants/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final buildPageIndicatorProvider = Provider<
    List<Widget> Function(
      BuildContext context,
      int currentPage,
    )>(
  (ref) => (
    context,
    currentPage,
  ) {
    final indicator = ref.watch(indicatorProvider);
    final list = <Widget>[];
    for (var i = 0; i < 4; i++) {
      list.add(
        i == currentPage
            ? indicator.call(isActive: true, context: context)
            : indicator.call(isActive: false, context: context),
      );
    }
    return list;
  },
);

final indicatorProvider = Provider<
    Widget Function({
      required bool isActive,
      required BuildContext context,
    })>(
  (ref) => ({
    required isActive,
    required context,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.only(
        left: 8,
        right: 8,
        bottom: 28,
      ),
      height: 8,
      width: isActive ? 28.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? AppColor.white : AppColor.grey88,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  },
);
