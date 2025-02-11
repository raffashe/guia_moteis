import 'package:guia_moteis/data/models/category_item_model.dart';
import 'package:guia_moteis/data/models/item_model.dart';
import 'package:guia_moteis/data/models/period_model.dart';
import 'package:guia_moteis/data/models/suite_model.dart';

Item mockItem() {
  return Item(name: "Frigobar");
}

CategoryItem mockCategoryItem() {
  return CategoryItem(
    name: "Decoração Erótica",
    icon:
        "https://cdn.guiademoteis.com.br/Images/itens-suites/decoracao-erotica-30-10-2023-11-43.png",
  );
}

Period mockPeriod() {
  return Period(
    formattedTime: "3 horas",
    time: "3",
    value: 88.0,
    totalValue: 88.0,
    hasCourtesy: false,
    discount: null,
  );
}

Suite mockSuite() {
  return Suite(
    name: "Suíte Marselha",
    quantity: 1,
    showAvailableQuantity: true,
    photos: [
      "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg",
      "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_2.jpg",
    ],
    items: [
      mockItem(),
      mockItem(),
    ],
    categoryItems: [
      mockCategoryItem(),
      mockCategoryItem(),
    ],
    periods: [
      mockPeriod(),
      mockPeriod(),
    ],
  );
}
