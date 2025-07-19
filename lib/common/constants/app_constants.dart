// Navigation Bar
import 'package:flutter/cupertino.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

const navigationBarHeight = 60.0;
const navigationBarItemHeight = 44.0;

BoxShadow getNavigationBarBoxShadow(BuildContext context, Offset offset) {
  return BoxShadow(
    color: context.skapiColors.black.withValues(alpha: 0.25),
    offset: offset,
    blurRadius: 4,
    spreadRadius: 0,
  );
}
