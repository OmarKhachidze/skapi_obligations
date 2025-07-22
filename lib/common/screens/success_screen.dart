import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/route_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/common/widgets/appbars/close_appbar.dart';
import 'package:skapi_obligations/common/widgets/buttons/scaffold_button.dart';
import 'package:skapi_obligations/common/widgets/text/amount_text.dart';
import 'package:skapi_obligations/router/app_route.dart';

import '../constants/app_constants.dart';
import '../constants/svg_assets.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.description,
    required this.amount,
  });

  final String description;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.skapiColors.white,
      appBar: CloseAppBar(
        title: AppRoute.payment.label(context),
        subTitle: AppRoute.home.label(context),
      ),
      bottomNavigationBar: ScaffoldButton(
        label: context.localization.close,
        onPress: () {
          context.go(AppRoute.home.path);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 12,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 12.0,
                ),
                decoration: BoxDecoration(
                  color: context.skapiColors.successLight,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: SvgPicture.asset(
                  SvgAssets.checkCircle,
                  colorFilter: ColorFilter.mode(
                    context.skapiColors.success,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            Text(
              context.localization.successPaymentSuccess,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: context.skapiTextStyles.h3.copyWith(
                fontFamily: notoSans,
                fontFeatures: [const FontFeature.caseSensitiveForms()],
                fontVariations: [const FontVariation('wght', 500)],
                color: context.skapiColors.black,
              ),
            ),
            AmountText(label: description, amount: amount),
          ],
        ),
      ),
    );
  }
}
