import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/joke.dart';

class FetchJoke {
  String endpoint = "https://api.chucknorris.io/jokes/random/";
  Future<Joke> fetchJoke() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return Joke.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final jokeProvider = Provider<FetchJoke>((ref) => FetchJoke());
