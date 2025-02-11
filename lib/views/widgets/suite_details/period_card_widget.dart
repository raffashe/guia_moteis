import 'package:flutter/material.dart';
import 'package:guia_moteis/core/constants/app_card.dart';
import 'package:guia_moteis/core/constants/app_colors.dart';
import 'package:guia_moteis/core/constants/app_text_styles.dart';
import 'package:guia_moteis/data/models/period_model.dart';
import 'package:guia_moteis/data/models/suite_model.dart';

class PeriodCardWidget extends StatelessWidget {
  final Period period;

  const PeriodCardWidget(
      {super.key, required this.period, required Suite suite});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: SuiteCardStyles.cardDecoration,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            period.formattedTime,
            style:
                AppTextStyles.os16Bold(context, color: AppColors.fontPrimary),
          ),
          const SizedBox(height: 4),
          Text(
            'R\$ ${period.totalValue.toStringAsFixed(2)}',
            style: AppTextStyles.os16SemiBold(context,
                color: AppColors.progressActive),
          ),
          if (period.discount != null) ...[
            const SizedBox(height: 4),
            Text(
              'Desconto de ${period.discount!.discount.toStringAsFixed(2)}%',
              style: AppTextStyles.os10SemiBold(context,
                  color: AppColors.fontSecondary),
            ),
          ],
        ],
      ),
    );
  }
}
