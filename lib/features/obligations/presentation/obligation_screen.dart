import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skapi_obligations/common/extension/error_snackbar_extension.dart';
import 'package:skapi_obligations/common/extension/sum_loan_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/available_amount_section/available_amount_section.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/my_obligations_section/my_obligations_section.dart';
import 'package:skapi_obligations/features/obligations/presentation/widgets/upcoming_payment_section/upcoming_payment_section.dart';

import '../../../common/widgets/appbars/home_appbar.dart';
import 'bloc/obligation_event.dart';
import 'bloc/obligations_bloc.dart';
import 'bloc/obligations_state.dart';

class ObligationScreen extends StatefulWidget {
  const ObligationScreen({super.key});

  @override
  State<ObligationScreen> createState() => _ObligationScreenState();
}

class _ObligationScreenState extends State<ObligationScreen> {
  @override
  void initState() {
    final bloc = context.read<ObligationsBloc>();
    bloc.add(const FetchObligations(ObligationType.other));
    bloc.add(const FetchObligations(ObligationType.gold));
    super.initState();
  }

  double _calculateTotalAmount(ObligationsData state) {
    final otherLoans = state.otherObligations?.loans.loanSum ?? 0.00;
    final goldLoans = state.goldObligations?.loans.loanSum ?? 0.00;
    return otherLoans + goldLoans;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.skapiColors.grayLight,
      appBar: HomeAppBar(
        onMenuPress: () async {},
        onHelpPress: () {},
        onNotificationPress: () {},
      ),
      body: BlocConsumer<ObligationsBloc, ObligationsData>(
        listener: (context, state) {
          if (state.error != null) {
            context.showErrorSnackBar(state.error!);
          }
        },
        builder: (context, state) {
          final isInitialLoading =
              (state.isLoadingOther || state.otherObligations == null) ||
              (state.isLoadingGold || state.goldObligations == null);

          if (isInitialLoading) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: context.skapiColors.primary,
                color: context.skapiColors.primaryLight,
              ),
            );
          }
          return ListView(
            padding: const EdgeInsets.all(20.0),
            children: [
              MyObligationsSection(amount: _calculateTotalAmount(state)),
              AvailableAmountSection(
                amount:
                    state.otherObligations?.transitBalance.toDouble() ?? 0.00,
              ),
              UpcomingPaymentSection(
                otherCustomerData: state.otherObligations!,
                goldCustomerData: state.goldObligations!,
              ),
            ],
          );
        },
      ),
    );
  }
}
