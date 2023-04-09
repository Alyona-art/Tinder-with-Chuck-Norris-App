import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/joke.dart';

class FavoritesNotifier extends StateNotifier<List<Joke>> {
  FavoritesNotifier() : super([]);

  void add(Joke joke) {
    state = [...state, joke];
  }

  void remove(Joke joke) {
    state = [...state.where((element) => element != joke)];
  }
}

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<Joke>>((ref) {
  return FavoritesNotifier();
});
