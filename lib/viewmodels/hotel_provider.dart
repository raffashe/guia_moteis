import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../data/models/hotel_model.dart';
import '../data/repositories/hotel_repository.dart';

final hotelRepositoryProvider = Provider<HotelRepository>((ref) {
  final client = http.Client();
  return HotelRepository(httpClient: client);
});

final hotelProvider = FutureProvider<Hotel>((ref) async {
  final repository = ref.read(hotelRepositoryProvider);
  return repository.fetchHotel();
});
