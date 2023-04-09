import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

class ImageNotifier extends StateNotifier<String> {
  ImageNotifier() : super('assets/images/cat1.png');

  List listImages = [
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

  void getImage() {
    int min = 0;
    int max = listImages.length - 1;
    rnd = Random();
    int r = min + rnd.nextInt(max - min);
    state = listImages[r].toString();
  }
}

final imageProvider = StateNotifierProvider<ImageNotifier, String>((ref) {
  return ImageNotifier();
});
