import 'package:chuck_norris_app/domain/models/joke.dart';
import 'package:chuck_norris_app/domain/providers/repository_provider.dart';
import 'package:chuck_norris_app/domain/repositories/joke_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JokeStateProvider {
  static late StateNotifierProvider<JokesStateNotifier, List<Joke>>
      jokesProvider;

  static Future<void> init() async {
    await _initJokes();
  }

  static Future<void> _initJokes() async {
    jokesProvider = StateNotifierProvider<JokesStateNotifier, List<Joke>>(
      (ref) {
        final provider = JokesStateNotifier(
          ref.read(RepositoriesProviders.jokeLocalRepositoryProvider),
        );
        ref.read(RepositoriesProviders.jokeLocalRepositoryProvider).listen(
          (newState) {
            provider.updateState(newState);
          },
        );
        return provider;
      },
    );
  }
}

class JokesStateNotifier extends StateNotifier<List<Joke>> {
  final JokeRepository localRepository;

  JokesStateNotifier(this.localRepository) : super([]) {
    final jokes = localRepository.getAll();
    updateState(jokes);
  }
  void updateState(List<Joke> newState) => state = newState;
}
