import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis/data/models/item_model.dart';
import '../../mocks/item_mock.dart';

void main() {
  group('Item Model', () {
    test('should create Item objects correctly from mock data', () {
      List<Item> items = mockItems();

      expect(items.length, 14);

      expect(items[0].name, "ducha dupla");

      expect(items[13].name, "secador de cabelo");
    });

    test('should create Item from JSON correctly', () {
      Map<String, dynamic> json = {
        'nome': 'WI-FI',
      };

      Item item = Item.fromJson(json);

      expect(item.name, 'WI-FI');
    });
  });
}
