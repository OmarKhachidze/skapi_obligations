import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    required this.iconPath,
    this.onPress,
    this.margin,
    super.key,
  });

  final VoidCallback? onPress;
  final String iconPath;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: onPress,
        icon: SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(
            context.skapiColors.black,
            BlendMode.srcIn,
          ),
        ),
        style: ButtonStyle(
          visualDensity: VisualDensity.compact,
          backgroundColor: WidgetStateProperty.all(
            context.skapiColors.grayLight,
          ),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          fixedSize: WidgetStateProperty.all(const Size(40, 40)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        iconSize: 24,
      ),
    );
  }
}
