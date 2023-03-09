import 'package:flutter/material.dart';
import 'dart:math';
import 'Joke.dart';

class MyAppState extends ChangeNotifier {
  var current = "";

  void getNext() {
    Joke.fetchData().then((joke) {
      current = joke.value;
      notifyListeners();
    });
  }

  dynamic listImages = [
    'assets/images/cat1.png',
    'assets/images/cat2.png',
    'assets/images/cat3.png',
    'assets/images/cat4.png',
    'assets/images/cat5.png',
    'assets/images/cat6.png',
    'assets/images/cat7.png',
    'assets/images/cat8.png',
    'assets/images/cat9.png',
    'assets/images/cat10.png',
  ];
  late Random rnd;
  String imageName = "";

  void getImage() {
    int min = 0;
    int max = listImages.length - 1;
    rnd = Random();
    int r = min + rnd.nextInt(max - min);
    imageName = listImages[r].toString();
    notifyListeners();
  }

  var favorites = <String>[];

  void toggleFavorite(current) {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }

  void removeFavorite(String joke) {
    favorites.remove(joke);
    notifyListeners();
  }
}
