import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle _getResponsiveTextStyle(double fontSize,
      FontWeight fontWeight, BuildContext context, Color color) {
    double screenWidth = MediaQuery.of(context).size.width;
    double adjustedFontSize = fontSize * (screenWidth / 375);

    return GoogleFonts.openSans(
      fontSize: adjustedFontSize,
      fontWeight: fontWeight,
      color: color,
      height: 0.64,
    );
  }

  static TextStyle os12Reg(BuildContext context, {required Color color}) {
    return _getResponsiveTextStyle(12, FontWeight.w400, context, color);
  }

  static TextStyle os12SemiBold(BuildContext context, {required Color color}) {
    return _getResponsiveTextStyle(12, FontWeight.w600, context, color);
  }

  static TextStyle os16SemiBold(BuildContext context, {required Color color}) {
    return _getResponsiveTextStyle(16, FontWeight.w600, context, color);
  }

  static TextStyle os24Reg(BuildContext context, {required Color color}) {
    return GoogleFonts.openSans(
      fontSize: 24 * (MediaQuery.of(context).size.width / 375),
      fontWeight: FontWeight.w400,
      color: color,
      height: 0.64,
    );
  }

  static TextStyle os16Reg(BuildContext context, {required Color color}) {
    return _getResponsiveTextStyle(16, FontWeight.w400, context, color);
  }

  static TextStyle os10SemiBold(BuildContext context, {required Color color}) {
    return _getResponsiveTextStyle(10, FontWeight.w600, context, color);
  }
}
