import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/hotel_model.dart';
import '../../data/repositories/hotel_repository.dart';

final hotelRepositoryProvider = Provider<HotelRepository>((ref) {
  return HotelRepository();
});

final hotelProvider = FutureProvider<Hotel>((ref) async {
  final repository = ref.read(hotelRepositoryProvider);
  return repository.fetchHotel();
});
