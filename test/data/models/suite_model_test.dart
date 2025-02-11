import 'package:flutter_test/flutter_test.dart';
import '../../mocks/suite_mock.dart';

void main() {
  group('Suite Model Mock Tests', () {
    test('should create a mock Suite with correct data', () {
      final suite = mockSuite();

      expect(suite.name, "Suíte Marselha");
      expect(suite.quantity, 1);
      expect(suite.showAvailableQuantity, true);
      expect(suite.photos.length, 2);
      expect(suite.photos[0],
          "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg");

      expect(suite.items.length, greaterThan(0));
      expect(suite.items[0].name, "Frigobar");

      expect(suite.categoryItems.length, greaterThan(0));
      expect(suite.categoryItems[0].name, "Decoração Erótica");

      expect(suite.periods.length, greaterThan(0));
      expect(suite.periods[0].formattedTime, "3 horas");
      expect(suite.periods[0].value, 88.0);
    });

    test('should create a mock Suite and validate the presence of photos', () {
      final suite = mockSuite();

      expect(
          suite.photos,
          contains(
              "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg"));
    });

    test('should correctly create a mock Item with a name', () {
      final item = mockItem();

      expect(item.name, "Frigobar");
    });

    test('should correctly create a mock CategoryItem with a name and icon',
        () {
      final categoryItem = mockCategoryItem();

      expect(categoryItem.name, "Decoração Erótica");
      expect(categoryItem.icon,
          "https://cdn.guiademoteis.com.br/Images/itens-suites/decoracao-erotica-30-10-2023-11-43.png");
    });

    test('should correctly create a mock Period with formatted time', () {
      final period = mockPeriod();

      expect(period.formattedTime, "3 horas");
      expect(period.value, 88.0);
      expect(period.totalValue, 88.0);
      expect(period.hasCourtesy, false);
    });
  });
}
