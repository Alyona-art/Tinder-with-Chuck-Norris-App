import 'package:freezed_annotation/freezed_annotation.dart';

part 'joke.freezed.dart';
part 'joke.g.dart';

@freezed
class Joke with _$Joke {
  factory Joke({
    required String id,
    required String url,
    required String value,
  }) = _Joke;

  factory Joke.fromJson(Map<String, dynamic> json) => _$JokeFromJson(json);
}
