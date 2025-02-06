import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guia_moteis/core/constants/app_colors.dart';
import 'package:guia_moteis/core/constants/app_text_styles.dart';

class SegmentedControls extends StatelessWidget {
  const SegmentedControls({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double containerWidth = screenWidth < 230 ? 230 : screenWidth * 0.6;
    double containerHeight = MediaQuery.of(context).size.height * 0.06;

    return Container(
      width: containerWidth,
      height: containerHeight,
      padding: EdgeInsets.only(right: containerWidth * 0.02),
      decoration: ShapeDecoration(
        color: AppColors.favSelected,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: containerWidth * 0.05,
                vertical: containerHeight * 0.2,
              ),
              decoration: ShapeDecoration(
                color: AppColors.bgCards,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/ir_agora.svg',
                    width: containerHeight * 0.4,
                    height: containerHeight * 0.4,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'ir agora',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.os12SemiBold(context,
                        color: AppColors.fontDark),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: containerHeight * 0.18,
              ),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/calendar_check.svg',
                    width: containerHeight * 0.4,
                    height: containerHeight * 0.4,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'ir outro dia',
                    textAlign: TextAlign.right,
                    style: AppTextStyles.os12SemiBold(
                        color: AppColors.bgCards, context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
