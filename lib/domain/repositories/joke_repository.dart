import 'package:hive/hive.dart';
import 'dart:convert';
import '../../domain/models/joke.dart';

class JokeRepository {
  final Box<String> box;

  const JokeRepository(this.box);

  void listen(void Function(List<Joke> state) callback) {
    box.watch().listen((event) {
      final state = getAll();
      callback(state);
    });
  }

  List<Joke> _decodeJokes(Iterable<String> values) {
    return values.map((e) => Joke.fromJson(jsonDecode(e))).toList();
  }

  List<Joke> getAll() {
    final jokes = _decodeJokes(box.values);
    return jokes;
  }

  void add(Joke obj) {
    box.put(obj.id, jsonEncode(obj.toJson()));
  }

  void delete(String id) {
    box.delete(id);
  }
}
