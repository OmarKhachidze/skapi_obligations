import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/route_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/common/widgets/appbars/inner_appbar.dart';
import 'package:skapi_obligations/common/widgets/bottom_sheets/skapi_bottom_sheet.dart';
import 'package:skapi_obligations/common/widgets/buttons/scaffold_button.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/before_payment_section/before_payment_section.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/loans_details_section/loans_details_section.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/pay_content/pay_content.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/payment_info_section/payment_info_text_section.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/transaction_details_gold_section/transaction_details_gold_section.dart';
import 'package:skapi_obligations/router/app_route.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key, this.goldObligation = false});

  final bool goldObligation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.skapiColors.grayLight,
      appBar: InnerAppBar(
        title: AppRoute.payment.label(context),
        subTitle: AppRoute.home.label(context),
      ),
      bottomNavigationBar: ScaffoldButton(
        label: context.localization.pay,
        onPress: () {
          DefaultBottomSheet(
            label: context.localization.pay,
            buttonLabel: context.localization.pay,
            onPress: () {
              context.push(
                '${AppRoute.home.path}/${AppRoute.payment.path}/${AppRoute.success.path}',
              );
            },
            children: const PayContent(amount: 541.05),
          ).show(context);
        },
      ),
      body: Column(
        children: [
          const BeforePaymentSection(),
          const PaymentInfoTextSection(),
          const SizedBox(height: 16.0),
          if (!goldObligation) const LoansDetailsSection(),
          if (goldObligation) const TransactionDetailsGoldSection(),
        ],
      ),
    );
  }
}
