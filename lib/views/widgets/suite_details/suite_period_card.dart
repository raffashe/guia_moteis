import 'package:flutter/material.dart';
import 'package:guia_moteis/data/models/suite_model.dart';
import 'package:guia_moteis/views/widgets/suite_details/period_card_widget.dart';

class SuitePeriodListWidget extends StatelessWidget {
  final Suite suite;

  const SuitePeriodListWidget({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: suite.periods.map((period) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: PeriodCardWidget(
            period: period,
            suite: suite,
          ),
        );
      }).toList(),
    );
  }
}
