import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_fave_app/utils/utils.dart';

class DatePickerWrapper extends HookWidget {
  const DatePickerWrapper({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.black15,
      ),
      width: context.deviceWidth,
      height: context.deviceHeight * 0.3,
      child: SafeArea(
        top: false,
        child: child,
      ),
    );
  }
}
