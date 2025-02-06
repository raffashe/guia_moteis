import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guia_moteis/core/constants/app_colors.dart';
import 'package:guia_moteis/core/constants/app_text_styles.dart';
import 'package:flutter_dash/flutter_dash.dart';

class LocationWidget extends StatelessWidget {
  final String location;

  const LocationWidget({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth * 0.06;
    double dashWidth = screenWidth * 0.32;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(location,
                style: AppTextStyles.os12SemiBold(context,
                    color: AppColors.bgCards)),
            SizedBox(width: screenWidth * 0.02),
            SvgPicture.asset(
              'assets/arrow_down.svg',
              width: iconSize,
              height: iconSize,
            ),
          ],
        ),
        SizedBox(height: screenWidth * 0.01),
        Dash(
          direction: Axis.horizontal,
          length: dashWidth,
          dashLength: 2,
          dashThickness: 1,
          dashColor: AppColors.dash,
        ),
      ],
    );
  }
}
