import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skapi_obligations/common/constants/app_constants.dart';
import 'package:skapi_obligations/common/constants/svg_assets.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/common/widgets/buttons/appbar_button.dart';

class InnerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const InnerAppBar({
    super.key,
    required this.title,
    required this.subTitle,
    this.onBackPress,
  });

  final String title;
  final String subTitle;
  final VoidCallback? onBackPress;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [getNavigationBarBoxShadow(context, const Offset(0, 4))],
      ),
      child: AppBar(
        centerTitle: false,
        elevation: 0,
        titleSpacing: 12,
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
        leading: AppBarButton(
          margin: const EdgeInsets.only(left: 16.0),
          iconPath: SvgAssets.arrowLeft,
          onPress:
              onBackPress ??
              () {
                context.pop();
              },
        ),
      ),
    );
  }
}
