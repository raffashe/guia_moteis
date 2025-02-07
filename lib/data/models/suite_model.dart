import 'category_item_model.dart';
import 'item_model.dart';
import 'period_model.dart';

class Suite {
  final String name;
  final int quantity;
  final bool showAvailableQuantity;
  final List<String> photos;
  final List<Item> items;
  final List<CategoryItem> categoryItems;
  final List<Period> periods;

  Suite({
    required this.name,
    required this.quantity,
    required this.showAvailableQuantity,
    required this.photos,
    required this.items,
    required this.categoryItems,
    required this.periods,
  });

  factory Suite.fromJson(Map<String, dynamic> json) {
    return Suite(
      name: json['nome'],
      quantity: json['qtd'],
      showAvailableQuantity: json['exibirQtdDisponiveis'],
      photos: List<String>.from(json['fotos']),
      items: List<Item>.from(json['itens'].map((x) => Item.fromJson(x))),
      categoryItems: List<CategoryItem>.from(
          json['categoriaItens'].map((x) => CategoryItem.fromJson(x))),
      periods:
          List<Period>.from(json['periodos'].map((x) => Period.fromJson(x))),
    );
  }
}
