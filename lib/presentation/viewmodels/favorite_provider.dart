import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/hotel_model.dart';

final favoriteHotelsProvider =
    StateNotifierProvider<FavoriteHotelsNotifier, List<Hotel>>((ref) {
  return FavoriteHotelsNotifier();
});

class FavoriteHotelsNotifier extends StateNotifier<List<Hotel>> {
  FavoriteHotelsNotifier() : super([]);

  void toggleFavorite(Hotel hotel) {
    if (state.contains(hotel)) {
      state = state.where((h) => h != hotel).toList();
    } else {
      state = [...state, hotel];
    }
  }

  bool isFavorite(Hotel hotel) {
    return state.contains(hotel);
  }
}
