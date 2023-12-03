import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_fave_app/utils/utils.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    this.icon = const SizedBox(),
  });
  final Widget icon;

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.black00,
      actions: [icon],
      title: SvgPicture.asset(
        Assets.icons.myFaveLogo,
        width: 100,
      ),
    );
  }
}
