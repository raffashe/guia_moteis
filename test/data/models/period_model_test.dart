import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis/data/models/period_model.dart';
import '../../mocks/discount_mock.dart';
import '../../mocks/period_mock.dart';

void main() {
  group('Period Model Mock Tests', () {
    test('should create a mock Period with correct values', () {
      final period = mockPeriod();

      expect(period.formattedTime, '3 horas');
      expect(period.time, '3');
      expect(period.value, 88.0);
      expect(period.totalValue, 88.0);
      expect(period.hasCourtesy, false);
      expect(period.discount, null);
    });

    test('should create mock periods list with correct values', () {
      final periods = mockPeriods();

      expect(periods.length, 3);

      expect(periods[0].formattedTime, '3 horas');
      expect(periods[0].time, '3');
      expect(periods[0].value, 88.0);
      expect(periods[0].totalValue, 88.0);
      expect(periods[0].hasCourtesy, false);
      expect(periods[0].discount, null);

      expect(periods[2].formattedTime, '12 horas');
      expect(periods[2].value, 129.58);
      expect(periods[2].totalValue, 81.58);
      expect(periods[2].discount?.discount, 69.2);
    });

    test('should create Period with discount correctly', () {
      final periodWithDiscount = Period(
        formattedTime: '12 horas',
        time: '12',
        value: 129.58,
        totalValue: 81.58,
        hasCourtesy: false,
        discount: mockDiscount(),
      );

      expect(periodWithDiscount.discount?.discount, 69.2);
    });
  });
}
