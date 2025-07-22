import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/route_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/common/widgets/appbars/inner_appbar.dart';
import 'package:skapi_obligations/common/widgets/bottom_sheets/skapi_bottom_sheet.dart';
import 'package:skapi_obligations/common/widgets/buttons/scaffold_button.dart';
import 'package:skapi_obligations/features/obligations/domain/models/common_obligation/upcoming_payment_item.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/before_payment_section/before_payment_section.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/loans_details_section/loans_details_section.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/pay_content/pay_content.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/payment_info_section/payment_info_text_section.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/transaction_details_gold_section/transaction_details_gold_section.dart';
import 'package:skapi_obligations/router/app_route.dart';

import '../domain/models/common_obligation/upcoming_payment.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key, this.paymentData = false});

  final dynamic paymentData;

  @override
  Widget build(BuildContext context) {
    final amount = (paymentData is UpcomingPaymentItem)
        ? (paymentData as UpcomingPaymentItem).paymentAmount
        : (paymentData as UpcomingPayment).paymentAmount;
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
              context.pop();
              context.replace(
                '${AppRoute.home.path}/${AppRoute.payment.path}/${AppRoute.success.path}',
                extra: (
                  context.localization.successPaymentDescription(amount),
                  amount,
                ),
              );
            },
            children: PayContent(amount: amount),
          ).show(context);
        },
      ),
      body: Column(
        children: [
          BeforePaymentSection(paymentData: paymentData),
          const PaymentInfoTextSection(),
          const SizedBox(height: 16.0),
          if (paymentData is UpcomingPayment)
            LoansDetailsSection(upcomingPayment: paymentData),
          if (paymentData is UpcomingPaymentItem)
            TransactionDetailsGoldSection(upcomingPayment: paymentData),
        ],
      ),
    );
  }
}
