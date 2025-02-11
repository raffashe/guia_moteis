import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:guia_moteis/data/repositories/hotel_repository.dart';
import 'package:guia_moteis/data/models/hotel_model.dart';

void main() {
  group('HotelRepository', () {
    test('Deve conectar com a API e retornar o motel correto', () async {
      final mockResponse = {
        'data': {
          'moteis': [
            {
              'fantasia': 'Motel Le Nid',
              'logo':
                  'https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif',
              'media': 4.6,
              'bairro': 'Chácara Flora - São Paulo',
              'suites': [],
            }
          ]
        }
      };

      final client = MockClient((request) async {
        expect(request.method, 'GET');

        return http.Response(jsonEncode(mockResponse), 200);
      });

      final repository = HotelRepository(httpClient: client);
      final hotel = await repository.fetchHotel();

      expect(hotel, isA<Hotel>());
      expect(hotel.name, 'Motel Le Nid');
      expect(hotel.logo,
          'https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif');
      expect(hotel.neighborhood, 'Chácara Flora - São Paulo');
      expect(hotel.averageRating, 4.6);
    });

    test('Deve lançar uma exceção quando a chamada http falhar', () async {
      final client = MockClient((request) async {
        return http.Response('Erro', 500);
      });

      final repository = HotelRepository(httpClient: client);

      expect(() => repository.fetchHotel(), throwsException);
    });
  });
}
