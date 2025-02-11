import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guia_moteis/core/constants/app_card.dart';
import '../../../data/models/suite_model.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class SuiteCardWidget extends StatelessWidget {
  final Suite suite;
  final VoidCallback onPressed;

  const SuiteCardWidget({
    super.key,
    required this.suite,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: screenWidth * SuiteCardStyles.widthFactor,
            decoration: SuiteCardStyles.cardDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(SuiteCardStyles.borderRadius),
                  ),
                  child: Image.network(
                    suite.photos.isNotEmpty ? suite.photos[0] : '',
                    width: screenWidth * SuiteCardStyles.widthFactor,
                    height: screenWidth * SuiteCardStyles.heightFactor,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.broken_image,
                        size: 100,
                        color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: SuiteCardStyles.padding,
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          suite.name,
                          style: AppTextStyles.os16Bold(context,
                              color: AppColors.fontDark),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (suite.quantity <= 3)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/alert.svg',
                              width: 18,
                              height: 18,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Só mais ${suite.quantity} pelo app',
                              style: AppTextStyles.os12Reg(context,
                                  color: AppColors.favSelected),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
