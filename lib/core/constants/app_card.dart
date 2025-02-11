import 'package:flutter/material.dart';
import 'app_colors.dart';

class SuiteCardStyles {
  static const double widthFactor = 0.96;
  static const double heightFactor = 0.6;
  static const double borderRadius = 10.0;
  static const EdgeInsets padding = EdgeInsets.all(8.0);

  static BoxDecoration cardDecoration = BoxDecoration(
    color: AppColors.bgCards,
    borderRadius: BorderRadius.circular(borderRadius),
  );

  static BoxDecoration iconBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(6),
    boxShadow: [
      BoxShadow(
        color: AppColors.bgModalMain,
        blurRadius: 1,
        offset: Offset(0, 2),
      ),
    ],
  );
}
