import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:skapi_obligations/common/constants/app_constants.dart';
import 'package:skapi_obligations/common/constants/svg_assets.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/router/app_route.dart';

class CloseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CloseAppBar({
    super.key,
    required this.title,
    required this.subTitle,
    this.onClosePress,
  });

  final String title;
  final String subTitle;
  final VoidCallback? onClosePress;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [getNavigationBarBoxShadow(context, const Offset(0, 4))],
      ),
      child: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
        titleSpacing: 20,
        actionsPadding: EdgeInsets.zero,
        backgroundColor: context.skapiColors.white,
        surfaceTintColor: context.skapiColors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.skapiTextStyles.h3.copyWith(
                color: context.skapiColors.black,
              ),
            ),
            Text(
              subTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.skapiTextStyles.tinyText.copyWith(
                color: context.skapiColors.black,
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () => context.go(AppRoute.home.path),
            child: Container(
              height: 32,
              width: 32,
              margin: const EdgeInsets.only(right: 20.0),
              child: SvgPicture.asset(
                SvgAssets.close,
                colorFilter: ColorFilter.mode(
                  context.skapiColors.grayDark,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
