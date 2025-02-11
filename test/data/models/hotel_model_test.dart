import 'package:flutter_test/flutter_test.dart';
import '../../mocks/hotel_mock.dart';

void main() {
  group('Hotel Model Test', () {
    test('should correctly create a Hotel object from JSON', () {
      final hotel = mockHotel();

      expect(hotel.name, 'Le Nid');
      expect(hotel.logo,
          'https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif');
      expect(hotel.neighborhood, 'Chácara Flora - São Paulo');
      expect(hotel.distance, 5.0);
      expect(hotel.favoriteCount, 125);
      expect(hotel.reviewCount, 75);
      expect(hotel.averageRating, 4.6);

      expect(hotel.suites.length, 1);

      final suite = hotel.suites[0];
      expect(suite.name, 'Suíte Marselha s/ garagem privativa');
      expect(suite.quantity, 1);
      expect(suite.photos.length, 4);
      expect(suite.photos[0],
          'https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg');

      expect(suite.items.isEmpty, true);
      expect(suite.categoryItems.isEmpty, true);

      expect(suite.periods.isEmpty, true);
    });
  });
}
