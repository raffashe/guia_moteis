import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';

import 'package:logger/logger.dart';

import '../../../viewmodels/hotel_provider.dart';
import 'filter_widget.dart';
import '../hotels_details/hotel_header_widget.dart';
import '../suite_details/suite_list_widgets.dart';

class FilterAndListWidget extends ConsumerStatefulWidget {
  const FilterAndListWidget({super.key});

  @override
  _FilterAndListWidgetState createState() => _FilterAndListWidgetState();
}

class _FilterAndListWidgetState extends ConsumerState<FilterAndListWidget> {
  final Logger logger = Logger();

  @override
  Widget build(BuildContext context) {
    final hotelData = ref.watch(hotelProvider);

    return Container(
      color: AppColors.bgModalSecondary,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            FilterWidget(),
            const Divider(height: 20, color: AppColors.bgModalMain),
            hotelData.when(
              data: (hotel) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 30),
                      child: HotelHeaderWidget(
                        hotel: hotel,
                        onFavoritePressed: () {
                          logger.d('Favorito pressionado para: ${hotel.name}');
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    SuiteListWidget(
                      onSuitePressed: () {
                        logger.d('Clique na suíte');
                      },
                    ),
                  ],
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) =>
                  Center(child: Text('Failed to load hotel data: $error')),
            ),
          ],
        ),
      ),
    );
  }
}
