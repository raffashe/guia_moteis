import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:guia_moteis/data/repositories/hotel_repository.dart';
import 'package:guia_moteis/viewmodels/hotel_provider.dart';

void main() {
  group('Hotel Provider Test', () {
    final mockHotelJson = '''
{
  "data": {
    "raio": 0,
    "moteis": [
      {
        "logo": "https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif",
        "media": 4.6,
        "bairro": "Chácara Flora - São Paulo",
        "suites": [],
        "fantasia": "Motel Le Nid",
        "distancia": 28.27,
        "qtdFavoritos": 0,
        "qtdAvaliacoes": 2159
      }
    ]
  },
  "sucesso": true,
  "mensagem": []
}
''';

    test('should fetch hotel successfully', () async {
      final mockHttpClient = MockClient((request) async {
        if (request.url.toString() ==
            'https://api.npoint.io/d2af768bea025ca16c55') {
          return http.Response(mockHotelJson, 200);
        } else {
          return http.Response('Not Found', 404);
        }
      });

      final container = ProviderContainer(overrides: [
        hotelRepositoryProvider
            .overrideWithValue(HotelRepository(httpClient: mockHttpClient)),
      ]);

      final hotel = await container.read(hotelProvider.future);

      expect(hotel.name, 'Motel Le Nid');
      expect(hotel.logo,
          'https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif');
      expect(hotel.neighborhood, 'Chácara Flora - São Paulo');
      expect(hotel.averageRating, 4.6);
    });

    test('should throw exception when fetch hotel fails', () async {
      final mockHttpClient = MockClient((request) async {
        if (request.url.toString() ==
            'https://api.npoint.io/d2af768bea025ca16c55') {
          return http.Response('Error', 500);
        } else {
          return http.Response('Not Found', 404);
        }
      });

      final container = ProviderContainer(overrides: [
        hotelRepositoryProvider
            .overrideWithValue(HotelRepository(httpClient: mockHttpClient)),
      ]);

      expect(container.read(hotelProvider.future), throwsA(isA<Exception>()));
    });
  });
}
