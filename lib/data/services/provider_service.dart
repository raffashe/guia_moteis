import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/hotel_model.dart';
import 'hotel_service.dart';

final hotelServiceProvider = Provider<HotelService>((ref) {
  return HotelService(baseUrl: 'https://api.npoint.io/d2af768bea025ca16c55');
});

final hotelProvider = FutureProvider<Hotel>((ref) async {
  final service = ref.read(hotelServiceProvider);
  return service.fetchHotel();
});
