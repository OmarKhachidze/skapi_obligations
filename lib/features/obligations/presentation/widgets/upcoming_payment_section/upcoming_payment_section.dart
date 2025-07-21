import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skapi_obligations/common/extension/error_snackbar_extension.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/common/widgets/buttons/skapi_icon_button.dart';
import 'package:skapi_obligations/features/obligations/domain/models/gold_obligation/gold_customre_data.dart';
import 'package:skapi_obligations/features/obligations/domain/models/other_obligation/other_customer_data.dart';
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
    required this.otherCustomerData,
    required this.goldCustomerData,
  });

  final OtherCustomerData otherCustomerData;
  final GoldCustomerData goldCustomerData;

  @override
  State<UpcomingPaymentSection> createState() => _UpcomingPaymentSectionState();
}

class _UpcomingPaymentSectionState extends State<UpcomingPaymentSection> {
  final ValueNotifier<bool> _buttonNotifier = ValueNotifier(false);
  UpcomingPaymentItem? selectedItem;

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

  void _openRadioBottomSheet(List<UpcomingPaymentItem> upcomingPaymentItems) {
    DefaultBottomSheet(
      label: context.localization.paymentDetailsChooseWhatToPay,
      buttonLabel: context.localization.paymentDetailsDebtPayment,
      buttonNotifier: _buttonNotifier,
      onPress: () {
        context.pop();
        context.push(
          '${AppRoute.home.path}/${AppRoute.payment.path}',
          extra: selectedItem,
        );
      },
      whenComplete: () {
        selectedItem = null;
        _buttonNotifier.value = false;
      },
      children: SkapiRadioButton(
        items: upcomingPaymentItems,
        onChange: (item) {
          selectedItem = item;
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
          UpcomingPaymentItemWidget(
            label: context.localization.obligationsOtherLoans,
            iconPath: SvgAssets.otherObligations,
            days: widget.otherCustomerData.upcoming.remainingDays,
            amount: widget.otherCustomerData.upcoming.paymentAmount,
            hasPassed: widget.otherCustomerData.upcoming.expired,
            onPress: () {
              context.push('${AppRoute.home.path}/${AppRoute.payment.path}');
            },
          ),
          UpcomingPaymentItemWidget(
            label: context.localization.obligationsGoldLoan,
            iconPath: SvgAssets.goldObligations,
            days: widget.goldCustomerData.upcoming.remainingDays,
            amount: widget.goldCustomerData.upcoming.paymentAmount,
            hasPassed: widget.goldCustomerData.upcoming.expired,
            onPress: () {
              _openRadioBottomSheet(widget.goldCustomerData.upcoming.items);
            },
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
