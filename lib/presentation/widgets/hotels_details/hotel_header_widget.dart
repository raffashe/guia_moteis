import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guia_moteis/core/constants/app_colors.dart';
import 'package:guia_moteis/core/constants/app_text_styles.dart';

import '../../../data/models/hotel_model.dart';

class HotelHeaderWidget extends StatelessWidget {
  final Hotel hotel;
  final VoidCallback onFavoritePressed;

  const HotelHeaderWidget({
    super.key,
    required this.hotel,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 5, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              hotel.logo,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotel.name,
                    style: AppTextStyles.os20Reg(context,
                        color: AppColors.fontDark),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6),
                  Text(
                    '${hotel.distance.toStringAsFixed(1)} km • ${hotel.neighborhood}',
                    style: AppTextStyles.os12Reg(context,
                        color: AppColors.fontSecondary),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: onFavoritePressed,
            child: SvgPicture.asset(
              'assets/favorite.svg',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}
