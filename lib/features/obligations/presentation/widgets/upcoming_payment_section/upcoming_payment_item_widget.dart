import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skapi_obligations/common/constants/svg_assets.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/common/widgets/money_text/money_text.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/upcoming_payment_section/upcoming_payment_icon.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/upcoming_payment_section/upcoming_payment_label_pay_day.dart';

class UpcomingPaymentItemWidget extends StatelessWidget {
  const UpcomingPaymentItemWidget({
    required this.label,
    required this.iconPath,
    required this.days,
    required this.amount,
    required this.onPress,
    this.hasPassed = false,
    super.key,
  });

  final String label;
  final String iconPath;
  final int days;
  final double amount;
  final bool hasPassed;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.skapiColors.grayVeryLight,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onPress,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
          child: Row(
            children: [
              UpcomingPaymentIcon(iconPath: iconPath, hasPassed: hasPassed),
              const SizedBox(width: 10),
              UpcomingPaymentLabelPayDay(
                subLabel: hasPassed
                    ? context.localization.obligationsUpcomingPaymentsPass
                    : context.localization.obligationsUpcomingPaymentsPayment,
                label: label,
                days:
                    '$days ${hasPassed ? context.localization.day : context.localization.days}',
                hasPassed: hasPassed,
              ),
              MoneyText(
                amount: amount,
                amountTextStyle: context.skapiTextStyles.h4,
                currencyTextStyle: context.skapiTextStyles.gel.copyWith(
                  fontSize: 14,
                  height: 20 / 14,
                ),
              ),
              const SizedBox(width: 6),
              SizedBox(
                width: 20.0,
                height: 20.0,
                child: SvgPicture.asset(
                  SvgAssets.arrowRight,
                  colorFilter: ColorFilter.mode(
                    context.skapiColors.grayDark,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
