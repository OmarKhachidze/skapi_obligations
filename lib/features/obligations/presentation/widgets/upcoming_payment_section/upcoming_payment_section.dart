import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skapi_obligations/common/extension/error_snackbar_extension.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/common/widgets/buttons/skapi_icon_button.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/upcoming_payment_section/upcoming_payment_item_widget.dart';
import 'package:skapi_obligations/router/app_route.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../../common/constants/svg_assets.dart';
import '../../../../../common/widgets/bottom_sheets/skapi_bottom_sheet.dart';
import '../../../../../common/widgets/radio_button/skapi_radio_button.dart';
import '../../../domain/models/common_obligation/upcoming_payment_item.dart';
import '../../bloc/obligation_event.dart';
import '../../bloc/obligations_bloc.dart';
import '../../bloc/obligations_state.dart';

class UpcomingPaymentSection extends StatefulWidget {
  const UpcomingPaymentSection({
    super.key,
    required this.otherUpcomingPayments,
    required this.goldUpcomingPayments,
  });

  final List<UpcomingPaymentItem> otherUpcomingPayments;
  final List<UpcomingPaymentItem> goldUpcomingPayments;

  @override
  State<UpcomingPaymentSection> createState() => _UpcomingPaymentSectionState();
}

class _UpcomingPaymentSectionState extends State<UpcomingPaymentSection> {
  final ValueNotifier<bool> _buttonNotifier = ValueNotifier(false);

  @override
  void dispose() {
    _buttonNotifier.dispose();
    super.dispose();
  }

  void _openPdfBottomSheet(List<int> bytes) {
    DefaultBottomSheet(
      label: context.localization.obligationsUpcomingPdf,
      buttonLabel: context.localization.close,
      onPress: () {
        context.pop();
      },
      children: SizedBox(
        height: 300.0,
        child: SfPdfViewer.memory(Uint8List.fromList(bytes)),
      ),
    ).show(context);
  }

  void _openRadioBottomSheet() {
    DefaultBottomSheet(
      label: context.localization.paymentDetailsChooseWhatToPay,
      buttonLabel: context.localization.paymentDetailsDebtPayment,
      buttonNotifier: _buttonNotifier,
      onPress: () {
        context.pop();
        context.push(
          '${AppRoute.home.path}/${AppRoute.payment.path}',
          extra: true,
        );
      },
      whenComplete: () => _buttonNotifier.value = false,
      children: SkapiRadioButton(
        items: const [],
        onChange: (item) {
          _buttonNotifier.value = true;
        },
      ),
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: context.skapiColors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              context.localization.obligationsUpcomingPayments,
              style: context.skapiTextStyles.h3.copyWith(
                fontFeatures: [const FontFeature.caseSensitiveForms()],
                color: context.skapiColors.black,
              ),
            ),
          ),
          ...widget.otherUpcomingPayments.map(
            (e) => UpcomingPaymentItemWidget(
              label: context.localization.obligationsOtherLoans,
              iconPath: SvgAssets.otherObligations,
              days: e.remainingDays,
              amount: e.paymentAmount,
              hasPassed: e.expired,
              onPress: () {
                context.push('${AppRoute.home.path}/${AppRoute.payment.path}');
              },
            ),
          ),
          ...widget.goldUpcomingPayments.map(
            (e) => UpcomingPaymentItemWidget(
              label: context.localization.obligationsGoldLoan,
              iconPath: SvgAssets.goldObligations,
              days: e.remainingDays,
              amount: e.paymentAmount,
              hasPassed: e.expired,
              onPress: () {
                _openRadioBottomSheet();
              },
            ),
          ),
          BlocConsumer<ObligationsBloc, ObligationsData>(
            listener: (context, state) {
              if (state.transactions != null && !state.isLoadingTransactions) {
                _openPdfBottomSheet(state.transactions!);
              }
              if (state.error != null) {
                context.showErrorSnackBar(state.error!);
              }
            },
            builder: (context, state) {
              final isLoading = state.isLoadingTransactions;
              return Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: SkapiIconButton(
                  loading: isLoading,
                  label: context.localization.obligationsUpcomingPdfPrepare,
                  iconPath: SvgAssets.listAlt,
                  onPress: () {
                    context.read<ObligationsBloc>().add(
                      const FetchObligations(ObligationType.transactions),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
