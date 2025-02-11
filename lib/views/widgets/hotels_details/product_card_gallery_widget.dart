import 'package:flutter/material.dart';
import 'package:guia_moteis/core/constants/app_colors.dart';
import 'package:guia_moteis/core/constants/app_text_styles.dart';
import 'package:logger/logger.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/models/hotel_model.dart';
import '../../../data/models/period_model.dart';

class ProductCardGalleryWidget extends StatelessWidget {
  final Hotel hotel;
  final Period period;
  final VoidCallback onPressed;

  final Logger _logger = Logger();

  ProductCardGalleryWidget({
    super.key,
    required this.hotel,
    required this.period,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    _logger.i('Building product card: ${hotel.name}');

    final double screenWidth = MediaQuery.of(context).size.width;
    final double buttonHeight = screenWidth * 0.08;

    return Container(
      width: screenWidth * 0.96,
      decoration: BoxDecoration(
        color: AppColors.bgCards,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                hotel.logo,
                width: screenWidth * 0.4,
                height: screenWidth * 0.4,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/fire.svg',
                        width: 18,
                        height: 18,
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hotel.name,
                              style: AppTextStyles.os16Bold(context,
                                  color: AppColors.fontDark),
                            ),
                            Text(
                              hotel.neighborhood,
                              style: AppTextStyles.os12Reg(context,
                                  color: AppColors.fontSecondary),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          period.discount?.discount.toString() ??
                              'Sem desconto',
                          style: AppTextStyles.os12SemiBold(context,
                                  color: AppColors.fontPrimary)
                              .copyWith(decoration: TextDecoration.underline),
                        ),
                        Divider(
                          color: AppColors.bgCards,
                          height: 16,
                          thickness: 1,
                          indent: 1,
                          endIndent: 1,
                        ),
                        Text(
                          'R\$ ${period.totalValue.toStringAsFixed(2)}',
                          style: AppTextStyles.os12Reg(context,
                              color: AppColors.fontSecondary),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _logger.d(
                          'Reserve button pressed for product: ${hotel.name}');
                      onPressed();
                    },
                    child: Container(
                      width: screenWidth * 0.96,
                      height: buttonHeight,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1ABA8E),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'reservar',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.os12SemiBold(context,
                                color: AppColors.bgCards),
                          ),
                          SizedBox(width: 6),
                          SvgPicture.asset(
                            'assets/arrow_forward.svg',
                            width: 10,
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
