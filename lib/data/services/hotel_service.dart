import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/hotel_model.dart';

class HotelService {
  final String baseUrl;

  HotelService({required this.baseUrl});

  Future<Hotel> fetchHotel() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Hotel.fromJson(data['data']['moteis'][0]);
    } else {
      throw Exception('Failed to load hotel data');
    }
  }
}
