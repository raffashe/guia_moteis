import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guia_moteis/core/constants/app_card.dart';
import 'package:guia_moteis/core/constants/app_colors.dart';
import 'package:guia_moteis/core/constants/app_text_styles.dart';
import 'package:guia_moteis/data/models/suite_model.dart';

class SuiteCategoryItem extends ConsumerWidget {
  final Suite suite;

  const SuiteCategoryItem({super.key, required this.suite});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double cardWidth = screenWidth * SuiteCardStyles.widthFactor;
          double availableWidth = cardWidth - 120;
          int maxIcons = (availableWidth / 50).floor();

          return Container(
            width: cardWidth,
            decoration: SuiteCardStyles.cardDecoration,
            padding: SuiteCardStyles.padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: suite.categoryItems.take(maxIcons).map((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: SuiteCardStyles.iconBoxDecoration,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            item.icon,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error,
                                  size: 40, color: Colors.red);
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return SizedBox(
                                width: 40,
                                height: 40,
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Row(
                  children: [
                    Text(
                      'Ver todos',
                      style: AppTextStyles.os10SemiBold(context,
                          color: AppColors.progressActive),
                    ),
                    const SizedBox(width: 6),
                    SvgPicture.asset(
                      'assets/arrow_down.svg',
                      width: 18,
                      height: 18,
                      colorFilter: const ColorFilter.mode(
                          AppColors.fontTertiary, BlendMode.srcIn),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
