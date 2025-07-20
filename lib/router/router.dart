import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/route_extension.dart';
import 'package:skapi_obligations/common/screens/empty_screen.dart';
import 'package:skapi_obligations/common/screens/main_screen.dart';
import 'package:skapi_obligations/features/obligations/presentation/obligation_screen.dart';
import 'package:skapi_obligations/features/obligations/presentation/payment_details_screen.dart';

import 'app_route.dart';

class MainRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: AppRoute.home.path,
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder:
            (
              BuildContext context,
              GoRouterState state,
              StatefulNavigationShell navigationShell,
            ) {
              return MainScreen(navigationShell: navigationShell);
            },
        branches: <StatefulShellBranch>[
          // NEW LOAN SCREEN
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoute.newLoan.path,
                pageBuilder: (context, state) => NoTransitionPage(
                  child: EmptyScreen(title: AppRoute.newLoan.label(context)),
                ),
              ),
            ],
          ),

          // LOANS SCREEN
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoute.loans.path,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: EmptyScreen(title: AppRoute.loans.label(context)),
                  );
                },
              ),
            ],
          ),

          // HOME SCREEN
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoute.home.path,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ObligationScreen()),
                routes: [
                  GoRoute(
                    path: AppRoute.payment.path,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (BuildContext context, GoRouterState state) {
                      return const PaymentDetailsScreen();
                    },
                  ),
                ],
              ),
            ],
          ),

          // TRANSFERS SCREEN
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoute.transfers.path,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: EmptyScreen(
                      title: AppRoute.transfers.label(context),
                    ),
                  );
                },
              ),
            ],
          ),

          // CURRENCY SCREEN
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoute.currency.path,
                pageBuilder: (context, state) => NoTransitionPage(
                  child: EmptyScreen(title: AppRoute.currency.label(context)),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) =>
        EmptyScreen(title: context.localization.somethingWentWrong),
  );

  static GoRouter get router => _router;
}
