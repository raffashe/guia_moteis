import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/hotel_model.dart';

class HotelRepository {
  final http.Client httpClient;
  final String _baseUrl = 'https://api.npoint.io/d2af768bea025ca16c55';

  HotelRepository({required this.httpClient});

  Future<Hotel> fetchHotel() async {
    final response = await httpClient.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      final hotelJson = data['data']['moteis'][0];

      hotelJson['media'] = hotelJson['media'] ?? 0.0;

      return Hotel.fromJson(hotelJson);
    } else {
      throw Exception('Erro ao buscar hotéis');
    }
  }
}
