import 'suite_model.dart';

class Hotel {
  final String name;
  final String logo;
  final String neighborhood;
  final double distance;
  final int favoriteCount;
  final List<Suite> suites;
  final int reviewCount;
  final double averageRating;

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
      distance: json['distancia'],
      favoriteCount: json['qtdFavoritos'],
      suites: List<Suite>.from(json['suites'].map((x) => Suite.fromJson(x))),
      reviewCount: json['qtdAvaliacoes'],
      averageRating: json['media'],
    );
  }
}
