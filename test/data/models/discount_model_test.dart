import 'package:flutter_test/flutter_test.dart';
import '../../mocks/discount_mock.dart';

void main() {
  group('Discount Model Mock Tests', () {
    test('should create a mock Discount with correct value', () {
      final discount = mockDiscount();

      expect(discount.discount, 69.2);
    });
  });
}
