import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skapi_obligations/common/constants/svg_assets.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/route_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/common/widgets/appbars/inner_appbar.dart';
import 'package:skapi_obligations/common/widgets/bottom_sheets/skapi_bottom_sheet.dart';
import 'package:skapi_obligations/common/widgets/buttons/scaffold_button.dart';
import 'package:skapi_obligations/common/widgets/expandable/skapi_expandable.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/before_payment_section/before_payment_section.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/pay_content/pay_content.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/payment_info_section/payment_info_text_section.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/payment_loans/skapi_expandable_content.dart';
import 'package:skapi_obligations/router/app_route.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});

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
      body: ListView(
        children: const [
          BeforePaymentSection(),
          PaymentInfoTextSection(),
          SizedBox(height: 16.0),
          SkapiExpandable(
            iconPath: SvgAssets.otherObligations,
            label: 'სხვა სესხები',
            subLabel: '07/07/2025',
            days: '',
            amount: 10_558.29,
            child: SkapiExpandableContent(),
          ),
          SkapiExpandable(
            iconPath: SvgAssets.otherObligations,
            label: 'სხვა სესხები',
            subLabel: '07/07/2025',
            days: '',
            amount: 10_558.29,
            child: SkapiExpandableContent(),
          ),
        ],
      ),
    );
  }
}
