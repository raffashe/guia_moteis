import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodels/hotel_provider.dart';
import 'elements/carousel_widget.dart';
import 'filter_details/filter_and_list_widget.dart';

class HomeContent extends ConsumerStatefulWidget {
  const HomeContent({super.key});

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends ConsumerState<HomeContent> {
  @override
  Widget build(BuildContext context) {
    final hotelData = ref.watch(hotelProvider);

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            hotelData.when(
              data: (hotel) {
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    CarouselWidget(hotel: hotel),
                  ],
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFB0BEC5)),
                ),
              ),
              error: (error, stackTrace) =>
                  Center(child: Text('Failed to load hotel data: $error')),
            ),
            const FilterAndListWidget(),
          ],
        ),
      ),
    );
  }
}
