import 'package:guia_moteis/data/models/period_model.dart';

import 'discount_mock.dart';

Period mockPeriod() {
  return Period(
    formattedTime: '3 horas',
    time: '3',
    value: 88.0,
    totalValue: 88.0,
    hasCourtesy: false,
    discount: null,
  );
}

List<Period> mockPeriods() {
  return [
    Period(
      formattedTime: '3 horas',
      time: '3',
      value: 88.0,
      totalValue: 88.0,
      hasCourtesy: false,
      discount: null,
    ),
    Period(
      formattedTime: '6 horas',
      time: '6',
      value: 101.0,
      totalValue: 101.0,
      hasCourtesy: false,
      discount: null,
    ),
    Period(
      formattedTime: '12 horas',
      time: '12',
      value: 129.58,
      totalValue: 81.58,
      hasCourtesy: false,
      discount: mockDiscount(),
    ),
  ];
}
