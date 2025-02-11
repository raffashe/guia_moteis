import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/suite_model.dart';
import 'hotel_provider.dart';

final suiteProvider = Provider<List<Suite>>((ref) {
  final hotelAsync = ref.watch(hotelProvider);

  return hotelAsync.when(
    data: (hotel) => hotel.suites,
    loading: () => [],
    error: (err, stack) => [],
  );
});
