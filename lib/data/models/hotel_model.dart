import 'package:guia_moteis/data/models/suite_model.dart';

class Hotel {
  final String name;
  final String logo;
  final String neighborhood;
  final double? distance;
  final int favoriteCount;
  final List<Suite> suites;
  final int reviewCount;
  final double? averageRating;

  Hotel({
    required this.name,
    required this.logo,
    required this.neighborhood,
    required this.distance,
    required this.favoriteCount,
    required this.suites,
    required this.reviewCount,
    required this.averageRating,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      name: json['fantasia'],
      logo: json['logo'],
      neighborhood: json['bairro'],
      distance: json['distancia'] != null
          ? double.parse(json['distancia'].toString())
          : null,
      favoriteCount: json['qtdFavoritos'] ?? 0,
      suites:
          List<Suite>.from(json['suites']?.map((x) => Suite.fromJson(x)) ?? []),
      reviewCount: json['qtdAvaliacoes'] ?? 0,
      averageRating:
          json['media'] != null ? double.parse(json['media'].toString()) : null,
    );
  }
}
