import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/hotel_model.dart';

class HotelRepository {
  final String _baseUrl = 'https://api.npoint.io/d2af768bea025ca16c55';

  Future<Hotel> fetchHotel() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Hotel.fromJson(data['data']['moteis'][0]);
    } else {
      throw Exception('Erro ao buscar hotéis');
    }
  }
}
