import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/common/widgets/radio_button/skapi_radio_button_labels.dart';
import 'package:skapi_obligations/features/obligations/domain/models/common_obligation/upcoming_payment_item.dart';

class SkapiRadioButton extends StatefulWidget {
  const SkapiRadioButton({
    super.key,
    required this.items,
    required this.onChange,
  });

  final List<UpcomingPaymentItem> items;
  final ValueChanged<UpcomingPaymentItem> onChange;

  @override
  State<SkapiRadioButton> createState() => _SkapiRadioButtonState();
}

class _SkapiRadioButtonState extends State<SkapiRadioButton> {
  final ValueNotifier<UpcomingPaymentItem?> _selectedItem = ValueNotifier(null);

  @override
  void dispose() {
    _selectedItem.dispose();
    super.dispose();
  }

  void _onItemChange(UpcomingPaymentItem item) {
    _selectedItem.value = item;
    widget.onChange.call(item);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: <Widget>[
        ...widget.items.map(
          (e) => InkWell(
            onTap: () {
              _onItemChange(e);
            },
            child: Container(
              padding: const EdgeInsets.only(
                left: 12.0,
                top: 10.0,
                right: 16.0,
                bottom: 10.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: context.skapiColors.grayLight),
              ),
              child: Row(
                spacing: 8,
                children: [
                  ValueListenableBuilder(
                    valueListenable: _selectedItem,
                    builder: (context, selectedItem, _) {
                      return Radio<UpcomingPaymentItem>(
                        value: e,
                        fillColor: WidgetStateProperty.all(
                          context.skapiColors.primary,
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        splashRadius: 0,
                        visualDensity: const VisualDensity(
                          vertical: -4,
                          horizontal: -4,
                        ),
                        groupValue: selectedItem,
                        onChanged: (UpcomingPaymentItem? value) {
                          if (value == null) return;
                          _onItemChange(value);
                        },
                      );
                    },
                  ),
                  SkapiRadioButtonLabels(
                    label: context.localization.obligationsGoldLoan,
                    day: e.remainingDays,
                    hasPassed: e.expired,
                  ),
                  Text(
                    '${e.paymentAmount} ${context.localization.currencyGel}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.skapiTextStyles.h4.copyWith(
                      color: context.skapiColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
