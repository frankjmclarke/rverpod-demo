import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'products_provider.dart';

class ProductModel {
  static int _id = 0;

  final String title;
  bool isFavorite;
  int id;

  ProductModel({
    required this.title,
    required this.id,
    this.isFavorite = false,
  });

  factory ProductModel.random() {
    return ProductModel(
      // generate a random title
      title: randomLipsum(),
      // generate a random favorite status
      isFavorite: Random().nextBool(),
      // get an id, incrementing the static variable
      id: _id++,
    );
  }

  // creating a new instance of the same product
  ProductModel copyWith({String? title, bool? isFavorite}) {
    return ProductModel(
      title: title ?? this.title,
      isFavorite: isFavorite ?? this.isFavorite,
      id: id,
    );
  }

  void toggleFavorite(WidgetRef ref) {
    // invert the favorite status
    isFavorite = !isFavorite;

    // notify the provider
    ref.read(productsProvider.notifier).setFavorite(id, isFavorite);
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
