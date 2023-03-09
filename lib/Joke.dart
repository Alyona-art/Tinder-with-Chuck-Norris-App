import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

@JsonSerializable()
class Joke {
  String iconUrl;
  String id;
  String url;
  String value;

  Joke(this.iconUrl, this.id, this.url, this.value);

  Joke.fromJson(Map<String, dynamic> json)
      : iconUrl = json['icon_url'],
        id = json['id'],
        url = json['url'],
        value = json['value'];

  Map<String, dynamic> toJson() => {
        'iconUrl': iconUrl,
        'id': id,
        'url': url,
        'value': value,
  };

  static Future<Joke> fetchData() async {
    var result =
        await http.get(Uri.parse("https://api.chucknorris.io/jokes/random/"));
    return Joke.fromJson(jsonDecode(result.body));
  }
}

