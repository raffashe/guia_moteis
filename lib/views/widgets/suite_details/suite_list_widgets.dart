import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:guia_moteis/views/widgets/suite_details/suite_cards_widgets.dart';
import 'package:guia_moteis/views/widgets/suite_details/suite_category_item_widget.dart';
import 'package:guia_moteis/views/widgets/suite_details/suite_period_card.dart';

import '../../../viewmodels/hotel_provider.dart';

class SuiteListWidget extends ConsumerWidget {
  final VoidCallback onSuitePressed;

  const SuiteListWidget({super.key, required this.onSuitePressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hotelAsyncValue = ref.watch(hotelProvider);

    return hotelAsyncValue.when(
      data: (hotel) {
        return CarouselSlider(
          options: CarouselOptions(
            height: 800,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            viewportFraction: 0.98,
          ),
          items: hotel.suites.map((suite) {
            return Builder(
              builder: (BuildContext context) {
                return Column(
                  children: [
                    SuiteCardWidget(
                      suite: suite,
                      onPressed: onSuitePressed,
                    ),
                    const SizedBox(height: 10),
                    SuiteCategoryItem(suite: suite),
                    const SizedBox(height: 10),
                    SuitePeriodListWidget(suite: suite),
                  ],
                );
              },
            );
          }).toList(),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(
          valueColor:
              AlwaysStoppedAnimation<Color>(Color(0xFFB0BEC5)), // Cinza claro
        ),
      ),
      error: (error, stackTrace) => Center(child: Text('Erro: $error')),
    );
  }
}
