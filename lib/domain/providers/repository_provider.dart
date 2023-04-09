import 'package:chuck_norris_app/domain/repositories/joke_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class RepositoriesProviders {
  static const String _boxName = 'jokes';

  static late Provider<JokeRepository> jokeLocalRepositoryProvider;

  static Future<void> init() async {
    await _initJoke();
  }

  static Future<void> _initJoke() async {
    final box = await Hive.openBox<String>(_boxName);
    jokeLocalRepositoryProvider = Provider<JokeRepository>(
      (ref) => JokeRepository(box),
    );
  }
}
