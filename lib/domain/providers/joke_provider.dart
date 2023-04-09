import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/fetch_joke.dart';
import '../models/joke.dart';

class JokeDataNotifier extends StateNotifier<AsyncValue<Joke>> {
  final StateNotifierProviderRef ref;
  JokeDataNotifier({required this.ref}) : super(const AsyncValue.loading()) {
    fetch(ref);
  }

  Future<void> fetch(ref) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.watch(jokeProvider).fetchJoke());
  }
}

final jokeDataProvider =
    StateNotifierProvider<JokeDataNotifier, AsyncValue<Joke>>((ref) {
  return JokeDataNotifier(ref: ref);
});
