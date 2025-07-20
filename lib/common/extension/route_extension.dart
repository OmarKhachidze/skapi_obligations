import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/constants/svg_assets.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import '../../router/app_route.dart';

extension RouteExtension on AppRoute {
  String label(BuildContext context) {
    switch (this) {
      case AppRoute.newLoan:
        return context.localization.navigationLabelNewLoan;
      case AppRoute.loans:
        return context.localization.navigationLabelLoans;
      case AppRoute.home:
        return context.localization.navigationLabelHome;
      case AppRoute.transfers:
        return context.localization.navigationLabelTransactions;
      case AppRoute.currency:
        return context.localization.navigationLabelCurrency;
      case AppRoute.payment:
        return context.localization.paymentDetailsDebtPayment;
    }
  }

  String? get icon {
    switch (this) {
      case AppRoute.home:
        return SvgAssets.homeEnabled;
      case AppRoute.loans:
        return SvgAssets.loans;
      case AppRoute.newLoan:
        return SvgAssets.newLoan;
      case AppRoute.transfers:
        return SvgAssets.transfers;
      case AppRoute.currency:
        return SvgAssets.currency;
      default:
        return null;
    }
  }
}
