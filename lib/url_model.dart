import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'url_provider.dart';

class UrlModel {
  static int _id = 0;
  final String title;
  bool isFavorite;
  int id;

  UrlModel({
    required this.title,
    required this.id,
    this.isFavorite = false,
  });

  factory UrlModel.random() {
    return UrlModel(
      // generate a random title
      title: randomLipsum(),
      // generate a random favorite status
      isFavorite: Random().nextBool(),
      // get an id, incrementing the static variable
      id: _id++,
    );
  }

  String get name => title;

  int get item_id => id;

  // creating a new instance of the same product
  UrlModel copyWith({String? title, bool? isFavorite}) {
    return UrlModel(
      title: title ?? this.title,
      isFavorite: isFavorite ?? this.isFavorite,
      id: id,
    );
  }

  void toggleFavorite(WidgetRef ref) {
    // invert the favorite status
    isFavorite = !isFavorite;

    // notify the provider
    ref.read(listStateNotifierProvider.notifier).setFavorite(id, isFavorite);
  }
}

const lipsum = [
  'lorem',
  'ipsum',
  'dolor',
  'sit',
  'amet',
  'consectetur',
  'adipiscing',
];

String randomLipsum() {
  return lipsum[Random().nextInt(lipsum.length)];
}