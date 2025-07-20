import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skapi_obligations/common/constants/app_constants.dart';
import 'package:skapi_obligations/common/constants/svg_assets.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/common/widgets/buttons/appbar_button.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    this.onMenuPress,
    this.onNotificationPress,
    this.onHelpPress,
  });

  final VoidCallback? onMenuPress;
  final VoidCallback? onNotificationPress;
  final VoidCallback? onHelpPress;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [getNavigationBarBoxShadow(context, const Offset(0, 4))],
      ),
      child: AppBar(
        centerTitle: true,
        elevation: 0,
        actionsPadding: EdgeInsets.zero,
        backgroundColor: context.skapiColors.white,
        shadowColor: context.skapiColors.white,
        surfaceTintColor: context.skapiColors.white,
        foregroundColor: context.skapiColors.white,
        title: SvgPicture.asset(SvgAssets.logo),
        actions: [
          AppBarButton(
            iconPath: SvgAssets.notifications,
            onPress: onMenuPress,
            margin: const EdgeInsets.only(right: 12.0),
          ),
          AppBarButton(
            margin: const EdgeInsets.only(right: 16.0),
            iconPath: SvgAssets.liveHelp,
            onPress: onHelpPress,
          ),
        ],
        leading: AppBarButton(
          margin: const EdgeInsets.only(left: 16.0),
          iconPath: SvgAssets.menu,
          onPress: onNotificationPress,
        ),
      ),
    );
  }
}
