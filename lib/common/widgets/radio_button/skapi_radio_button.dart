import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';
import 'package:skapi_obligations/common/widgets/radio_button/skapi_radio_button_labels.dart';

class RadioExample<T> extends StatefulWidget {
  const RadioExample({super.key, required this.items, required this.onChange});

  final List<T> items;
  final ValueChanged<T> onChange;

  @override
  State<RadioExample<T>> createState() => _RadioExampleState<T>();
}

class _RadioExampleState<T> extends State<RadioExample<T>> {
  final ValueNotifier<T?> _selectedItem = ValueNotifier(null);

  @override
  void dispose() {
    _selectedItem.dispose();
    super.dispose();
  }

  void _onItemChange(T item) {
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
                      return Radio<T>(
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
                        onChanged: (T? value) {
                          if (value == null) return;
                          _onItemChange(value);
                        },
                      );
                    },
                  ),
                  const SkapiRadioButtonLabels(label: 'ოქროს ლომბარდი', subLabel: 'გადახდა 2 დღეში'),
                  Text(
                    '541.05 ${context.localization.currencyGel}',
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
