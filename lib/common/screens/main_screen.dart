import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:skapi_obligations/common/constants/svg_assets.dart';
import 'package:skapi_obligations/common/extension/route_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/router/app_route.dart';

import '../constants/app_constants.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({required this.navigationShell, Key? key})
    : super(key: key ?? const ValueKey('MainScreen'));

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(index, initialLocation: index == 0);
  }

  Widget _buildHomeDestination(BuildContext context, bool isSelected) {
    final theme = context.skapiColors;
    return GestureDetector(
      onTap: () => _goBranch(AppRoute.home.index),
      child: Container(
        height: navigationBarItemHeight,
        width: navigationBarItemHeight,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isSelected ? theme.primary : theme.grayLight,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          isSelected ? SvgAssets.homeEnabled : SvgAssets.homeDisabled,
          colorFilter: ColorFilter.mode(
            isSelected ? theme.white : theme.grayMedium,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  Widget _buildDestination(BuildContext context, AppRoute route) {
    final theme = context.skapiColors;
    final isSelected = route.index == navigationShell.currentIndex;

    return GestureDetector(
      onTap: () => _goBranch(route.index),
      child: Container(
        height: navigationBarItemHeight,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (route.icon != null)
              SvgPicture.asset(
                route.icon!,
                colorFilter: ColorFilter.mode(
                  isSelected ? theme.primary : theme.grayMedium,
                  BlendMode.srcIn,
                ),
              ),
            Expanded(
              child: Text(
                route.label(context),
                textAlign: TextAlign.center,
                style: context.skapiTextStyles.tinyText.copyWith(
                  color: isSelected ? theme.primary : theme.grayMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.skapiColors;
    final currentIndex = navigationShell.currentIndex;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [getNavigationBarBoxShadow(context, const Offset(0, -4))],
          border: Border(
            top: BorderSide(color: context.skapiColors.grayLight, width: 1.0),
          ),
        ),
        child: NavigationBar(
          height: navigationBarHeight,
          backgroundColor: theme.white,
          selectedIndex: currentIndex,
          indicatorColor: Colors.transparent,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
            final isSelected = states.contains(WidgetState.selected);
            return context.skapiTextStyles.tinyText.copyWith(
              color: isSelected ? theme.primary : theme.grayDark,
            );
          }),
          destinations: AppRoute.values.where((e) => e.main).map((route) {
            final isHome = route == AppRoute.home;
            final isSelected = currentIndex == route.index;
            return isHome
                ? _buildHomeDestination(context, isSelected)
                : _buildDestination(context, route);
          }).toList(),
          onDestinationSelected: _goBranch,
        ),
      ),
    );
  }
}
