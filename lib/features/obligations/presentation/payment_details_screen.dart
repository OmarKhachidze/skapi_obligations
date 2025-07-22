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

class PaymentDetailsScreen extends StatefulWidget {
  const PaymentDetailsScreen({super.key, this.paymentData = false});

  final dynamic paymentData;

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  final ValueNotifier<bool> _payButtonNotifier = ValueNotifier(true);

  UpcomingPaymentItem? selectedItem;
  double? get paymentAmount => selectedItem?.paymentAmount;

  bool get isOtherPayment => widget.paymentData is UpcomingPayment;
  bool get isGoldPayment => widget.paymentData is UpcomingPaymentItem;

  @override
  void initState() {
    super.initState();
    if (isGoldPayment) {
      selectedItem = widget.paymentData as UpcomingPaymentItem;
    } else if (isOtherPayment) {
      selectedItem = (widget.paymentData as UpcomingPayment).items.firstOrNull;
    }
  }

  @override
  void dispose() {
    _payButtonNotifier.dispose();
    super.dispose();
  }

  void _showPaymentSheet(BuildContext context) {
    if (paymentAmount == null) return;
    final description = isGoldPayment
        ? context.localization.successPaymentGoldDescription(
            paymentAmount ?? 0.00,
          )
        : context.localization.successPaymentOtherDescription(
            paymentAmount ?? 0.00,
          );

    DefaultBottomSheet(
      label: context.localization.pay,
      buttonLabel: context.localization.pay,
      buttonNotifier: _payButtonNotifier,
      loadable: true,
      onPress: () async {
        await _simulateSuccessRequest();
        _navigateToSuccess(description);
      },
      children: PayContent(amount: paymentAmount ?? 0.00),
    ).show(context, isDismissible: false);
  }

  Future<void> _simulateSuccessRequest() async {
    _payButtonNotifier.value = false;
    await Future.delayed(const Duration(seconds: 2));
  }

  void _navigateToSuccess(String description) {
    context.pop();
    context.replace(
      '${AppRoute.home.path}/${AppRoute.payment.path}/${AppRoute.success.path}',
      extra: (description, paymentAmount),
    );
  }

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
        onPress: () => _showPaymentSheet(context),
      ),
      body: Column(
        children: [
          BeforePaymentSection(paymentData: widget.paymentData),
          const PaymentInfoTextSection(),
          const SizedBox(height: 16.0),
          if (isOtherPayment)
            LoansDetailsSection(
              upcomingPayment: widget.paymentData,
              onItemChange: (item) => selectedItem = item,
            ),
          if (isGoldPayment)
            TransactionDetailsGoldSection(upcomingPayment: widget.paymentData),
        ],
      ),
    );
  }
}
