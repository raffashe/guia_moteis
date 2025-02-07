import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:guia_moteis/core/constants/app_colors.dart';
import 'package:guia_moteis/presentation/widgets/header_widget.dart';
import 'package:guia_moteis/presentation/widgets/location_widget.dart';
import 'package:guia_moteis/presentation/widgets/product_card_gallery_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../data/services/provider_service.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hotelData = ref.watch(hotelProvider);
    final Logger logger = Logger();

    logger.i('HomePage loaded');

    return Scaffold(
      backgroundColor: AppColors.redPrimary,
      body: Column(
        children: [
          HeaderWidget(),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: LocationWidget(location: 'minha localização'),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                color: AppColors.bgModalMain,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  hotelData.when(
                    data: (hotel) {
                      return Column(
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              autoPlay: true,
                              enlargeCenterPage: true,
                              aspectRatio: 20 / 9,
                              viewportFraction: 0.9,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                            ),
                            items: hotel.suites.map((suite) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return ProductCardGalleryWidget(
                                    hotel: hotel,
                                    period: suite.periods.first,
                                    onPressed: () {
                                      logger.d(
                                          'Reservar button pressed for: ${hotel.name}');
                                    },
                                  );
                                },
                              );
                            }).toList(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: hotel.suites.map((suite) {
                              int index = hotel.suites.indexOf(suite);
                              return Container(
                                width: 8.0,
                                height: 8.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentIndex == index
                                      ? AppColors.fontSecondary
                                      : Colors.grey,
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, stackTrace) => Center(
                      child: Text('Failed to load hotel data: $error'),
                    ),
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
